import Foundation

// ジャンルの状態が格納されている配列
var genreList = [genreTitleSet(title: "食べ物",list: foodGenreWord, isSelected: false),
                 genreTitleSet(title: "生活", list: lifeGenreWord, isSelected: false),
                 genreTitleSet(title: "学校", list: schoolGenreWord, isSelected: false),
                 genreTitleSet(title: "趣味", list: hobbyGenreWord, isSelected: false),
                 genreTitleSet(title: "アイデア", list: ideaGenreWord, isSelected: false),
                 genreTitleSet(title: "ガジェット", list: deviceGenreWord, isSelected: false),
                 genreTitleSet(title: "季節", list: seasonGenreWord, isSelected: false),
                 genreTitleSet(title: "イベント", list: iventGenreWord, isSelected: false),
                 genreTitleSet(title: "5W1H", list: WHGenreWord, isSelected: false),
                 genreTitleSet(title: "状態", list: statusGenreWord, isSelected: false),
                 genreTitleSet(title: "話題", list: topicGenreWord, isSelected: false),
                 genreTitleSet(title: "家族", list: familyGenreWord, isSelected: false),
                 genreTitleSet(title: "職業", list: jobGenreWord, isSelected: false),
                 genreTitleSet(title: "性格", list: personalGenreWord, isSelected: false)]

// ジャンルのデータをすぐ作れるように、テンプレートを用意↓
//var GenreWord: [genreWordData]  = [genreWordData(word: ""),
//                                        genreWordData(word: ""),
//                                        genreWordData(word: ""),
//                                        genreWordData(word: ""),
//                                        genreWordData(word: ""),
//                                        genreWordData(word: ""),
//                                        genreWordData(word: ""),
//                                        genreWordData(word: ""),
//                                        genreWordData(word: ""),
//                                        genreWordData(word: ""),
//                                        genreWordData(word: ""),
//                                        genreWordData(word: ""),
//                                        genreWordData(word: ""),
//                                        genreWordData(word: ""),
//                                        genreWordData(word: ""),
//                                        genreWordData(word: ""),
//                                        genreWordData(word: ""),
//                                        genreWordData(word: ""),
//                                        genreWordData(word: ""),
//                                        genreWordData(word: "")]

//　ジャンルごとの単語が格納されている
var foodGenreWord: [genreWordData]  = [genreWordData(word: "肉"),
                                       genreWordData(word: "魚"),
                                       genreWordData(word: "野菜"),
                                       genreWordData(word: "穀物"),
                                       genreWordData(word: "和食"),
                                       genreWordData(word: "郷土料理"),
                                       genreWordData(word: "イタリアン"),
                                       genreWordData(word: "フレンチ"),
                                       genreWordData(word: "エスニック"),
                                       genreWordData(word: "中華料理"),
                                       genreWordData(word: "地中海食"),
                                       genreWordData(word: "料理"),
                                       genreWordData(word: "健康食"),
                                       genreWordData(word: "ジャンクフード"),
                                       genreWordData(word: "飲み物"),
                                       genreWordData(word: "お茶"),
                                       genreWordData(word: "食べ物"),
                                       genreWordData(word: "レストラン"),
                                       genreWordData(word: "時短飯"),
                                       genreWordData(word: "食費")]

var lifeGenreWord: [genreWordData]  = [genreWordData(word: "運動"),
                                       genreWordData(word: "食事"),
                                       genreWordData(word: "掃除"),
                                       genreWordData(word: "料理"),
                                       genreWordData(word: "洗濯"),
                                       genreWordData(word: "風呂"),
                                       genreWordData(word: "歯磨き"),
                                       genreWordData(word: "睡眠"),
                                       genreWordData(word: "洋服選び"),
                                       genreWordData(word: "家事"),
                                       genreWordData(word: "洗い物"),
                                       genreWordData(word: "筋トレ"),
                                       genreWordData(word: "通学"),
                                       genreWordData(word: "通勤"),
                                       genreWordData(word: "トイレ"),
                                       genreWordData(word: "手洗い"),
                                       genreWordData(word: "うがい"),
                                       genreWordData(word: "アイロン"),
                                       genreWordData(word: "鍵かけ"),
                                       genreWordData(word: "ひとり暮らし")]

var schoolGenreWord: [genreWordData]  = [genreWordData(word: "学校"),
                                         genreWordData(word: "小学校"),
                                         genreWordData(word: "中学校"),
                                         genreWordData(word: "高校"),
                                         genreWordData(word: "児童"),
                                         genreWordData(word: "生徒"),
                                         genreWordData(word: "制服"),
                                         genreWordData(word: "ジャージ"),
                                         genreWordData(word: "給食"),
                                         genreWordData(word: "学食"),
                                         genreWordData(word: "弁当"),
                                         genreWordData(word: "教員"),
                                         genreWordData(word: "部活"),
                                         genreWordData(word: "授業"),
                                         genreWordData(word: "入学"),
                                         genreWordData(word: "学内イベント"),
                                         genreWordData(word: "卒業"),
                                         genreWordData(word: "夏休み"),
                                         genreWordData(word: "冬休み"),
                                         genreWordData(word: "定期テスト")]

