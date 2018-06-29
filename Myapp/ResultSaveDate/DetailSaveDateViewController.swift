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
    
    @IBOutlet weak var editLabel: UIButton!
    
    //tapCount整数の設定
    var tapCount: Int! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.resetCount()
        
    }
    
    //tapCountの初期化
    func resetCount() {
        self.tapCount = 0
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
        
        fetchRequest.predicate = NSPredicate(format: "date = %@",passedIndex! as CVarArg)
        
        do {
            readKokolog = try managedContext.fetch(fetchRequest) as! [Results]
             } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
                
        }
        
        viewKokolog()
        
    }
    
    var passedIndex:Date? = nil
    
    func viewKokolog() {
        
        let df = DateFormatter()
        df.dateFormat = "yyyy年MM月dd日(EEEEE) H時m分"
        df.locale = Locale(identifier: "ja_JP")

        saveTime.text = "\(String(describing: readKokolog[0].date!))"
        saveTime.text = df.string(from: readKokolog[0].date! as Date)
        saveTime.font = UIFont(name: "HannariMincho", size: 18)
        
        Q2answer.text = readKokolog[0].question2
        Q3answer.text = readKokolog[0].question3
        Q4answer.text = readKokolog[0].question4
        Q5answer.text = readKokolog[0].question5
        Q1answer.textColor = UIColor.rgb(r: 242, g: 162, b: 160, alpha: 1)
        
        switch readKokolog[0].question1 {
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
    }
    
    var editKokolog : [Results]  = []
    
    @IBAction func editButton(_ sender: Any) {
        
        Q2answer.isEditable = true
        Q2answer.isUserInteractionEnabled = true
        Q3answer.isEditable = true
        Q3answer.isUserInteractionEnabled = true
        Q4answer.isEditable = true
        Q4answer.isUserInteractionEnabled = true
        Q5answer.isEditable = true
        Q5answer.isUserInteractionEnabled = true

        // タップ回数を加算
        self.tapCount +=
        
        //タップ回数に応じて表示文字と処理を切り替える
        //"編集"をタップしたら"完了"が表示され、"完了"がタップされたら"編集"が表示されて、coredateを保存する"editDoneKokolog"を呼び出す
        if ( tapCount % 2 == 0 ){
            editLabel.setTitle("完了", for: .normal)
        } else {
            editLabel.setTitle("編集", for: .normal)
            editDoneKokolog()
        }
        
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
            
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Results")
            
            fetchRequest.predicate = NSPredicate(format: "date = %@",passedIndex! as CVarArg)
        
        do {
             editKokolog = try managedContext.fetch(fetchRequest) as! [Results]
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
    
    func editDoneKokolog() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Results")
        
        fetchRequest.predicate = NSPredicate(format: "date = %@",passedIndex! as CVarArg)
        
        do {
            editKokolog = try managedContext.fetch(fetchRequest) as! [Results]
            
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
