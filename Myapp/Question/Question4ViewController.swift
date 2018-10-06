
import UIKit

var question4Answer = ""

class Question4ViewController: UIViewController {

    @IBOutlet weak var questionView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var Q1andRangeSelected : (Int,Int) = (choice,rangeChoice)
        print("choiceの値は",choice)
        print("rangeChoiceの値は",rangeChoice)
        print("Q1andRangeSelectedの値は",Q1andRangeSelected)
        
        question4Answer = ""
        
        switch Q1andRangeSelected {
        case (0,0):
            questionView.text = dic1["joy1-2"] as? String
        case (0,1):
            questionView.text = dic1["joy2-2"] as? String
        case (0,2):
            questionView.text = dic1["joy3-2"] as? String
        case (1,0):
            questionView.text = dic2["angry1-2"] as? String
        case (1,1):
            questionView.text = dic2["angry2-2"] as? String
        case (1,2):
            questionView.text = dic2["angry3-2"] as? String
        case (2,0):
            questionView.text = dic3["sad1-2"] as? String
        case (2,1):
            questionView.text = dic3["sad2-2"] as? String
        case (2,2):
            questionView.text = dic3["sad3-2"] as? String
        case (3,0):
            questionView.text = dic4["fun1-2"] as? String
        case (3,1):
            questionView.text = dic4["fun2-2"] as? String
        case (3,2):
            questionView.text = dic4["fun3-2"] as? String
        default:
            print("nil")
        }
        
        textField.text! = question4Answer
    }
    
    @IBOutlet weak var textField: UITextView!
    
    @IBAction func alertButton(_ sender: Any){
    
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
        question4Answer = textField.text!
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        question4Answer = textField.text!
        
    }
    
    @IBAction func backtoQ4(segue:UIStoryboardSegue){
        
        question4Answer = textField.text!
        
    }

}
