import UIKit
import UserNotifications

// 設定画面に追加するもの
// 通知機能,作者ブログ,「こころぐ」のレビュー

var Title = [ ["通知", "通知を設定する"] ]

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
        myTableVIew.backgroundColor = UIColor.yellow
        return Title[section].count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "cell")
        cell.textLabel?.text = Title[indexPath.section][indexPath.row + 1]
        cell.contentView.backgroundColor = UIColor.rgb(r: 255, g: 255, b: 232, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Title[section][0]
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let next = storyboard!.instantiateViewController(withIdentifier: "Notification")
        self.present(next,animated: true, completion: nil)
        
    }

}
