import UIKit
import SwiftyOnboard

class SwiftyOnboardViewController: UIViewController,
    SwiftyOnboardDataSource,SwiftyOnboardDelegate {
    
    var swiftyOnboard: SwiftyOnboard!
    let colors:[UIColor] = [#colorLiteral(red: 0.9960784314, green: 0.9764705882, blue: 0.7215686275, alpha: 1),#colorLiteral(red: 0.9960784314, green: 0.9764705882, blue: 0.7215686275, alpha: 1),#colorLiteral(red: 0.9960784314, green: 0.9764705882, blue: 0.7215686275, alpha: 1)]
    var titleArray: [String] = ["「こころぐ」へようこそ","使い方は簡単です","毎日書くことでろぐが溜まっていきます"]
    var subTitleArray: [String] = ["「こころぐ」は質問に答えていくことで今の気持ちを整理できる、感情整理アプリです","最初に今の感情に一番近いものを4つの中から選び、質問に答えていくだけです","記録されたこころぐは「過去ろぐを見る」からいつでも読み返せます"]
    
    var gradiant: CAGradientLayer = {
        let mainColor = UIColor.rgb(r: 254, g: 249, b: 184, alpha: 1)
        let gradiant = CAGradientLayer()
        gradiant.colors = [mainColor]
        gradiant.startPoint = CGPoint(x: 0.5, y: 0.18)
        return gradiant
    }()
    
    var buildCount = 0
    
    let ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        swiftyOnboard = SwiftyOnboard(frame: view.frame, style: .light)
        view.addSubview(swiftyOnboard)
        swiftyOnboard.dataSource = self
        swiftyOnboard.delegate = self
        
        
        
        
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func gradient() {
        //Add the gradiant to the view:
        self.gradiant.frame = view.bounds
        view.layer.addSublayer(gradiant)
    }
    
    @objc func handleSkip() {
        swiftyOnboard?.goToPage(index: 2, animated: true)
    }
    
    @objc func handleContinue(sender: UIButton) {
        let index = sender.tag
        swiftyOnboard?.goToPage(index: index + 1, animated: true)
    }
    
    func swiftyOnboardBackgroundColorFor(_ swiftyOnboard: SwiftyOnboard, atIndex index: Int) -> UIColor? {
        return colors[index]
    }
    
    func swiftyOnboardNumberOfPages(_ swiftyOnboard: SwiftyOnboard) -> Int {
        return 3
    }
    
    func swiftyOnboardViewForOverlay(_ swiftyOnboard: SwiftyOnboard) -> SwiftyOnboardOverlay? {
        let overlay = SwiftyOnboardOverlay()
        
        //Setup targets for the buttons on the overlay view:
        overlay.skipButton.addTarget(self, action: #selector(handleSkip), for: .touchUpInside)
        overlay.continueButton.addTarget(self, action: #selector(handleContinue), for: .touchUpInside)
        
        //Setup for the overlay buttons:
        overlay.continueButton.titleLabel?.font = UIFont(name: "HannariMincho", size: 20)
        overlay.continueButton.setTitleColor(UIColor.rgb(r: 64, g: 64, b: 64, alpha: 1), for: .normal)
        overlay.skipButton.setTitleColor(UIColor.rgb(r: 64, g: 64, b: 64, alpha: 1), for: .normal)
        overlay.skipButton.titleLabel?.font = UIFont(name: "HannariMincho", size: 20)
        
        //Return the overlay view:
        return overlay
    }
    
    func swiftyOnboardPageForIndex(_ swiftyOnboard: SwiftyOnboard, index: Int) -> SwiftyOnboardPage? {
        let view = SwiftyOnboardPage()
       
        //Set the image on the page:
        view.imageView.image = UIImage(named: "onboard\(index)")
        view.frame.size = CGSize(width: 15, height: 10)
        view.imageView.frame.size = CGSize(width: 15, height: 10)
        
        //Set the font and color for the labels:
        view.title.font = UIFont(name: "HannariMincho", size: 22)
        view.title.textColor = UIColor.rgb(r: 64, g: 64, b: 64, alpha: 1)
        view.subTitle.font = UIFont(name: "HannariMincho", size: 16)
        view.subTitle.textColor = UIColor.rgb(r: 64, g: 64, b: 64, alpha: 1)
        
        //Set the text in the page:
        view.title.text = titleArray[index]
        view.subTitle.text = subTitleArray[index]
        
        //Return the page for the given index:
        return view
    }
    
    func swiftyOnboardOverlayForPosition(_ swiftyOnboard: SwiftyOnboard, overlay: SwiftyOnboardOverlay, for position: Double) {
        let currentPage = round(position)
        overlay.pageControl.currentPage = Int(currentPage)
        overlay.continueButton.tag = Int(position)
        
        if currentPage == 0.0 || currentPage == 1.0 {
            overlay.continueButton.setTitle("次へ", for: .normal)
            overlay.skipButton.setTitle("スキップ", for: .normal)
            overlay.skipButton.isHidden = false
        } else {
            overlay.continueButton.addTarget(self, action: #selector(startPage), for: .touchUpInside)
            overlay.continueButton.setTitle("こころぐを始める", for: .normal)
            overlay.skipButton.isHidden = true
        }
        
    }
    
    @objc func startPage() {
        
        let goTopPage = storyboard?.instantiateViewController(withIdentifier: "topPage")
        self.present(goTopPage!, animated: true, completion: nil)
        UserDefaults.standard.set(true, forKey: "openApp")
        
    }

}
