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
        }
        
        let content = UNMutableNotificationContent()
        content.title = "こころぐを書く時間です"
        content.body = "今日のこころぐは書きましたか？日々の感情を記録に録りましょう。"
        content.sound = UNNotificationSound.default()
        
        let date = DateComponents(month:7, day:7, hour:12, minute:0)
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: date, repeats: true)
        
        let request = UNNotificationRequest.init(identifier: "CalendarNotification", content: content, trigger: trigger);          center.add(request)
    }
    
    @IBAction func backtoTopfromLog(segue:UIStoryboardSegue){
    }
    
    @IBAction func backtoTopfromDetail(segue:UIStoryboardSegue){
    }
    
}
