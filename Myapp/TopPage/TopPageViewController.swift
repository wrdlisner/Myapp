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
        
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            // Enable or disable features based on authorization.
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Hello!"
        content.body = "It's time!"
        content.sound = UNNotificationSound.default()
        
        let date = DateComponents(month:7, day:7, hour:12, minute:0)
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: date, repeats: false)
        
        let request = UNNotificationRequest.init(identifier: "CalendarNotification", content: content, trigger: trigger);          center.add(request)
    }
    
    @IBAction func backtoTopfromLog(segue:UIStoryboardSegue){
    }
    
    @IBAction func backtoTopfromDetail(segue:UIStoryboardSegue){
    }
    
}
