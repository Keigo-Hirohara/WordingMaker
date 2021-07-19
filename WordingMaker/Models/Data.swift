import Foundation

struct hintData {
    var hint: String
    var detail: String
    init(hint: String, detail: String) {
        self.hint = hint
        self.detail = detail
    }
}

class wordData: Equatable {
    static func == (lhs: wordData, rhs: wordData) -> Bool {
        return lhs.word == rhs.word
    }
    
    var word: String
    init(word: String) {
        self.word = word
    }
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

var foodGenreWord: [wordData]  = [
    wordData(word: "肉"),
    wordData(word: "魚"),
    wordData(word: "野菜"),
    wordData(word: "穀物"),
    wordData(word: "和食"),
    wordData(word: "郷土料理"),
    wordData(word: "イタリアン"),
    wordData(word: "フレンチ"),
    wordData(word: "エスニック"),
    wordData(word: "中華料理"),
    wordData(word: "地中海食"),
    wordData(word: "料理"),
    wordData(word: "健康食"),
    wordData(word: "ジャンクフード"),
    wordData(word: "飲み物"),
    wordData(word: "お茶"),
    wordData(word: "食べ物"),
    wordData(word: "レストラン"),
    wordData(word: "時短飯"),
    wordData(word: "食費")]

var lifeGenreWord: [wordData]  = [
    wordData(word: "運動"),
    wordData(word: "食事"),
    wordData(word: "掃除"),
    wordData(word: "料理"),
    wordData(word: "洗濯"),
    wordData(word: "風呂"),
    wordData(word: "歯磨き"),
    wordData(word: "睡眠"),
    wordData(word: "洋服選び"),
    wordData(word: "家事"),
    wordData(word: "洗い物"),
    wordData(word: "筋トレ"),
    wordData(word: "通学"),
    wordData(word: "通勤"),
    wordData(word: "トイレ"),
    wordData(word: "手洗い"),
    wordData(word: "うがい"),
    wordData(word: "アイロン"),
    wordData(word: "鍵かけ"),
    wordData(word: "ひとり暮らし")]

var schoolGenreWord: [wordData]  = [
    wordData(word: "学校"),
    wordData(word: "小学校"),
    wordData(word: "中学校"),
    wordData(word: "高校"),
    wordData(word: "児童"),
    wordData(word: "生徒"),
    wordData(word: "制服"),
    wordData(word: "ジャージ"),
    wordData(word: "給食"),
    wordData(word: "学食"),
    wordData(word: "弁当"),
    wordData(word: "教員"),
    wordData(word: "部活"),
    wordData(word: "授業"),
    wordData(word: "入学"),
    wordData(word: "学内イベント"),
    wordData(word: "卒業"),
    wordData(word: "夏休み"),
    wordData(word: "冬休み"),
    wordData(word: "定期テスト")]

var hobbyGenreWord: [wordData]  = [
    wordData(word: "釣り"),
    wordData(word: "キャンプ"),
    wordData(word: "登山"),
    wordData(word: "バイク"),
    wordData(word: "ロードバイク"),
    wordData(word: "車"),
    wordData(word: "ピアノ"),
    wordData(word: "料理"),
    wordData(word: "ハンドメイド"),
    wordData(word: "読書"),
    wordData(word: "瞑想"),
    wordData(word: "ヨガ"),
    wordData(word: "ゲーム"),
    wordData(word: "映画鑑賞"),
    wordData(word: "散歩"),
    wordData(word: "ランニング"),
    wordData(word: "写真"),
    wordData(word: "旅行"),
    wordData(word: "パワースポット巡り"),
    wordData(word: "飼育")]

