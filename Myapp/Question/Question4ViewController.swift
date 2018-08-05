
import UIKit

var question4Answer = ""

class Question4ViewController: UIViewController {

    @IBOutlet weak var questionView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch choice {
        case 0:
            questionView.text = dic1["joy3"] as? String
        case 1:
            questionView.text = dic2["angry3"] as? String
        case 2:
            questionView.text = dic3["sad3"] as? String
        case 3:
            questionView.text = dic4["fun3"] as? String
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
