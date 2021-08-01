import Foundation
import RealmSwift

class ideaData: Object {
    @objc dynamic var hint: String?
    @objc dynamic var detail: String?
}
class wordData: Object {
    @objc dynamic var wordElement: String?
}

class genreWordData {
    var word: String
    init(word: String) {
        self.word = word
    }
}
struct genreTitleSet {
    var genreTitle: String
    var labelList: [genreWordData]
    var isSelected: Bool
    init(title: String, list: [genreWordData], isSelected: Bool) {
        self.genreTitle = title
        self.labelList = list
        self.isSelected = isSelected
    }
}
