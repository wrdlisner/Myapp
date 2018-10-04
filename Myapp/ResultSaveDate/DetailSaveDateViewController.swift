import UIKit
import CoreData

class DetailSaveDateViewController: UIViewController {
    
    @IBOutlet weak var saveTime: UILabel!
    @IBOutlet weak var Q1question: UILabel!
    @IBOutlet weak var Q1answer: UILabel!
    @IBOutlet weak var rangeAnswer: UILabel!
    @IBOutlet weak var Q2question: UILabel!
    @IBOutlet weak var Q2answer: UITextView!
    @IBOutlet weak var Q3question: UILabel!
    @IBOutlet weak var Q3answer: UITextView!
    @IBOutlet weak var Q4question: UILabel!
    @IBOutlet weak var Q4answer: UITextView!
    @IBOutlet weak var Q5question: UILabel!
    @IBOutlet weak var Q5answer: UITextView!
    @IBOutlet weak var myStackView: UIStackView!
    
    @IBOutlet weak var editLabel: UIButton!
    
    var readKokolog: [Results] = []
    var tapCount: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resetCount()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Results")
        
        fetchRequest.predicate = NSPredicate(format: "date = %@",passedIndex! as CVarArg)
        
        do {
            readKokolog = try managedContext.fetch(fetchRequest) as! [Results]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            
        }
        
