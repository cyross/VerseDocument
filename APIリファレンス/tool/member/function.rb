require File.expand_path('base', File.dirname(__FILE__))

class VerseFunction < VerseMemberBase
  FOLDER_PREFIX = "F"
  TYPE="Function"
  MARKDOWN_PREFIX = "### 関数"
end

def function?(type)
  type == VerseFunction::TYPE
end
