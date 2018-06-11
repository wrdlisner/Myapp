import UIKit

class Question3ViewController: UIViewController{

    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var filePath = Bundle.main.path(forResource: "questionList", ofType:"plist" )
        var dic = NSDictionary(contentsOfFile:filePath!)
        
        print(dic)
        
        questionLabel.text = dic?["angry2"] as? String
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    
    
    
    
}
