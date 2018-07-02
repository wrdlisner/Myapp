import UIKit
import CoreData

class ResultViewController: UIViewController {
    
    @IBOutlet weak var saveTime: UILabel!
    @IBOutlet weak var Q1question: UILabel!
    @IBOutlet weak var Q1answer: UILabel!
    @IBOutlet weak var Q2question: UILabel!
    @IBOutlet weak var Q2answer: UITextView!
    @IBOutlet weak var Q3question: UILabel!
    @IBOutlet weak var Q3answer: UITextView!
    @IBOutlet weak var Q4question: UILabel!
    @IBOutlet weak var Q4answer: UITextView!
    @IBOutlet weak var Q5question: UILabel!
    @IBOutlet weak var Q5answer: UITextView!
    
    var readKokolog: [Results] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Results")
        do {
            readKokolog = try managedContext.fetch(fetchRequest) as! [Results]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch choice {
        case 0:
            Q1answer.text = "喜"
            Q2question.text = dic1["joy1"] as? String
            Q3question.text = dic1["joy2"] as? String
            Q4question.text = dic1["joy3"] as? String
            Q5question.text = dic1["joy4"] as? String
        case 1:
            Q1answer.text = "怒"
            Q2question.text = dic2["angry1"] as? String
            Q3question.text = dic2["angry2"] as? String
            Q4question.text = dic2["angry3"] as? String
            Q5question.text = dic2["angry4"] as? String
        case 2:
            Q1answer.text = "哀"
            Q2question.text = dic3["sad1"] as? String
            Q3question.text = dic3["sad2"] as? String
            Q4question.text = dic3["sad3"] as? String
            Q5question.text = dic3["sad4"] as? String
        case 3:
            Q1answer.text = "楽"
            Q2question.text = dic4["fun1"] as? String
            Q3question.text = dic4["fun2"] as? String
            Q4question.text = dic4["fun3"] as? String
            Q5question.text = dic4["fun4"] as? String
        default:
            print("nil")
        }
        
        Q1question.text = "今の感情に一番近いものを選んでください"
        Q1answer.textColor = UIColor.rgb(r: 240, g: 55, b: 105, alpha: 1)
        
        Q1question.numberOfLines = 0
        Q1question.sizeToFit()
        Q1question.lineBreakMode = NSLineBreakMode.byCharWrapping
        Q2question.numberOfLines = 0
        Q2question.sizeToFit()
        Q2question.lineBreakMode = NSLineBreakMode.byCharWrapping
        Q3question.numberOfLines = 0
        Q3question.sizeToFit()
        Q3question.lineBreakMode = NSLineBreakMode.byCharWrapping
        Q4question.numberOfLines = 0
        Q4question.sizeToFit()
        Q4question.lineBreakMode = NSLineBreakMode.byCharWrapping
        Q5question.numberOfLines = 0
        Q5question.sizeToFit()
        Q5question.lineBreakMode = NSLineBreakMode.byCharWrapping
        
        Q2answer.text = question2Answer
        Q3answer.text = question3Answer
        Q4answer.text = question4Answer
        Q5answer.text = question5Answer
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(urls[urls.count-1] as URL)

        let df = DateFormatter()
        df.dateFormat = "yyyy年MM月dd日(EEEEE) H時m分"
        df.locale = Locale(identifier: "ja_JP")
        
        let now = Date()
        saveTime.text = df.string(from: now)
        saveTime.font = UIFont.systemFont(ofSize: 17)
    }

    @IBAction func alertButton(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Topに戻ります", message: nil, preferredStyle: .alert)
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
