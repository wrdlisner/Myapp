
import UIKit

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

    
    let emotions = ["喜/嬉しい、幸せ、めでたい","怒/不機嫌、腹立たしい、イライラ","哀/悲しい、苦しい、","楽/楽しい、満足"]
    
    
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
    


}
