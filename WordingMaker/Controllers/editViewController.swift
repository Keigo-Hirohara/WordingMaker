import UIKit

class editViewController: UIViewController {
    // 受け取った番号が代入される
    var hintNumber: Int = 0
    @IBOutlet weak var editTextField: UITextView!
    var recordButtonItem: UIBarButtonItem!
    
    // navigationbarの設定、UIAlertの設定
    override func viewDidLoad() {
        parent?.navigationItem.hidesBackButton = true
        self.title = keepWord[hintNumber].hint
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
                view.addGestureRecognizer(tap)
        editTextField.text = keepWord[hintNumber].detail
        recordButtonItem = UIBarButtonItem(title: "完了", style: .done, target: self, action: #selector(recordButtonPressed(_:)))
        self.navigationItem.rightBarButtonItem = recordButtonItem
    }
    
    // 完了ボタンが押された時の処理
    @objc func recordButtonPressed(_ sender: UIBarButtonItem) {
        keepWord[hintNumber].detail = editTextField.text
        print(keepWord)
        self.navigationController?.popViewController(animated: true)
    }
}
