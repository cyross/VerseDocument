# M: Module(モジュール)
# C: Class(クラス)
# S: Structure(構造体)
# I: Interface(インターフェース)
# EN: Enumeration(列挙型)
# EX: Extension(エクステンション)
# F: Function(関数・メソッド) / Function Member
# D: Data(データ) / Data Member

require File.expand_path('folder/referenceFolder', File.dirname(__FILE__))
require File.expand_path('member/init', File.dirname(__FILE__))
require File.expand_path('md/template', File.dirname(__FILE__))
require File.expand_path('md/desc', File.dirname(__FILE__))
require File.expand_path('md/main', File.dirname(__FILE__))

TARGET_PATHES = ["../**/*"]

def main
  folder_manager = VerseAPIReferenceFolderManager.new()

  folderObjs = Dir.glob(TARGET_PATHES)
    .filter{|path| has_prefix(path) }
    .filter{|path| not File.file?(path) }
    .map{|path| VerseAPIReferenceFolder.new(path)}

  folderObjs.each{|folder_obj|
    folder_manager.add(folder_obj)
  }

  folder_manager.generate
end

main