var hobbyGenreWord: [genreWordData]  = [genreWordData(word: "釣り"),
                                        genreWordData(word: "キャンプ"),
                                        genreWordData(word: "登山"),
                                        genreWordData(word: "バイク"),
                                        genreWordData(word: "ロードバイク"),
                                        genreWordData(word: "車"),
                                        genreWordData(word: "ピアノ"),
                                        genreWordData(word: "料理"),
                                        genreWordData(word: "ハンドメイド"),
                                        genreWordData(word: "読書"),
                                        genreWordData(word: "瞑想"),
                                        genreWordData(word: "ヨガ"),
                                        genreWordData(word: "ゲーム"),
                                        genreWordData(word: "映画鑑賞"),
                                        genreWordData(word: "散歩"),
                                        genreWordData(word: "ランニング"),
                                        genreWordData(word: "写真"),
                                        genreWordData(word: "旅行"),
                                        genreWordData(word: "パワースポット巡り"),
                                        genreWordData(word: "飼育")]

var ideaGenreWord: [genreWordData]  = [genreWordData(word: "転用"),
                                       genreWordData(word: "応用"),
                                       genreWordData(word: "変更"),
                                       genreWordData(word: "拡大"),
                                       genreWordData(word: "縮小"),
                                       genreWordData(word: "代用"),
                                       genreWordData(word: "再利用"),
                                       genreWordData(word: "逆転"),
                                       genreWordData(word: "結合"),
                                       genreWordData(word: "効率化")]

var deviceGenreWord: [genreWordData]  = [genreWordData(word: "パソコン"),
                                         genreWordData(word: "スマートフォン"),
                                         genreWordData(word: "タブレット"),
                                         genreWordData(word: "イヤホン"),
                                         genreWordData(word: "スマートウォッチ"),
                                         genreWordData(word: "マウス"),
                                         genreWordData(word: "モバイルバッテリー"),
                                         genreWordData(word: "ガジェット"),
                                         genreWordData(word: "モバイルファン"),
                                         genreWordData(word: "プロジェクター")]

var seasonGenreWord: [genreWordData]  = [genreWordData(word: "春"),
                                         genreWordData(word: "夏"),
                                         genreWordData(word: "秋"),
                                         genreWordData(word: "冬"),
                                         genreWordData(word: "桜"),
                                         genreWordData(word: "和菓子"),
                                         genreWordData(word: "新緑"),
                                         genreWordData(word: "酷暑"),
                                         genreWordData(word: "花火"),
                                         genreWordData(word: "夏休み"),
                                         genreWordData(word: "紅葉"),
                                         genreWordData(word: "雪")]

var iventGenreWord: [genreWordData]  = [genreWordData(word: "入学式"),
                                        genreWordData(word: "お花見"),
                                        genreWordData(word: "イースター"),
                                        genreWordData(word: "体育祭"),
                                        genreWordData(word: "ゴールデンウィーク"),
                                        genreWordData(word: "夏祭り"),
                                        genreWordData(word: "お盆"),
                                        genreWordData(word: "海水浴"),
                                        genreWordData(word: "七夕"),
                                        genreWordData(word: "文化祭"),
                                        genreWordData(word: "ハロウィン"),
                                        genreWordData(word: "稲刈り"),
                                        genreWordData(word: "お彼岸"),
                                        genreWordData(word: "月見"),
                                        genreWordData(word: "遠足"),
                                        genreWordData(word: "クリスマス"),
                                        genreWordData(word: "正月"),
                                        genreWordData(word: "大掃除"),
                                        genreWordData(word: "バレンタイン"),
                                        genreWordData(word: "卒業式")]

var statusGenreWord: [genreWordData]  = [genreWordData(word: "温度"),
                                         genreWordData(word: "見た目"),
                                         genreWordData(word: "触感"),
                                         genreWordData(word: "触感"),
                                         genreWordData(word: "匂い"),
                                         genreWordData(word: "音"),
                                         genreWordData(word: "関係")]

var WHGenreWord: [genreWordData]  = [genreWordData(word: "どこで"),
                                     genreWordData(word: "いつ"),
                                     genreWordData(word: "なぜ"),
                                     genreWordData(word: "どのように"),
                                     genreWordData(word: "どうやって"),
                                     genreWordData(word: "誰が")]

var topicGenreWord: [genreWordData]  = [genreWordData(word: "天気"),
                                        genreWordData(word: "季節"),
                                        genreWordData(word: "住んでいる場所"),
                                        genreWordData(word: "出身地"),
                                        genreWordData(word: "趣味"),
                                        genreWordData(word: "夢"),
                                        genreWordData(word: "目標"),
                                        genreWordData(word: "大学"),
                                        genreWordData(word: "テレビ"),
                                        genreWordData(word: "好きな食べ物"),
                                        genreWordData(word: "子供の頃の思い出"),
                                        genreWordData(word: "お互いの持ち物"),
                                        genreWordData(word: "時事ニュース"),
                                        genreWordData(word: "どっち派"),
                                        genreWordData(word: "血液型"),
                                        genreWordData(word: "休日の過ごし方"),
                                        genreWordData(word: "マイブーム"),
                                        genreWordData(word: "タイプ"),
                                        genreWordData(word: "共通の友人"),
                                        genreWordData(word: "黒歴史")]

