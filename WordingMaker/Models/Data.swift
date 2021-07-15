import Foundation

struct hintData {
    var hint: String
    var detail: String
    init(hint: String, detail: String) {
        self.hint = hint
        self.detail = detail
    }
}

struct wordData {
    var word: String
}
var word: [wordData] = [wordData(word: "sns"),
                        wordData(word: "ケア"),
                        wordData(word: "運動"),
                        wordData(word: "服"),
                        wordData(word: "大学生"),
                        wordData(word: "勉強")]
var keepWord: [hintData] = [
    hintData(hint: "ヒント１", detail: "こんなアイデア"),
    hintData(hint: "ヒント２", detail: "あんなアイデア"),
    hintData(hint: "ヒント３", detail: "すごいアイデア"),
    hintData(hint: "ヒント４", detail: "ぶっ飛ぶアイデア"),
    hintData(hint: "ヒント５", detail: "面白いアイデア"),
    hintData(hint: "ヒント６", detail: "危険なアイデア"),
    hintData(hint: "ヒント７", detail: "突飛なアイデア"),]
