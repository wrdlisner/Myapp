import UIKit

class Question3ViewController: UIViewController{

    @IBOutlet weak var questionView: UITextField!
    
    var passedIndex:Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(passedIndex)
        
        var filePath = Bundle.main.path(forResource: "questionList", ofType:"plist" )
        var dic = NSDictionary(contentsOfFile:filePath!)
        print(dic)
        
        let dic0 = dic!["喜"] as! NSDictionary
        
        if passedIndex == 0 {
            questionView.text = dic0["joy2"] as? String
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func alertButton(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Topに戻ります", message: nil, preferredStyle: .alert)
        
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
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
