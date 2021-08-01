import UIKit
import RealmSwift

class recordViewController: UIViewController {
    var deleteAllButtonItem: UIBarButtonItem!
    var number: Int = 0
    @IBOutlet weak var tableView: UITableView!
    var ideaItem: Results<ideaData>!
    
    // navigationbarのタイトルとボタンを表示
    override func viewWillAppear(_ animated: Bool) {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        self.parent?.navigationItem.title = "記録したヒント"
        deleteAllButtonItem = UIBarButtonItem(title: "全て削除", style: .done, target: self, action: #selector(deleteAllButtonPressed(_:)))
        self.parent?.navigationItem.leftBarButtonItem = deleteAllButtonItem
        let realm = try! Realm()
        ideaItem = realm.objects(ideaData.self)
        self.tableView.reloadData()
    }
    
    // navigationbar, tableViewCellの設定
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        parent?.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.titleTextAttributes
            = [NSAttributedString.Key.font: UIFont(name: "Trebuchet MS", size: 25)!]
        
        self.tableView.reloadData()
    }
    
//    他の画面に映る前に、全て削除ボタンを無効にしておく
    override func viewWillDisappear(_ animated: Bool) {
        deleteAllButtonItem.isEnabled = false
        deleteAllButtonItem.tintColor = UIColor.clear
    }
    
    // 全て削除ボタンが押された時の処理
    @objc func deleteAllButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "全ての単語を削除しますか？", message: "復旧はできません", preferredStyle: .alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            let realm = try! Realm()
            let allData = realm.objects(ideaData.self)
            do {
                try realm.write {
                    realm.delete(allData)
                }
            } catch {
                print("Failed to delete")
            }
            self.tableView.reloadData()
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

// MARK: - UITableViewDelegate, UITableViewDataSource

extension recordViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let idea =  ideaItem {
            return idea.count
        } else {
            return 0
        }
        
    }
    
    // tableViewCellの設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "tableViewCell")
        let item:ideaData = self.ideaItem[(indexPath as NSIndexPath).row];
        cell.textLabel?.text = item.hint
        cell.detailTextLabel?.text = item.detail
        cell.backgroundColor = UIColor(red: 0.9098, green: 0.9647, blue: 0.9373, alpha: 1.0)
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    // 選択したtableViewCellを削除する処理
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        do {
            let realm = try! Realm()
            try realm.write {
                realm.delete(self.ideaItem[indexPath.row])
            }
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        } catch {
        }
        self.tableView.reloadData()
    }
    
    // tableViewCellをタップすると、編集画面に遷移
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        number = indexPath.row
        performSegue(withIdentifier: "goToEdit", sender: nil)
    }
    
    // editViewControllerへ値を渡す（値の組み合わせをタイトルに表示するため、インデックス番号を渡した）
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEdit" {
            let destinationVC = segue.destination as! editViewController
            destinationVC.hintNumber = number
        }
    }
}
