import UIKit
import CoreData

class ResultViewController: UIViewController {
    
    @IBOutlet weak var saveTime: UILabel!
    @IBOutlet weak var Q1answer: UILabel!
    @IBOutlet weak var Q2answer: UITextView!
    @IBOutlet weak var Q3answer: UITextView!
    @IBOutlet weak var Q4answer: UITextView!
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
        case 1:
            Q1answer.text = "怒"
        case 2:
            Q1answer.text = "哀"
        case 3:
            Q1answer.text = "楽"
        default:
            print("nil")
        }
        
        Q1answer.textColor = UIColor.rgb(r: 240, g: 55, b: 105, alpha: 1)
        
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
    
}
