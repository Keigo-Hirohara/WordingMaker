import UIKit

class recordViewController: UIViewController {
    var deleteAllButtonItem: UIBarButtonItem!
    var number: Int = 0
    @IBOutlet weak var tableView: UITableView!
     
    // navigationbarのタイトルとボタンを表示
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.navigationItem.title = "記録したヒント"
        self.tableView.reloadData()
        deleteAllButtonItem = UIBarButtonItem(title: "全て削除", style: .done, target: self, action: #selector(deleteAllButtonPressed(_:)))
        self.parent?.navigationItem.leftBarButtonItem = deleteAllButtonItem
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
    
    override func viewWillDisappear(_ animated: Bool) {
        deleteAllButtonItem.isEnabled = false
        deleteAllButtonItem.tintColor = UIColor.clear
    }
    
    // 全て削除ボタンが押された時の処理
    @objc func deleteAllButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "全ての単語を削除しますか？", message: "復旧はできません", preferredStyle: .alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            keepWord = []
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
        return keepWord.count
    }
    
    // tableViewCellの設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hintWord = keepWord[indexPath.row].hint
        let detailWord = keepWord[indexPath.row].detail
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "tableViewCell")
        cell.textLabel?.text = hintWord
        cell.detailTextLabel?.text = detailWord
        cell.textLabel!.font = UIFont(name: "Arial", size: 30)
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
        {
            return true
        }
    
    // 選択したtableViewCellを削除する処理
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        keepWord.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
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