var clothesGenreWord: [genreWordData]  = [genreWordData(word: "メンズ"),
                                          genreWordData(word: "レディース"),
                                          genreWordData(word: "トップス"),
                                          genreWordData(word: "ボトムス"),
                                          genreWordData(word: "色"),
                                          genreWordData(word: "シルエット"),
                                          genreWordData(word: "カジュアル"),
                                          genreWordData(word: "綺麗め"),
                                          genreWordData(word: "シャツ"),
                                          genreWordData(word: "スウェット"),
                                          genreWordData(word: "ダウン"),
                                          genreWordData(word: "コート"),
                                          genreWordData(word: "スキニー"),
                                          genreWordData(word: "ワイドパンツ"),
                                          genreWordData(word: "スラックス"),
                                          genreWordData(word: "スカート"),
                                          genreWordData(word: "ワンピース"),
                                          genreWordData(word: "スニーカー"),
                                          genreWordData(word: "革靴"),
                                          genreWordData(word: "アクセサリー")]

var jobGenreWord: [genreWordData]  = [genreWordData(word: "公務員"),
                                      genreWordData(word: "弁護士"),
                                      genreWordData(word: "サラリーマン"),
                                      genreWordData(word: "秘書"),
                                      genreWordData(word: "CA"),
                                      genreWordData(word: "パイロット"),
                                      genreWordData(word: "ホテルマン"),
                                      genreWordData(word: "芸人"),
                                      genreWordData(word: "記者"),
                                      genreWordData(word: "俳優"),
                                      genreWordData(word: "女優"),
                                      genreWordData(word: "ミュージシャン"),
                                      genreWordData(word: "デザイナー"),
                                      genreWordData(word: "スタイリスト"),
                                      genreWordData(word: "エンジニア"),
                                      genreWordData(word: "ハッカー"),
                                      genreWordData(word: "整備士"),
                                      genreWordData(word: "建築士"),
                                      genreWordData(word: "獣医"),
                                      genreWordData(word: "医者")]

var personalGenreWord: [genreWordData]  = [genreWordData(word: "アウトドア派"),
                                           genreWordData(word: "インドア派"),
                                           genreWordData(word: "いい加減"),
                                           genreWordData(word: "うろたえない"),
                                           genreWordData(word: "噂好き"),
                                           genreWordData(word: "オカルト趣味"),
                                           genreWordData(word: "お人好し"),
                                           genreWordData(word: "おせっかい"),
                                           genreWordData(word: "ガサツ"),
                                           genreWordData(word: "ぎこちない"),
                                           genreWordData(word: "コミュ障"),
                                           genreWordData(word: "サディスト"),
                                           genreWordData(word: "サバサバ"),
                                           genreWordData(word: "しつこい"),
                                           genreWordData(word: "ズボラ"),
                                           genreWordData(word: "せっかち"),
                                           genreWordData(word: "センスがいい"),
                                           genreWordData(word: "強がり"),
                                           genreWordData(word: "でしゃばる"),
                                           genreWordData(word: "ナルシスト"),
                                           genreWordData(word: "ネガティブ"),
                                           genreWordData(word: "ポジティブ"),
                                           genreWordData(word: "ノーと言えない"),
                                           genreWordData(word: "のんびり"),
                                           genreWordData(word: "ひとでなし"),
                                           genreWordData(word: "ひょうきん"),
                                           genreWordData(word: "へりくだる"),
                                           genreWordData(word: "へこたれない"),
                                           genreWordData(word: "マイペース"),
                                           genreWordData(word: "よそよそしい"),
                                           genreWordData(word: "ロマンチスト"),
                                           genreWordData(word: "ロリコン"),
                                           genreWordData(word: "わがまま"),]

var familyGenreWord: [genreWordData]  = [genreWordData(word: "家族"),
                                        genreWordData(word: "親戚"),
                                        genreWordData(word: "両親"),
                                        genreWordData(word: "父親"),
                                        genreWordData(word: "母親"),
                                        genreWordData(word: "兄弟"),
                                        genreWordData(word: "姉妹"),
                                        genreWordData(word: "兄"),
                                        genreWordData(word: "弟"),
                                        genreWordData(word: "姉"),
                                        genreWordData(word: "妹"),
                                        genreWordData(word: "いとこ"),
                                        genreWordData(word: "はとこ"),
                                        genreWordData(word: "叔母"),
                                        genreWordData(word: "叔父"),
                                        genreWordData(word: "孫"),
                                        genreWordData(word: "祖母"),
                                        genreWordData(word: "祖父"),
                                        genreWordData(word: "妻"),
                                        genreWordData(word: "夫")]
