import UIKit
import CoreData

var question5Answer = ""

class Question5ViewController: UIViewController {
    @IBOutlet weak var questionView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch choice {
        case 0:
            questionView.text = dic1["joy4"] as? String
        case 1:
            questionView.text = dic2["angry4"] as? String
        case 2:
            questionView.text = dic3["sad4"] as? String
        case 3:
            questionView.text = dic4["fun4"] as? String
        default:
            print("nil")
        }

    }
    
    @IBOutlet weak var textField: UITextView!
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func resultAlert(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "こころぐを記録します", message: nil, preferredStyle: .alert)
        
        let cancelAction:UIAlertAction = UIAlertAction(title: "戻る", style: UIAlertActionStyle.default, handler:{
            
            (action:UIAlertAction!) -> Void in
            
        })
        
        let defaultAction1:UIAlertAction = UIAlertAction(title: "ろぐを見る", style: UIAlertActionStyle.default, handler:{

            (action:UIAlertAction!) -> Void in
            
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
}
