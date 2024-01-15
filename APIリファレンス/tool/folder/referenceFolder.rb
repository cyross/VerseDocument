require File.expand_path('../member/init', File.dirname(__FILE__))
require File.expand_path('../md/desc', File.dirname(__FILE__))
require File.expand_path('../md/main', File.dirname(__FILE__))

class AnalizeResult
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end
end

class VerseAPIReferenceFolder
  ESCAPE_TO_SYMBOL = {
    "-lpar-"  => "(",
    "-rpar-" => ")",
    "-lsbr-" => "[",
    "-rsbr-" => "]",
    "-labr-" => "<",
    "-rabr-" => ">",
    "-lcbr-" => "{",
    "-rcbr-" => "}",
    "-colon-" => ":",
    "-semiocolon-" => ";",
    "-equal-" => "=",
    "-plus-" => "+",
    "-minus-" => "-",
    "-aster-" => "*",
    "-slash-" => "/",
    "-bslash-" => "\\",
    "-comma-" => ",",
    "-question-" => "?",
    "-singlequote-" => "'",
    "-doublequote-" => "\"",
  }

  def self.analyze_folder(folder_name)
    pair = folder_name.split('_', 2)
    name = ESCAPE_TO_SYMBOL.keys.reduce(pair[1]) {| result, item |
      result.gsub(item, ESCAPE_TO_SYMBOL[item])
    }

    return AnalizeResult.new(pair[0], name)
  end

  attr_accessor :parent
  attr_reader :path, :directories, :directory, :type_prefix, :children

  def initialize(path)
    @path = path
    @directories = path.split("/").filter{|directory| directory != ".."}
    @directory = @directories.last

    result = VerseAPIReferenceFolder::analyze_folder(@directories[-1])

    @type_prefix = result.type
    @member = prefix_to_member(@type_prefix, result.name)
    @parent = nil
    @children = []
  end

  def name
    @member.name
  end

  def type
    @member.class::TYPE
  end

  def parent_key
    @directories.slice(0,@directories.length-1).join("/")
  end

  def key
    @directories.join("/")
  end

  def depth
    @directories.length
  end

  def inspect
    "[[#{self.type}]]#{self.name}"
  end

  def out(indent = "")
    puts indent + self.inspect
    @children.each{|child|
      child.out(indent + ">")
    }
  end

  def generate
    main_file_path = File.join(@path, MarkdownMainMd::FILENAME)

    puts "Generate #{main_file_path}..."

    link = [MarkdownMainMd::TO_UPPER_LINK_LINE, MarkdownMainMd::TO_TOP_LINK_LINE].join("\n")

    import_directory = "/" + get_parent_modules.join("/")
    import_line = MarkdownMainMd::IMPORT_LINES.gsub("%%_PATH_%%", import_directory)

    desc_line = MarkdownMainMd::DESC_LINES.gsub("%%_DESC_%%", self.get_desc_file_line)

    member_lines = []

    children_modules = self.generate_member_lines_by_type(method(:module?))
    member_lines << VerseModule.to_markdown(children_modules) if not children_modules.empty?

    children_classes = self.generate_member_lines_by_type(method(:class?))
    member_lines << VerseClass.to_markdown(children_classes) if not children_classes.empty?

    children_structs = self.generate_member_lines_by_type(method(:struct?))
    member_lines << VerseStruct.to_markdown(children_structs) if not children_structs.empty?

    children_interfaces = self.generate_member_lines_by_type(method(:interface?))
    member_lines << VerseInterface.to_markdown(children_interfaces) if not children_interfaces.empty?

    children_enumerations = self.generate_member_lines_by_type(method(:enumeration?))
    member_lines << VerseEnumeration.to_markdown(children_enumerations) if not children_enumerations.empty?

    children_extensions = self.generate_member_lines_by_type(method(:extension?))
    member_lines << VerseExtension.to_markdown(children_extensions) if not children_extensions.empty?

    children_functions = self.generate_member_lines_by_type(method(:function?))
    member_lines << VerseFunction.to_markdown(children_functions) if not children_functions.empty?

    children_data = self.generate_member_lines_by_type(method(:data?))
    member_lines << VerseData.to_markdown(children_data) if not children_data.empty?

    member_line = "(メンバーなし)\n"

    if not member_lines.empty?
      member_line = member_lines.join("\n")
    end

    member_line = MarkdownMainMd::MEMBER_LINES.gsub("%% MEMBER_DATA %%", member_line)

    template = MarkdownMainMd::TEMPLATE_LINES
    template = template.gsub("%%_FILETYPE_%%", self.type)
    template = template.gsub("%%_FULLNAME_%%", self.get_fullname)
    template = template.gsub("%%_LINK_%%", link)
    template = template.gsub("%%_IMPORT_%%", import_line)
    template = template.gsub("%%_DESC_%%", desc_line)
    template = template.gsub("%%_MEMBER_%%", member_line)
    template = template.gsub(/\n{2,}/, "\n")
    template = template.gsub(/\n{1}/, "\n\n")
    template = template.gsub(/\n{2,}$/, "\n")

    File.open(main_file_path, "w"){|f|
      f.write(template)
    }

    @children.each{|child|
      child.generate
    }
  end

private
  def get_desc_file_line
    desc_file_path = File.join(@path, MarkdownDescMd::FILENAME)

    if not File.exist?(desc_file_path)
      return "(説明無し)\n\n"
    end

    File.open(desc_file_path, "r"){|f|
      data = f.readlines(chomp: true)

      if data.length == 0 || data[0] == "# (TBD)"
        return "(説明無し)\n\n"
      end

      return data.map{|line|
        if line.length > 2 && line[0..1] == "# "
          line.slice(1, line.length - 1)
        elsif line.length > 2 && line[0..1] == "##"
          "#" + line
        else
          line
        end
      }.join("\n")
    }
  end

  def generate_member_lines_by_type(type_check_func)
    @children.filter{|child| type_check_func.call(child.type)}.map{|child|
      "- [#{child.name}](./#{child.directory}/#{MarkdownMainMd::FILENAME})"
    }
  end

  def get_parent_modules
    modules = []
    parent = @parent

    while parent != nil
      if module?(parent.type)
        modules << parent.name
      end

      parent = parent.parent
    end

    modules.reverse
  end

  def get_fullname
    names = [self.name]
    parent = @parent

    while parent != nil
      names << parent.name

      parent = parent.parent
    end

    "/#{names.reverse.join('/')}"
  end
end

class VerseAPIReferenceFolderManager
  attr_reader :roots

  def initialize()
    @folders = []
    @folder_hash = {}
    @roots = []
  end

  def add(folder_obj)
    @folders << folder_obj
    @folder_hash[folder_obj.name] = folder_obj

    self.organize(folder_obj)
  end

  def generate
    @roots.each{|root|
      root.generate
    }
  end

  private
    def organize(folder_obj)
      if folder_obj.directories.length == 1
        self.organize_root(folder_obj)

        return
      end

      @folders.each{|folder|
        if folder.parent_key == folder_obj.key
          # 対象フォルダーが親フォルダー
          folder.parent = folder_obj

          folder_obj.children << folder
        elsif folder_obj.parent_key == folder.key
          # 対象フォルダーが子フォルダー
          folder_obj.parent = folder

          folder.children << folder_obj
        end
      }
    end

    def organize_root(folder_obj)
      @roots << folder_obj

      @folders.each{|folder|
        if folder.depth == 2 && folder.parent_key == folder_obj.key
          # 対象フォルダーが親フォルダー
          folder.parent = folder_obj

          folder_obj.children << folder
        end
      }
    end
end
