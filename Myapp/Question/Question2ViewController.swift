import UIKit

var selected = ["喜を選んだあなたへ","怒を選んだあなたへ","哀を選んだあなたへ","楽を選んだあなたへ"]

var question2Answer = ""

class Question2ViewController: UIViewController {
    
    @IBOutlet weak var name1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name1.text = selected[choice]
        
        scrollView.delegate = self
        textField.delegate = self
        
        // 画面サイズ取得
        let screenSize: CGRect = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        print("screenWidth:\(screenWidth)")
        print("screenHeight:\(screenHeight)")
        
        // 表示窓のサイズと位置を設定
        scrollView.frame.size =
            CGSize(width: screenWidth, height: screenHeight)
        
        // UIImageView 初期化
        imageView = UIImageView(image: img)
        
        // UIScrollViewに追加
        scrollView.addSubview(imageView)
        scrollView.addSubview(label)
        scrollView.addSubview(textField)
        
        // UIScrollViewの大きさを画像サイズに設定
        scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight*2)
        
        // スクロールの跳ね返り無し
        scrollView.bounces = false
        
        // ビューに追加
        self.view.addSubview(scrollView)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var textField: UITextView!
    
    @IBAction func alertButton(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "トップに戻ります", message: nil, preferredStyle: .alert)
        
        let cancelAction:UIAlertAction = UIAlertAction(title: "戻らない", style: UIAlertActionStyle.default, handler:{
            
            (action:UIAlertAction!) -> Void in
            
        })
        
        let defaultAction1:UIAlertAction = UIAlertAction(title: "戻る", style: UIAlertActionStyle.default, handler:{
            
            (action:UIAlertAction!) -> Void in
            
            let controller = self.storyboard!.instantiateInitialViewController()
            
            self.show(controller!, sender: true)
            
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(defaultAction1)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    // Screenの高さ
    var screenHeight:CGFloat!
    // Screenの幅
    var screenWidth:CGFloat!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        scrollView.delegate = self
//        textField.delegate = self
//
//        // 画面サイズ取得
//        let screenSize: CGRect = UIScreen.main.bounds
//        screenWidth = screenSize.width
//        screenHeight = screenSize.height
//
//        print("screenWidth:\(screenWidth)")
//        print("screenHeight:\(screenHeight)")
//
//        // 表示窓のサイズと位置を設定
//        scrollView.frame.size =
//            CGSize(width: screenWidth, height: screenHeight)
//
//        // 表示する画像
//        let img:UIImage = UIImage(named:"img03")!
//
//        // UIImageView 初期化
//        imageView = UIImageView(image: img)
//
//        // UIScrollViewに追加
//        scrollView.addSubview(imageView)
//        scrollView.addSubview(label)
//        scrollView.addSubview(textField)
//
//        // UIScrollViewの大きさを画像サイズに設定
//        scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight*2)
//
//        // スクロールの跳ね返り無し
//        scrollView.bounces = false
//
//        // ビューに追加
//        self.view.addSubview(scrollView)
//
//    }
    
    // 改行でキーボードを隠す
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewController.keyboardWillShow(_:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewController.keyboardWillHide(_:)) ,
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self,
                                                  name: .UIKeyboardWillShow,
                                                  object: self.view.window)
        NotificationCenter.default.removeObserver(self,
                                                  name: .UIKeyboardDidHide,
                                                  object: self.view.window)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        let info = notification.userInfo!
        
        let keyboardFrame = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        // bottom of textField
        let bottomTextField = textField.frame.origin.y + textField.frame.height
        // top of keyboard
        let topKeyboard = screenHeight - keyboardFrame.size.height
        // 重なり
        let distance = bottomTextField - topKeyboard
        
        if distance >= 0 {
            // scrollViewのコンテツを上へオフセット + 20.0(追加のオフセット)
            scrollView.contentOffset.y = distance + 20.0
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        scrollView.contentOffset.y = 0
    }
    
    
    
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
        question2Answer = textField.text!
        
    }
    
    @IBAction func backtoQ2(segue:UIStoryboardSegue){
    }

}
