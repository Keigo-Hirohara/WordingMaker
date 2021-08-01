import UIKit

class showGenreViewController: UIViewController {
    var genreNumber: Int = 0
    @IBOutlet weak var genreTableView: UITableView!
    override func viewDidLoad() {
        genreTableView.delegate = self
        genreTableView.dataSource = self
        self.title = genreList[genreNumber].genreTitle
        self.genreTableView.reloadData()
    }
}
extension showGenreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genreList[genreNumber].labelList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "element")
        cell.textLabel?.text = genreList[genreNumber].labelList[indexPath.row].word
        cell.textLabel!.font = UIFont(name: "Arial", size: 15)
        cell.backgroundColor = UIColor(red: 0.9098, green: 0.9647, blue: 0.9373, alpha: 1.0)
        return cell
    }
}
