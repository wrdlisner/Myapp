import UIKit
import CoreData

class logSaveDateViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
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
            refreshTableView()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
    
    func refreshTableView(){
        myTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return readKokolog.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cellSaveDate")
        
        let kokolog = readKokolog[indexPath.row]
        
        var Q1andRangeSelected : (Int,Int) = (Int(kokolog.question1),Int(kokolog.rangeQ1))
        
        tableView.backgroundColor = UIColor.rgb(r: 255, g: 255, b: 232, alpha: 1)
        cell.backgroundColor = UIColor.rgb(r: 255, g: 255, b: 232, alpha: 1)
        cell.textLabel?.font = UIFont(name: "HannariMincho", size: 25)
        
        switch kokolog.question1 {
        case 0:
            cell.textLabel?.textColor = UIColor.joy
        case 1:
            cell.textLabel?.textColor = UIColor.anger
        case 2:
            cell.textLabel?.textColor = UIColor.sad
        case 3:
            cell.textLabel?.textColor = UIColor.happy
        default:
            print("nul")
        }
        
        let df = DateFormatter()
        df.dateFormat = "yyyy年MM月dd日(EEEEE) H時m分"
        df.locale = Locale(identifier: "ja_JP")
        
        cell.detailTextLabel?.text = "\(String(describing: kokolog.date!))"
        cell.detailTextLabel?.text = df.string(from: kokolog.date! as Date)
        cell.detailTextLabel?.textColor = UIColor.rgb(r: 64, g: 64, b: 64, alpha: 1)
        
        switch Q1andRangeSelected {
        case(0,0):
            cell.textLabel?.text = "喜 小"
        case(0,1):
            cell.textLabel?.text = "喜 中"
        case(0,2):
            cell.textLabel?.text = "喜 大"
        case(1,0):
            cell.textLabel?.text = "怒 小"
        case(1,1):
            cell.textLabel?.text = "怒 中"
        case(1,2):
            cell.textLabel?.text = "怒 大"
        case(2,0):
            cell.textLabel?.text = "哀 小"
        case(2,1):
            cell.textLabel?.text = "哀 中"
        case(2,2):
            cell.textLabel?.text = "哀 大"
        case(3,0):
            cell.textLabel?.text = "楽 小"
        case(3,1):
            cell.textLabel?.text = "楽 中"
        case(3,2):
            cell.textLabel?.text = "楽 大"
        default:
            print("nil")
        }
        
        var attr = NSMutableAttributedString()
        attr = NSMutableAttributedString(string: (cell.textLabel?.text)!)
        attr.addAttribute(.foregroundColor, value: UIColor.rgb(r: 246, g: 165, b: 50, alpha: 1), range:NSMakeRange(2, 1))
        
        print(NSMakeRange(2, 1))
        
        cell.textLabel?.attributedText = attr
        
        return cell
    }
    
    var selectedIndex:Date?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = readKokolog[indexPath.row].date! as Date
        performSegue(withIdentifier: "toDetail", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail" {
            let dateCatch:DetailSaveDateViewController = segue.destination as!
            DetailSaveDateViewController
            
            dateCatch.passedIndex = selectedIndex
        }
    }
    
    @IBAction func backtoSavedatefromDetail(segue:UIStoryboardSegue){
        
    }
    
}
