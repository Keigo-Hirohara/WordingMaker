import UIKit

class generateViewController: UIViewController {
    @IBOutlet weak var letterTableView: UITableView!
    var isOk = true
    var textField = UITextField()
    var addButtonItem: UIBarButtonItem!
    var deleteButtonItem: UIBarButtonItem!
    
    // navigationbarの設定
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.navigationItem.title = "単語を管理する"
        addButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed(_:)))
        deleteButtonItem = UIBarButtonItem(title: "全て削除", style: .done, target: self, action: #selector(deleteButtonPressed(_:)))
        self.parent?.navigationItem.rightBarButtonItem = addButtonItem
        self.parent?.navigationItem.leftBarButtonItem = deleteButtonItem
        self.letterTableView.reloadData()
    }
    override func viewDidLoad() {
        letterTableView.delegate = self
        letterTableView.dataSource = self
    }
    
    // 他の画面に移る前にnavigationItemを非表示にしておく
    override func viewDidDisappear(_ animated: Bool) {
        addButtonItem.isEnabled = false
        addButtonItem.tintColor = UIColor.clear
        deleteButtonItem.isEnabled = false
        deleteButtonItem.tintColor = UIColor.clear
    }

    // 追加ボタンが押された時の処理（UIAlertの設定）
    @objc func addButtonPressed(_ sender: UIBarButtonItem) {
        let addAlert = UIAlertController(title: "単語を追加", message: "追加する単語を入力してください", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "追加する", style: UIAlertAction.Style.default) { (action: UIAlertAction) -> Void in
            for element in word {
                if self.textField.text == element.word {
                    self.isOk = false
                }
            }
            if self.textField.text != "" && self.isOk {
                word.append(wordData(word: self.textField.text!))
            } else if self.textField.text == "" {
                let emptyAlert = UIAlertController(title: "何も入力されていません", message: "空白は追加できません", preferredStyle: .alert)
                let emptyAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
                    (action: UIAlertAction!) -> Void in
                })
                emptyAlert.addAction(emptyAction)
                self.present(emptyAlert, animated: true, completion: nil)
            } else if self.isOk == false {
                let duplicateAlert = UIAlertController(title: "すでに入力されています", message: "重複した単語は追加できません", preferredStyle: .alert)
                let duplicateAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
                    (action: UIAlertAction!) -> Void in
                })
                duplicateAlert.addAction(duplicateAction)
                self.present(duplicateAlert, animated: true, completion: nil)
            }
            self.letterTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.default) { (action: UIAlertAction) -> Void in
            }
        
        addAlert.addTextField { (alertTextField) in
            self.textField = alertTextField
        }
        addAlert.addAction(cancelAction)
        addAlert.addAction(addAction)
        present(addAlert, animated: true, completion: nil)
    }
    
    // 全て削除ボタンが押された時の処理（UIAlertの設定）
    @objc func deleteButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "全ての単語を削除しますか？", message: "復旧はできません", preferredStyle: .alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            word = []
            self.letterTableView.reloadData()
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            print("Cancel")
        })
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
}


// MARK: - UITableView

extension generateViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return word.count
    }
    
    // tableViewCellの設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let letters = word[indexPath.row].word
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "letterTableViewCell")
        cell.textLabel?.text = letters
        cell.textLabel!.font = UIFont(name: "Arial", size: 15)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 選択されたtableViewCellを削除する処理
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        word.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        self.letterTableView.reloadData()
    }
    
    // タップされたtableViewCellの背景色を整える設定
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
}
