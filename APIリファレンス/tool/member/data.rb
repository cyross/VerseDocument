require File.expand_path('base', File.dirname(__FILE__))

class VerseData < VerseMemberBase
  FOLDER_PREFIX = "D"
  TYPE="Data"
  MARKDOWN_PREFIX = "### データ"
end

def data?(type)
  type == VerseData::TYPE
end
