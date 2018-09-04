import UIKit

let filePath = Bundle.main.path(forResource: "questionList", ofType:"plist" )
let dic = NSDictionary(contentsOfFile:filePath!)

    let dic1 = dic!["喜"] as! NSDictionary
    let dic2 = dic!["怒"] as! NSDictionary
    let dic3 = dic!["哀"] as! NSDictionary
    let dic4 = dic!["楽"] as! NSDictionary

var question3Answer = ""

//var Q1andRangeSelected : (Int,Int) = (choice,rangeChoice)

class Question3ViewController: UIViewController{
    
    @IBOutlet weak var questionView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Q1andRangeSelected : (Int,Int) = (choice,rangeChoice)
        
        print("choiceの値は",choice)
        print("rangeChoiceの値は",rangeChoice)
        print("Q1andRangeSelectedの値は",Q1andRangeSelected)
        
        switch Q1andRangeSelected {
        case (0,0):
            questionView.text = dic1["joy1-1"] as? String
        case (0,1):
            questionView.text = dic1["joy2-1"] as? String
        case (0,2):
            questionView.text = dic1["joy3-1"] as? String
        case (1,0):
            questionView.text = dic2["angry1-1"] as? String
        case (1,1):
            questionView.text = dic2["angry2-1"] as? String
        case (1,2):
            questionView.text = dic2["angry3-1"] as? String
        case (2,0):
            questionView.text = dic3["sad1-1"] as? String
        case (2,1):
            questionView.text = dic3["sad2-1"] as? String
        case (2,2):
            questionView.text = dic3["sad3-1"] as? String
        case (3,0):
            questionView.text = dic4["fun1-1"] as? String
        case (3,1):
            questionView.text = dic4["fun2-1"] as? String
        case (3,2):
            questionView.text = dic4["fun3-1"] as? String
        default:
            print("nil")
        }
        
        textField.text! = question3Answer
        
    }

    @IBOutlet weak var textField: UITextView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func alertButton(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "トップに戻ります", message: nil, preferredStyle: .alert)
        
        let cancelAction:UIAlertAction = UIAlertAction(title: "いいえ", style: UIAlertActionStyle.default, handler:{
            
            (action:UIAlertAction!) -> Void in
            
        })
        
        let defaultAction1:UIAlertAction = UIAlertAction(title: "はい", style: UIAlertActionStyle.default, handler:{
            
            (action:UIAlertAction!) -> Void in
            
            let controller = self.storyboard!.instantiateViewController(withIdentifier: "topPage")
            
            self.show(controller, sender: true)
            
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(defaultAction1)
        
        present(alertController, animated: true, completion: nil)
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
        question3Answer = textField.text!
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        question3Answer = textField.text!

    }
    
    @IBAction func backtoQ3(segue:UIStoryboardSegue){
        
        question3Answer = textField.text!
    
    }
    
}
