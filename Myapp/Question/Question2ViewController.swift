import UIKit

var selected = ["喜を選んだあなたへ","怒を選んだあなたへ","哀を選んだあなたへ","楽を選んだあなたへ"]

var question2Answer = ""

class Question2ViewController: UIViewController {
    
    @IBOutlet weak var name1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        question2Answer = ""
        
        var Q1andRangeSelected : (Int,Int) = (choice,rangeChoice)
        print("choiceの値は",choice)
        print("rangeChoiceの値は",rangeChoice)
        print("Q1andRangeSelectedの値は",Q1andRangeSelected)
        
        name1.text = selected[choice]
        textField.text! = question2Answer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var textField: UITextView!
    
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
        
        question2Answer = textField.text!
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        question2Answer = textField.text!
        
    }
    
    @IBAction func backtoQ2(segue:UIStoryboardSegue){
        
        question2Answer = textField.text!
        
    }

}
