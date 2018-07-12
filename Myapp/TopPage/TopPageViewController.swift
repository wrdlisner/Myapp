import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        choice = -1
        question2Answer = ""
        question3Answer = ""
        question4Answer = ""
        question5Answer = ""
        
        // current() メソッドを使用してシングルトンオブジェクトを取得
        let center = UNUserNotificationCenter.current()
        
        // 通知の使用許可をリクエスト
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            // Enable or disable features based on authorization.
        }
        
        // UNMutableNotificationContent 作成
        let content = UNMutableNotificationContent()
        content.title = "Hello!"
        content.body = "It's time!"
        content.sound = UNNotificationSound.default()
        
        // UNCalendarNotificationTrigger 作成
        let date = DateComponents(month:7, day:7, hour:12, minute:0)
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: date, repeats: false)
        
        // id, content, trigger から UNNotificationRequest 作成
        let request = UNNotificationRequest.init(identifier: "CalendarNotification", content: content, trigger: trigger);          center.add(request)
    }
    
    @IBAction func backtoTopfromLog(segue:UIStoryboardSegue){
    }
    
    @IBAction func backtoTopfromDetail(segue:UIStoryboardSegue){
    }
    
}
