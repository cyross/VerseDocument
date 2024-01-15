require File.expand_path('module', File.dirname(__FILE__))
require File.expand_path('class', File.dirname(__FILE__))
require File.expand_path('struct', File.dirname(__FILE__))
require File.expand_path('interface', File.dirname(__FILE__))
require File.expand_path('enumeration', File.dirname(__FILE__))
require File.expand_path('extension', File.dirname(__FILE__))
require File.expand_path('function', File.dirname(__FILE__))
require File.expand_path('data', File.dirname(__FILE__))

FOLDER_PREFIXES = [
  VerseModule::FOLDER_PREFIX,
  VerseClass::FOLDER_PREFIX,
  VerseStruct::FOLDER_PREFIX,
  VerseInterface::FOLDER_PREFIX,
  VerseEnumeration::FOLDER_PREFIX,
  VerseExtension::FOLDER_PREFIX,
  VerseFunction::FOLDER_PREFIX,
  VerseData::FOLDER_PREFIX,
]

def prefix_to_member(prefix, name)
  case prefix
    when VerseModule::FOLDER_PREFIX then
      return VerseModule.new(name)
    when VerseClass::FOLDER_PREFIX then
      return VerseClass.new(name)
    when VerseStruct::FOLDER_PREFIX then
      return VerseStruct.new(name)
    when VerseInterface::FOLDER_PREFIX then
      return VerseInterface.new(name)
    when VerseEnumeration::FOLDER_PREFIX then
      return VerseEnumeration.new(name)
    when VerseExtension::FOLDER_PREFIX then
      return VerseExtension.new(name)
    when VerseFunction::FOLDER_PREFIX then
      return VerseFunction.new(name)
    when VerseData::FOLDER_PREFIX then
      return VerseData.new(name)
  end
end

def has_prefix(path)
  directories = path.split("/").filter{|directory| directory != "." || directory != ".."}

  pair = directories[-1].split("_", 2)

  FOLDER_PREFIXES.include?(pair[0])
end
