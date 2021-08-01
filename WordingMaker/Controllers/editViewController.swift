import UIKit
import RealmSwift

class editViewController: UIViewController {
    // 受け取った番号が代入される
    var hintNumber: Int = 0
    @IBOutlet weak var editTextField: UITextView!
    var recordButtonItem: UIBarButtonItem!
    var displayData = ideaData()
    
    // navigationbarの設定、UIAlertの設定
    override func viewDidLoad() {
        parent?.navigationItem.hidesBackButton = true
        let realm = try!Realm()
        let allHint = realm.objects(ideaData.self)
        self.title = allHint[hintNumber].hint
        editTextField.text = allHint[hintNumber].detail
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        recordButtonItem = UIBarButtonItem(title: "完了", style: .done, target: self, action: #selector(recordButtonPressed(_:)))
        self.navigationItem.rightBarButtonItem = recordButtonItem
    }
    
    // 完了ボタンが押された時の処理
    @objc func recordButtonPressed(_ sender: UIBarButtonItem) {
        do{
            let realm = try! Realm()
            try realm.write({ () -> Void in
                let allHint = realm.objects(ideaData.self)
                allHint[hintNumber].detail = editTextField.text
                print("Saved")
            })
        }catch{
            print("Save is Faild")
        }
        self.navigationController?.popViewController(animated: true)
    }
}
