require File.expand_path('base', File.dirname(__FILE__))

class VerseExtension < VerseMemberBase
  FOLDER_PREFIX = "EX"
  TYPE="Extension"
  MARKDOWN_PREFIX = "### エクステンション"
end

def extension?(type)
  type == VerseExtension::TYPE
end