        viewKokolog()
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(urls[urls.count-1] as URL)
        
    }
    
    func resetCount() {
        self.tapCount = 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var passedIndex:Date? = nil
    
    func viewKokolog() {
        
        let df = DateFormatter()
        df.dateFormat = "yyyy年MM月dd日(EEEEE) H時m分"
        df.locale = Locale(identifier: "ja_JP")
        
        saveTime.text = "\(String(describing: readKokolog[0].date!))"
        saveTime.text = df.string(from: readKokolog[0].date! as Date)
        saveTime.font = UIFont(name: "HannariMincho", size: 18)
        
        var Q1andRangeSelected : (Int,Int) = (Int(readKokolog[0].question1),Int(readKokolog[0].rangeQ1))
        
        Q2answer.text = readKokolog[0].question2
        Q3answer.text = readKokolog[0].question3
        Q4answer.text = readKokolog[0].question4
        Q5answer.text = readKokolog[0].question5
        Q1question.text = "今の感情に一番近いものを選んでください"
        Q1answer.font = UIFont.boldSystemFont(ofSize: 25)
        Q2question.text = "どんな事がありましたか？"
        rangeAnswer.textColor = UIColor.rgb(r: 246, g: 165, b: 50, alpha: 1)
        rangeAnswer.font = UIFont.boldSystemFont(ofSize: 25)
        
        switch Q1andRangeSelected {
        case(0,0):
            Q1answer.text = "喜"
            Q1answer.textColor = UIColor.joy
            rangeAnswer.text = "小"
            Q3question.text = dic1["joy1-1"] as? String
            Q4question.text = dic1["joy1-2"] as? String
            Q5question.text = dic1["joy1-3"] as? String
        case(0,1):
            Q1answer.text = "喜"
            Q1answer.textColor = UIColor.joy
            rangeAnswer.text = "中"
            Q3question.text = dic1["joy2-1"] as? String
            Q4question.text = dic1["joy2-2"] as? String
            Q5question.text = dic1["joy2-3"] as? String
        case(0,2):
            Q1answer.text = "喜"
            Q1answer.textColor = UIColor.joy
            rangeAnswer.text = "大"
            Q3question.text = dic1["joy3-1"] as? String
            Q4question.text = dic1["joy3-2"] as? String
            Q5question.text = dic1["joy3-3"] as? String
        case(1,0):
            Q1answer.text = "怒"
            Q1answer.textColor = UIColor.anger
            rangeAnswer.text = "小"
            Q3question.text = dic2["angry1-1"] as? String
            Q4question.text = dic2["angry1-2"] as? String
            Q5question.text = dic2["angry1-3"] as? String
        case(1,1):
            Q1answer.text = "怒"
            Q1answer.textColor = UIColor.anger
            rangeAnswer.text = "中"
            Q3question.text = dic2["angry2-1"] as? String
            Q4question.text = dic2["angry2-2"] as? String
            Q5question.text = dic2["angry2-3"] as? String
        case(1,2):
            Q1answer.text = "怒"
            Q1answer.textColor = UIColor.anger
            rangeAnswer.text = "大"
            Q3question.text = dic2["angry2-1"] as? String
            Q4question.text = dic2["angry2-2"] as? String
            Q5question.text = dic2["angry2-3"] as? String
        case(2,0):
            Q1answer.text = "哀"
            Q1answer.textColor = UIColor.sad
            rangeAnswer.text = "小"
            Q3question.text = dic3["sad1-1"] as? String
            Q4question.text = dic3["sad1-2"] as? String
            Q5question.text = dic3["sad1-3"] as? String
        case(2,1):
            Q1answer.text = "哀"
            Q1answer.textColor = UIColor.sad
            rangeAnswer.text = "中"
            Q3question.text = dic3["sad2-1"] as? String
            Q4question.text = dic3["sad2-2"] as? String
            Q5question.text = dic3["sad2-3"] as? String
        case(2,2):
            Q1answer.text = "哀"
            Q1answer.textColor = UIColor.sad
            rangeAnswer.text = "大"
            Q3question.text = dic3["sad2-1"] as? String
            Q4question.text = dic3["sad2-2"] as? String
            Q5question.text = dic3["sad2-3"] as? String
        case(3,0):
            Q1answer.text = "楽"
            Q1answer.textColor = UIColor.joy
            rangeAnswer.text = "小"
            Q3question.text = dic4["fun1-1"] as? String
            Q4question.text = dic4["fun1-2"] as? String
            Q5question.text = dic4["fun1-3"] as? String
        case(3,1):
            Q1answer.text = "楽"
            Q1answer.textColor = UIColor.joy
            rangeAnswer.text = "中"
            Q3question.text = dic4["fun2-1"] as? String
            Q4question.text = dic4["fun2-2"] as? String
            Q5question.text = dic4["fun2-3"] as? String
        case(3,2):
            Q1answer.text = "楽"
            Q1answer.textColor = UIColor.joy
            rangeAnswer.text = "大"
            Q3question.text = dic4["fun3-1"] as? String
            Q4question.text = dic4["fun3-2"] as? String
            Q5question.text = dic4["fun3-3"] as? String
        default:
            print("nil")
        }
        
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
    }
    
    var editKokolog : [Results]  = []
    
    @IBAction func editButton(_ sender: Any) {
        
        self.tapCount += 1
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Results")
        
        fetchRequest.predicate = NSPredicate(format: "date = %@",passedIndex! as CVarArg)
        
        if ( tapCount % 2 == 0 ){
            editLabel.setTitle("完了", for: .normal)
            editLabel.setTitleColor(UIColor.rgb(r: 246, g: 165, b: 50, alpha: 1), for: .normal)
            
            Q2answer.isEditable = true
            Q2answer.isUserInteractionEnabled = true
            Q3answer.isEditable = true
            Q3answer.isUserInteractionEnabled = true
            Q4answer.isEditable = true
            Q4answer.isUserInteractionEnabled = true
            Q5answer.isEditable = true
            Q5answer.isUserInteractionEnabled = true
            
            editStart()
            
        } else {
            editLabel.setTitle("編集", for: .normal)
            editLabel.setTitleColor(UIColor.rgb(r: 242, g: 162, b: 160, alpha: 1), for: .normal)
            
            Q2answer.isEditable = false
            Q2answer.isUserInteractionEnabled = false
            Q3answer.isEditable = false
            Q3answer.isUserInteractionEnabled = false
            Q4answer.isEditable = false
            Q4answer.isUserInteractionEnabled = false
            Q5answer.isEditable = false
            Q5answer.isUserInteractionEnabled = false
            
            editDone()
            editSaveKokolog()
            
        }
        
        do {
            
            editKokolog = try managedContext.fetch(fetchRequest) as! [Results]
            
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func editStart() {
        
        Q2answer.backgroundColor = UIColor.white
        Q3answer.backgroundColor = UIColor.white
        Q4answer.backgroundColor = UIColor.white
        Q5answer.backgroundColor = UIColor.white
    }
    
    func editDone() {
        
        Q2answer.backgroundColor = UIColor.rgb(r: 255, g: 255, b: 234, alpha: 1.0)
        Q3answer.backgroundColor = UIColor.rgb(r: 255, g: 255, b: 234, alpha: 1.0)
        Q4answer.backgroundColor = UIColor.rgb(r: 255, g: 255, b: 234, alpha: 1.0)
        Q5answer.backgroundColor = UIColor.rgb(r: 255, g: 255, b: 234, alpha: 1.0)
        
    }
    
    
    func editSaveKokolog() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Results")
        
        fetchRequest.predicate = NSPredicate(format: "date = %@",passedIndex! as CVarArg)
        
        do {
            editKokolog = try managedContext.fetch(fetchRequest) as! [Results]
            
            editKokolog[0].question2 = Q2answer.text
            editKokolog[0].question3 = Q3answer.text
            editKokolog[0].question4 = Q4answer.text
            editKokolog[0].question5 = Q5answer.text
            
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        
        let alertController = UIAlertController(title: "ろぐを削除しますか?", message: nil, preferredStyle: .alert)
        
        let cancelAction:UIAlertAction = UIAlertAction(title: "いいえ", style: UIAlertActionStyle.default, handler:{
            
            (action:UIAlertAction!) -> Void in
            
        })
        
        let defaultAction1:UIAlertAction = UIAlertAction(title: "はい", style: UIAlertActionStyle.default, handler:{
            
            (action:UIAlertAction!) -> Void in
            
            let controller = self.storyboard!.instantiateViewController(withIdentifier: "logSavedate")
            
            self.show(controller, sender: true)
            
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Results")
            
            fetchRequest.predicate = NSPredicate(format: "date = %@",self.passedIndex! as CVarArg)
            
            do {
                self.editKokolog = try managedContext.fetch(fetchRequest) as! [Results]
                
                try managedContext.delete(self.editKokolog[0])
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
            
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(defaultAction1)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        self.myStackView.endEditing(true)
        
    }
    
    
    
}
