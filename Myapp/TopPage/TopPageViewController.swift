import UIKit
import UserNotifications

let center = UNUserNotificationCenter.current()

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        choice = -1
        rangeChoice = -1
        question2Answer = ""
        question3Answer = ""
        question4Answer = ""
        question5Answer = ""
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
        }

    }
    
    @IBAction func backtoTopfromLog(segue:UIStoryboardSegue){
    }
    
    @IBAction func backtoTopfromDetail(segue:UIStoryboardSegue){
    }
    
    @IBAction func backtoTopfromSetting(segue:UIStoryboardSegue){
    }
}
