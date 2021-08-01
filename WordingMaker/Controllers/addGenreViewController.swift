import UIKit
import RealmSwift

class addGenreViewController: UIViewController {
    var addGenreButtonItem: UIBarButtonItem!
    var genreIndex: Int = 0
    var wordItem: Results<wordData>!
    var newGenreWord = wordData()
    var backGround: UILabel? = nil
    let screenSize: CGSize = UIScreen.main.nativeBounds.size
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewWillAppear(_ animated: Bool) {
        addGenreButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addGenreButtonPressed(_:)))
        self.navigationItem.rightBarButtonItem = addGenreButtonItem
    }
    override func viewDidLoad() {
        collectionView.dataSource = self
        collectionView.delegate = self
        for index in 0..<genreList.count {
            genreList[index].isSelected = false
        }
        collectionViewLayout.estimatedItemSize = CGSize(width: screenSize.width / 3, height: screenSize.height / 3)
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        lpgr.delegate = self
        collectionView.addGestureRecognizer(lpgr)
    }
//    追加ボタンが押された時の処理
    @objc func addGenreButtonPressed(_ sender: UIBarButtonItem) {
        for genre in genreList {
            if genre.isSelected {
                for addGenre in genre.labelList {
                    do{
                        let realm = try! Realm()
                        try realm.write({ () -> Void in
                            self.newGenreWord = wordData()
                            self.newGenreWord.wordElement = addGenre.word
                            realm.add(self.newGenreWord)
                            print("Saved")
                        })
                    }catch{
                        print("Save is Faild")
                    }
                }
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
}


//　MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate
extension addGenreViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        genreList.count
    }
    
//  collectionViewCellの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath)
        let genreLabel = cell.contentView.viewWithTag(1) as! UILabel
        genreLabel.text = genreList[indexPath.row].genreTitle
        cell.layer.cornerRadius = 20
        return cell
    }
    
//  cellが選択された時の処理
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)!
        let genreLabel = cell.contentView.viewWithTag(1) as! UILabel
        backGround = genreLabel
        if genreList[indexPath.row].isSelected == false {
            genreList[indexPath.row].isSelected = true
            genreLabel.backgroundColor = UIColor.lightGray
        } else {
            genreList[indexPath.row].isSelected = false
            genreLabel.backgroundColor = UIColor.white
        }
    }
//  長押しされた時の処理
    @objc func handleLongPress(gesture : UILongPressGestureRecognizer!) {
        if gesture.state != .ended {
            return
        }
        let p = gesture.location(in: self.collectionView)
        if let indexPath = self.collectionView.indexPathForItem(at: p) {
            genreIndex = indexPath.row
            performSegue(withIdentifier: "showGenre", sender: nil)
        } else {
            print("couldn't find index path")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGenre" {
            let destinationVC = segue.destination as! showGenreViewController
            destinationVC.genreNumber = genreIndex
        }
    }
}

