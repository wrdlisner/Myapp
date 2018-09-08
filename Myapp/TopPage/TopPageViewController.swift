import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        choice = -1
        rangeChoice = -1
        question2Answer = ""
        question3Answer = ""
        question4Answer = ""
        question5Answer = ""
        
    }
    
    @IBAction func backtoTopfromLog(segue:UIStoryboardSegue){
    }
    
    @IBAction func backtoTopfromDetail(segue:UIStoryboardSegue){
    }
    
    @IBAction func backtoTopfromSetting(segue:UIStoryboardSegue){
    }
    
    @IBAction func backtoTopfromNotification(segue:UIStoryboardSegue){
    }
}
