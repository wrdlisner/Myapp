import UIKit
import CoreData

class DetailSaveDateViewController: UIViewController {
  
    @IBOutlet weak var saveTime: UILabel!
    @IBOutlet weak var Q1answer: UILabel!
    @IBOutlet weak var Q2answer: UITextView!
    @IBOutlet weak var Q3answer: UITextView!
    @IBOutlet weak var Q4answer: UITextView!
    @IBOutlet weak var Q5answer: UITextView!
    @IBOutlet weak var myStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
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

    func viewKokolog() {
        
        let kokolog = readKokolog
        
        let df = DateFormatter()
        df.dateFormat = "yyyy年MM月dd日(EEEEE) H時m分"
        df.locale = Locale(identifier: "ja_JP")
        
        saveTime.text = "\(String(describing: kokolog.date!))"
        saveTime.text = df.string(from: kokolog.date! as Date)
        
    }
    
}
