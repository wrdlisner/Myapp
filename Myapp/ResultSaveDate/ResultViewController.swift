import UIKit
import CoreData

class ResultViewController: UIViewController {
    
    @IBOutlet weak var saveTime: UILabel!
    @IBOutlet weak var Q1question: UILabel!
    @IBOutlet weak var rangeAnswer: UILabel!
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
        
        switch Q1andRangeSelected {
        case(0,0):
            Q3question.text = dic1["joy1-1"] as? String
            Q4question.text = dic1["joy1-2"] as? String
            Q5question.text = dic1["joy1-3"] as? String
        case(0,1):
            Q3question.text = dic1["joy2-1"] as? String
            Q4question.text = dic1["joy2-2"] as? String
            Q5question.text = dic1["joy2-3"] as? String
        case(0,2):
            Q3question.text = dic1["joy3-1"] as? String
            Q4question.text = dic1["joy3-2"] as? String
            Q5question.text = dic1["joy3-3"] as? String
        case(1,0):
            Q3question.text = dic1["angry1-1"] as? String
            Q4question.text = dic1["angry1-2"] as? String
            Q5question.text = dic1["angry1-3"] as? String
        case(1,1):
            Q3question.text = dic1["angry2-1"] as? String
            Q4question.text = dic1["angry2-2"] as? String
            Q5question.text = dic1["angry2-3"] as? String
        case(1,2):
            Q3question.text = dic1["angry2-1"] as? String
            Q4question.text = dic1["angry2-2"] as? String
            Q5question.text = dic1["angry2-3"] as? String
        case(2,0):
            Q3question.text = dic1["sad1-1"] as? String
            Q4question.text = dic1["sad1-2"] as? String
            Q5question.text = dic1["sad1-3"] as? String
        case(2,1):
            Q3question.text = dic1["sad2-1"] as? String
            Q4question.text = dic1["sad2-2"] as? String
            Q5question.text = dic1["sad2-3"] as? String
        case(2,2):
            Q3question.text = dic1["sad2-1"] as? String
            Q4question.text = dic1["sad2-2"] as? String
            Q5question.text = dic1["sad2-3"] as? String
        default:
            print("nil")
        }
        
        switch choice {
        case 0:
            Q1answer.text = "喜"
            Q1answer.textColor = UIColor.joy
        case 1:
            Q1answer.text = "怒"
            Q1answer.textColor = UIColor.anger
        case 2:
            Q1answer.text = "哀"
            Q1answer.textColor = UIColor.sad
        case 3:
            Q1answer.text = "楽"
            Q1answer.textColor = UIColor.happy
        default:
            print("nil")
        }
        
        switch rangeChoice {
        case 0:
            rangeAnswer.text = "1"
        case 1:
            rangeAnswer.text = "2"
        case 2:
             rangeAnswer.text = "3"
        default:
            print("nil")
        }
        
        Q1question.text = "今の感情に一番近いものを選んでください"
        Q1answer.font = UIFont.boldSystemFont(ofSize: 20)
        Q2question.text = "どんな事がありましたか？"
        rangeAnswer.textColor = UIColor.rgb(r: 246, g: 165, b: 50, alpha: 1)
        
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
    
}
