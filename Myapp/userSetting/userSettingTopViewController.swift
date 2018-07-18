import UIKit

var Title = [ ["設定1", "Detail 1-1", "Detail 1-2"],
              
              ["設定2", "Detail 2-1", "Detail 2-2"],
              
              ["設定3", "Detail 3-1", "Detail 3-2"]]

class userSettingTopViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var myTableVIew: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableVIew.delegate = self
        myTableVIew.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return Title.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Title[section].count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "cell")
        cell.textLabel?.text = Title[indexPath.section][indexPath.row + 1]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Title[section][0]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }


}
