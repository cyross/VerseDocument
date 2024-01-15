require File.expand_path('base', File.dirname(__FILE__))

class VerseClass < VerseMemberBase
  FOLDER_PREFIX = "C"
  TYPE = "Class"
  MARKDOWN_PREFIX = "### クラス"
end

def class?(type)
  type == VerseClass::TYPE
end
