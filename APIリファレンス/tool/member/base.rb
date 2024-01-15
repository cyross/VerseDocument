class VerseMemberBase
  FOLDER_PREFIX = "MEMBER"
  TYPE = "Member"
  MARKDOWN_PREFIX = "## メンバー"
  MARKDOWN_TEMPLATE = <<'EOS'
%%_PREFIX_%%

%%_LINKS_%%
EOS

  def self.to_markdown(lines)
    self::MARKDOWN_TEMPLATE
      .gsub("%%_PREFIX_%%",self::MARKDOWN_PREFIX)
      .gsub("%%_LINKS_%%", lines.join("\n"))
  end

  attr_reader :name, :members

  def initialize(name)
    @name = name
  end
end
