import UIKit

var emotions = ["喜/嬉しい、幸せ、めでたい","怒/不機嫌、腹立たしい、イライラ","哀/悲しい、苦しい","楽/楽しい、満足"]

var choice:Int = -1

class Question1ViewController:UIViewController,
    UITableViewDataSource, UITableViewDelegate
    
    {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emotions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "choices")
        
        let details = emotions[indexPath.row].components(separatedBy: "/")
     
        cell.textLabel!.text = details[0]
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        cell.detailTextLabel!.text = details[1]
        cell.backgroundColor = UIColor.rgb(r: 255, g: 255, b: 230, alpha: 1)
        
        switch details[0] {
        case "喜":
            cell.textLabel?.textColor = UIColor.joy
        case "怒":
            cell.textLabel?.textColor = UIColor.anger
        case "哀":
            cell.textLabel?.textColor = UIColor.sad
        case "楽":
            cell.textLabel?.textColor = UIColor.happy
        default:
            print("error")
        }
        
        return cell
    }

    @IBOutlet weak var tableView: UITableView!

    var selectedIndex:Int!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        choice = indexPath.row
        
        performSegue(withIdentifier: "toRangeQ1", sender: nil)
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
    
    @IBAction func backtoQ1(segue:UIStoryboardSegue){
        
    }
    
}
