require File.expand_path('base', File.dirname(__FILE__))

class VerseModule < VerseMemberBase
  FOLDER_PREFIX = "M"
  TYPE = "Module"
  MARKDOWN_PREFIX = "### モジュール"
end

def module?(type)
  type == VerseModule::TYPE
end
