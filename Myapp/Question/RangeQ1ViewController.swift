import UIKit

var selectMind = ["喜","怒","哀","楽"]

var ranges = ["小/度合いは酷くない、小さい","中/ふつう","大/度合いが酷い、大きい"]

var rangeChoice:Int = -1

class RangeQ1ViewController: UIViewController,
    UITableViewDataSource, UITableViewDelegate

{
    @IBOutlet weak var rangeMind: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    rangeMind.text = selectMind[choice]
        
        switch choice {
        case 0:
            rangeMind.textColor = UIColor.joy
        case 1:
            rangeMind.textColor = UIColor.anger
        case 2:
            rangeMind.textColor = UIColor.sad
        case 3:
            rangeMind.textColor = UIColor.happy
        default:
            print("nil")
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ranges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "choices")
        
        let details = ranges[indexPath.row].components(separatedBy: "/")
        
        cell.textLabel!.text = details[0]
        cell.textLabel?.textColor = UIColor.rgb(r: 246, g: 165, b: 50, alpha: 1)
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        cell.detailTextLabel!.text = details[1]
        cell.backgroundColor = UIColor.rgb(r: 255, g: 255, b: 230, alpha: 1)
        
        return cell
    }

    var selectedIndex:Int!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        rangeChoice = indexPath.row
        
        performSegue(withIdentifier: "toQ2", sender: nil)
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
    
    @IBAction func backtoRangeQ1(segue:UIStoryboardSegue){
        
    }

}
