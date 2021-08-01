import UIKit
import RealmSwift

class makeWordViewController: UIViewController {
//    固定ボタン
    @IBOutlet weak var fixLeftButton: UIButton!
    @IBOutlet weak var fixRightButton: UIButton!
    // 単語を表示する場所
    @IBOutlet weak var leftCard: UIView!
    @IBOutlet weak var rightCard: UIView!
    @IBOutlet weak var textLeft: UILabel!
    @IBOutlet weak var textRight: UILabel!
    // 角を丸くするための接続
    @IBOutlet var Views: [UIView]!
    @IBOutlet weak var findButton: UIButton!
    var isChangeLeft: Bool = true
    var isChangeRight: Bool = true
    var wordItem: Results<wordData>!
    var newIdea = ideaData()
    
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.navigationItem.title = "単語を組み合わせる"
        fixLeftButton.layer.cornerRadius = 25
        fixRightButton.layer.cornerRadius = 25
        Views.forEach { $0.layer.cornerRadius = 75 }
        findButton.layer.cornerRadius = 40
    }
    // 固定ボタンが押された時の処理
    @IBAction func fixLeftPressed(_ sender: Any) {
        if isChangeLeft {
            isChangeLeft = false
            self.fixLeftButton.backgroundColor = UIColor(red: 0.62,green: 0.83, blue: 0.87, alpha: 1.0)
            self.fixLeftButton.setTitleColor(UIColor(named: "backGround"), for: .normal)
            fixLeftButton.setTitle("固定解除", for: .normal)
        } else {
            isChangeLeft = true
            self.fixLeftButton.backgroundColor = UIColor(red: 0.19,green: 0.20,blue: 0.44, alpha: 1.0)
            self.fixLeftButton.setTitleColor(UIColor(named: "Button"), for: .normal)
            fixLeftButton.setTitle("固定する", for: .normal)
        }
    }
    @IBAction func fixRightPressed(_ sender: Any) {
        if isChangeRight {
            isChangeRight = false
            self.fixRightButton.backgroundColor = UIColor(red: 0.62,green: 0.83, blue: 0.87, alpha: 1.0)
            self.fixRightButton.setTitleColor(UIColor(named: "backGround"), for: .normal)
            fixRightButton.setTitle("固定解除", for: .normal)
        } else {
            isChangeRight = true
            self.fixRightButton.backgroundColor = UIColor(red: 0.19,green: 0.20,blue: 0.44, alpha: 1.0)
            self.fixRightButton.setTitleColor(UIColor(named: "Button"), for: .normal)
            fixRightButton.setTitle("固定する", for: .normal)
        }
    }
    // 探すボタンが押された時の処理
    @IBAction func findPressed(_ sender: Any) {
        let realm = try! Realm()
        let amount = realm.objects(wordData.self)
        if isChangeLeft && amount.count != 0 {
            textLeft.text = amount[Int.random(in: 0...amount.count - 1)].wordElement
        }
        if isChangeRight && amount.count != 0 {
            textRight.text = amount[Int.random(in: 0...amount.count - 1)].wordElement
        }
        
    }
    //記憶しておくボタンが押された時の処理
    @IBAction func keepPressed(_ sender: Any) {
        do{
            let realm = try! Realm()
            try realm.write({ () -> Void in
                self.newIdea = ideaData()
                newIdea.hint = "\(textLeft.text!) + \(textRight.text!)"
                newIdea.detail = "詳細未入力"
                realm.add(self.newIdea)
                print("Saved")
            })
        }catch{
            print("Save is Faild")
        }
    }
}
