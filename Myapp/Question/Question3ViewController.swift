import UIKit

let filePath = Bundle.main.path(forResource: "questionList", ofType:"plist" )
let dic = NSDictionary(contentsOfFile:filePath!)

    let dic1 = dic!["喜"] as! NSDictionary
    let dic2 = dic!["怒"] as! NSDictionary
    let dic3 = dic!["哀"] as! NSDictionary
    let dic4 = dic!["楽"] as! NSDictionary

var question3Answer = ""

class Question3ViewController: UIViewController{
    
    @IBOutlet weak var questionView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch choice {
        case 0:
            questionView.text = dic1["joy2"] as? String
        case 1:
            questionView.text = dic2["angry2"] as? String
        case 2:
            questionView.text = dic3["sad2"] as? String
        case 3:
            questionView.text = dic4["fun2"] as? String
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
        
        let cancelAction:UIAlertAction = UIAlertAction(title: "戻らない", style: UIAlertActionStyle.default, handler:{
            
            (action:UIAlertAction!) -> Void in
            
        })
        
        let defaultAction1:UIAlertAction = UIAlertAction(title: "戻る", style: UIAlertActionStyle.default, handler:{
            
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
