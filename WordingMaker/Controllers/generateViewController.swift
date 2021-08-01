import UIKit
import RealmSwift

class generateViewController: UIViewController {
    @IBOutlet weak var letterTableView: UITableView!
    var isOk = true
    var textField = UITextField()
    var addButtonItem: UIBarButtonItem!
    var deleteButtonItem: UIBarButtonItem!
    var wordItem: Results<wordData>!
    var newWord = wordData()
    // navigationbarの設定
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.navigationItem.title = "単語を管理する"
        addButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed(_:)))
        deleteButtonItem = UIBarButtonItem(title: "全て削除", style: .done, target: self, action: #selector(deleteButtonPressed(_:)))
        self.parent?.navigationItem.rightBarButtonItem = addButtonItem
        self.parent?.navigationItem.leftBarButtonItem = deleteButtonItem
        do{
            let realm = try Realm()
            wordItem = realm.objects(wordData.self)
        }catch{
            print("pickup failed")
        }
        self.letterTableView.reloadData()
    }
    override func viewDidLoad() {
        letterTableView.delegate = self
        letterTableView.dataSource = self
        do{
            let realm = try! Realm()
            wordItem = realm.objects(wordData.self)
            letterTableView.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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
        let selectmodeAlert = UIAlertController(title: "追加するモードを選んでください", message: "どちらで追加しますか？", preferredStyle: .actionSheet)
        let addFromGenre = UIAlertAction(title: "ジャンルからまとめて追加", style: UIAlertAction.Style.default) { (action: UIAlertAction) -> Void in
            self.performSegue(withIdentifier: "goToGenre", sender: nil)
        }
        let addFromInput = UIAlertAction(title: "入力して追加", style: UIAlertAction.Style.default) { (action: UIAlertAction) -> Void in
            let addAlert = UIAlertController(title: "単語を追加", message: "追加する単語を入力してください", preferredStyle: .alert)
            let addAction = UIAlertAction(title: "追加する", style: UIAlertAction.Style.default) { (action: UIAlertAction) -> Void in
                if self.textField.text != "" {
                    do{
                        let realm = try! Realm()
                        try realm.write({ () -> Void in
                            self.newWord = wordData()
                            self.newWord.wordElement = self.textField.text!
                            realm.add(self.newWord)
                            print("Saved")
                        })
                    }catch{
                        print("Save is Faild")
                    }
                } else if self.textField.text == "" {
                    let emptyAlert = UIAlertController(title: "何も入力されていません", message: "空白は追加できません", preferredStyle: .alert)
                    let emptyAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
                        (action: UIAlertAction!) -> Void in
                    })
                    emptyAlert.addAction(emptyAction)
                    self.present(emptyAlert, animated: true, completion: nil)
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
            self.present(addAlert, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.default) { (action: UIAlertAction) -> Void in
        }
        selectmodeAlert.addAction(addFromInput)
        selectmodeAlert.addAction(addFromGenre)
        selectmodeAlert.addAction(cancelAction)
        present(selectmodeAlert, animated: true, completion: nil)
    }
    // 全て削除ボタンが押された時の処理（UIAlertの設定）
    @objc func deleteButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "全ての単語を削除しますか？", message: "復旧はできません", preferredStyle: .alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            let realm = try! Realm()
            let allData = realm.objects(wordData.self)
            do {
                try realm.write {
                    realm.delete(allData)
                }
            } catch {
                print("Failed to delete")
            }
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
        if let word = wordItem {
            return word.count
        } else {
            return 0
        }
    }
    
    // tableViewCellの設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "letterTableViewCell", for: indexPath)
        let item:wordData = self.wordItem[(indexPath as NSIndexPath).row];
        cell.textLabel?.text = item.wordElement
        cell.backgroundColor = UIColor(red: 0.9098, green: 0.9647, blue: 0.9373, alpha: 1.0)
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    // 選択されたtableViewCellを削除する処理
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        do {
            let realm = try! Realm()
            try realm.write {
                realm.delete(self.wordItem[indexPath.row])
            }
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        } catch {
        }
        self.letterTableView.reloadData()
    }
    // タップされたtableViewCellの背景色を整える設定
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
}
