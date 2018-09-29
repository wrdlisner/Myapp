import UIKit
import CoreData

var question5Answer = ""

class Question5ViewController: UIViewController {
    @IBOutlet weak var questionView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var Q1andRangeSelected : (Int,Int) = (choice,rangeChoice)
        print("choiceの値は",choice)
        print("rangeChoiceの値は",rangeChoice)
        print("Q1andRangeSelectedの値は",Q1andRangeSelected)
        
        switch Q1andRangeSelected {
        case (0,0):
            questionView.text = dic1["joy1-3"] as? String
        case (0,1):
            questionView.text = dic1["joy2-3"] as? String
        case (0,2):
            questionView.text = dic1["joy3-3"] as? String
        case (1,0):
            questionView.text = dic2["angry1-3"] as? String
        case (1,1):
            questionView.text = dic2["angry2-3"] as? String
        case (1,2):
            questionView.text = dic2["angry3-3"] as? String
        case (2,0):
            questionView.text = dic3["sad1-3"] as? String
        case (2,1):
            questionView.text = dic3["sad2-3"] as? String
        case (2,2):
            questionView.text = dic3["sad3-3"] as? String
        case (3,0):
            questionView.text = dic4["fun1-3"] as? String
        case (3,1):
            questionView.text = dic4["fun2-3"] as? String
        case (3,2):
            questionView.text = dic4["fun3-3"] as? String
        default:
            print("nil")
        }

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func resultAlert(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "こころぐを記録します", message: nil, preferredStyle: .alert)
        
        let cancelAction:UIAlertAction = UIAlertAction(title: "いいえ", style: UIAlertActionStyle.default, handler:{
            
            (action:UIAlertAction!) -> Void in
            
        })
        
        let defaultAction1:UIAlertAction = UIAlertAction(title: "はい", style: UIAlertActionStyle.default, handler:{

            (action:UIAlertAction!) -> Void in
            
            question5Answer = self.textField.text!
            
            self.saveKokolog()
            
            let storyboard: UIStoryboard = self.storyboard!
            
            let ResultView = storyboard.instantiateViewController(withIdentifier: "ResultView")
            
            self.present(ResultView, animated: true, completion: nil)
            
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(defaultAction1)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func saveKokolog() {
        var test: [NSManagedObject] = []

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        let entity = NSEntityDescription.entity(forEntityName: "Results",
                                                in: managedContext)!

        let result = NSManagedObject(entity: entity,
                                     insertInto: managedContext)

        result.setValue(Date(), forKeyPath: "date")
        result.setValue(rangeChoice, forKey: "rangeQ1")
        result.setValue(choice, forKeyPath: "question1")
        result.setValue(question2Answer, forKeyPath: "question2")
        result.setValue(question3Answer, forKeyPath: "question3")
        result.setValue(question4Answer, forKeyPath: "question4")
        result.setValue(question5Answer, forKeyPath: "question5")
        result.setValue(Date(), forKeyPath: "viewDate")

        do {
            try managedContext.save()
            test.append(result)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
        question5Answer = textField.text!

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        question5Answer = textField.text!
        
    }

}
