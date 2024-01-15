require File.expand_path('base', File.dirname(__FILE__))

class VerseInterface < VerseMemberBase
  FOLDER_PREFIX = "I"
  TYPE = "Interface"
  MARKDOWN_PREFIX = "### インターフェース"
end

def interface?(type)
  type == VerseInterface::TYPE
end
