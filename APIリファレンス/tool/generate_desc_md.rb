require File.expand_path('folder/referenceFolder', File.dirname(__FILE__))
require File.expand_path('member/init', File.dirname(__FILE__))
require File.expand_path('md/template', File.dirname(__FILE__))
require File.expand_path('md/desc', File.dirname(__FILE__))
require File.expand_path('md/main', File.dirname(__FILE__))

TARGET_PATHES = ["../M_Fortnite.com/**/*", "../M_UnrealEngine.com/**/*", "../M_Verse.org/**/*"]

# desc.mdが存在しない、先頭行が空文字列、# (TBD) のときは再生成
def is_target_of_write(path)
  return true if not File.exist?(path)

  File.open(path, "r"){|f|
    data = f.readlines(chomp: true)

    if data.length == 0 || data[0] === "" || data[0] == "# (TBD)"
      return true
    end

    false
  }
end

def main
  Dir.glob(TARGET_PATHES).each{|path|
    if not File.file?(path)
      desc_file_path = File.expand_path(MarkdownDescMd::FILENAME, path)

      puts "Generate [#{desc_file_path}]..."

      if is_target_of_write(desc_file_path)
        pathes = path.split("/")
        types = pathes[-1].split("_", 2)
        if not FOLDER_PREFIXES.include?(types[0])
          puts "[Usage]:" + types[0] + " : " + path
        else
          File.open(desc_file_path, "w") { |f|
            case types[0]
            when VerseModule::FOLDER_PREFIX then
              f.write(MarkdownDescMd::MODULE_TEMPLATE_LINES)
            when VerseClass::FOLDER_PREFIX then
              f.write(MarkdownDescMd::CLASS_TEMPLATE_LINES)
            when VerseStruct::FOLDER_PREFIX then
              f.write(MarkdownDescMd::STRUCT_TEMPLATE_LINES)
            when VerseInterface::FOLDER_PREFIX then
              f.write(MarkdownDescMd::INTERFACE_TEMPLATE_LINES)
            when VerseEnumeration::FOLDER_PREFIX then
              f.write(MarkdownDescMd::ENUMERATION_TEMPLATE_LINES)
            when VerseExtension::FOLDER_PREFIX then
              name = VerseAPIReferenceFolder.format_name(types[1])
              desc = MarkdownDescMd::EXTENSION_TEMPLATE_LINES.gsub("%%_NAME_%%", name)
              f.write(desc)
            when VerseFunction::FOLDER_PREFIX then
              name = VerseAPIReferenceFolder.format_name(types[1])
              desc = MarkdownDescMd::FUNCTION_TEMPLATE_LINES.gsub("%%_NAME_%%", name)
              f.write(desc)
            when VerseData::FOLDER_PREFIX then
              f.write(MarkdownDescMd::DATA_TEMPLATE_LINES)
            end
          }
        end
      end
    end
  }
end

main
