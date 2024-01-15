require File.expand_path('base', File.dirname(__FILE__))

class VerseStruct < VerseMemberBase
  FOLDER_PREFIX = "S"
  TYPE = "Structure"
  MARKDOWN_PREFIX = "### 構造体"
end

def struct?(type)
  type == VerseStruct::TYPE
end
