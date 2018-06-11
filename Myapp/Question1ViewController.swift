
import UIKit


 var emotions = ["喜/嬉しい、幸せ、めでたい","怒/不機嫌、腹立たしい、イライラ","哀/悲しい、苦しい","楽/楽しい、満足"]

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
    
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "choices1")
        
        let details = emotions[indexPath.row].components(separatedBy: "/")
     
        cell.textLabel!.text = details[0]
        cell.detailTextLabel!.text = details[1]
        cell.backgroundColor = UIColor.rgb(r: 255, g: 255, b: 230, alpha: 1)
        
        return cell
    }

    @IBOutlet weak var tableView: UITableView!

    var selectedIndex:Int!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "segue2", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var move:Question2ViewController?
        
        if segue.destination is Question2ViewController {
           
            emotions[0] = "喜を選んだあなた"
            emotions[1] = "怒を選んだあなた"
            emotions[2] = "哀を選んだあなた"
            emotions[3] = "楽を選んだあなた"
            
            move = segue.destination as? Question2ViewController
            move?.passedIndex = selectedIndex
        }
        
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
    

}
