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
        
        tableView.backgroundColor = UIColor.rgb(r: 255, g: 255, b: 232, alpha: 1)
        cell.backgroundColor = UIColor.rgb(r: 255, g: 255, b: 232, alpha: 1)
        cell.textLabel?.textColor = UIColor.rgb(r: 64, g: 64, b: 64, alpha: 1)
        cell.textLabel?.font = UIFont(name: "HannariMincho", size: 25)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 25)
        cell.textLabel?.textColor = UIColor.rgb(r: 242, g: 162, b: 160, alpha: 1)
        
        cell.textLabel?.text = "\(kokolog.question1)"
        
        let df = DateFormatter()
        df.dateFormat = "yyyy年MM月dd日(EEEEE) H時m分"
        df.locale = Locale(identifier: "ja_JP")
        
        cell.detailTextLabel?.text = "\(String(describing: kokolog.date!))"
        cell.detailTextLabel?.text = df.string(from: kokolog.date! as Date)
        cell.detailTextLabel?.textColor = UIColor.rgb(r: 64, g: 64, b: 64, alpha: 1)
        
        switch kokolog.question1 {
        case 0:
            cell.textLabel?.text = "喜"
        case 1:
            cell.textLabel?.text = "怒"
        case 2:
            cell.textLabel?.text = "哀"
        case 3:
            cell.textLabel?.text = "楽"
        default:
            print("nil")
        }
        
        return cell
    }
    
//    func deleteKokolog() {
//        let appDelegate:AppDelegate = (UIApplication.shared.delegate as? AppDelegate)!
//
//        let managedContext = appDelegate.persistentContainer.viewContext
//
//        let fetchRequest:NSFetchRequest<Results> = readKokolog.fetchRequest()
//
//        do {
//            readKokolog = try managedContext.fetch(fetchRequest)
//
//            for result in fetchRequest {
//                // １件ずつ取り出し
//                let question1:Int16 = result.value(forKey: "question1") as? Int16
//                let date:Date? = result.value(forKey: "Date") as? Date
//
//            managedContext.delete(result)
//        } catch let error as NSError {
//            print("Could not fetch. \(error), \(error.userInfo)")
//        }
//
//    }
//
    
    
    
    var selectedIndex:Date?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = readKokolog[indexPath.row].date! as Date
        performSegue(withIdentifier: "toDetail", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let dateCatch:DetailSaveDateViewController = segue.destination as!
        DetailSaveDateViewController

        dateCatch.passedIndex = selectedIndex
    }
    
}
