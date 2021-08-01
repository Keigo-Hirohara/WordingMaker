import UIKit

class startViewController: UIViewController {
    var imageView: UIImageView!
    
    // navigationbarを隠す
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // ロゴのアニメーションを作成
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.1,
                       delay: 1.8,
                       options: UIView.AnimationOptions.curveEaseOut,
                       animations: { () in
                        self.imageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                       }, completion: { (Bool) in
                        
                       })
        UIView.animate(withDuration: 0.2,
                       delay: 2.0,
                       options: UIView.AnimationOptions.curveEaseOut,
                       animations: { () in
                        self.imageView.transform = CGAffineTransform(scaleX: 8.0, y: 8.0)
                        self.imageView.alpha = 0
                       }, completion: { (Bool) in
                        self.imageView.removeFromSuperview()
                       })
    }
    
    // ロゴを生成、メイン画面に画面遷移
    override func viewDidLoad() {
        self.imageView = UIImageView(frame: CGRectMake(0, 0, 200, 200))
        self.imageView.center = self.view.center
        self.imageView.image = UIImage(named: "launchIcon")
        self.view.addSubview(self.imageView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.performSegue(withIdentifier: "goToMain", sender: nil)
        }
    }
    
    // 画面遷移の前に、隠していたnavigationbarを表示
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
}
