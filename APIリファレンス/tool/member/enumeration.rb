require File.expand_path('base', File.dirname(__FILE__))

class VerseEnumeration < VerseMemberBase
  FOLDER_PREFIX = "EN"
  TYPE="Enumeration"
  MARKDOWN_PREFIX = "### 列挙体"
end

def enumeration?(type)
  type == VerseEnumeration::TYPE
end
