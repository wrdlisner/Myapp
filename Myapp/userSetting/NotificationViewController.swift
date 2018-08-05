import UIKit
import UserNotifications

class NotificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var mydatepicker: UIDatePicker!
    
    @IBAction func mySwitch(_ sender: UISwitch) {
        
        if mySwitch.isOn {
            mydatepicker.isMultipleTouchEnabled = true
            mydatepicker.isUserInteractionEnabled = true
            
            let content = UNMutableNotificationContent()
                content.title = "こころぐを書く時間です"
                content.body = "今日のこころぐは書きましたか？日々の感情を記録に録りましょう。"
                content.sound = UNNotificationSound.default()
            
            let date = DateComponents(month:7, day:30, hour:17, minute:20)
            let trigger = UNCalendarNotificationTrigger.init(dateMatching: date, repeats: true)
            
            let request = UNNotificationRequest.init(identifier: "CalendarNotification", content: content, trigger: trigger);
                center.add(request)
        } else {
            mydatepicker.isMultipleTouchEnabled = false
            mydatepicker.isUserInteractionEnabled = false
        }
    }
    
    @IBAction func myDatePicker(_ sender: UIDatePicker) {
        
        let df = DateFormatter()
        df.dateFormat = "H時m分"
        df.locale = Locale(identifier: "ja_JP")
        
        let SettingDate = df.string(from: sender.date)

    }
    
//    // フォーマットを生成.
//    let myDateFormatter: DateFormatter = DateFormatter()
//    myDateFormatter.dateFormat = "yyyy/MM/dd hh:mm"
//
//    // 日付をフォーマットに則って取得.
//    let mySelectedDate: NSString = myDateFormatter.string(from: sender.date)
//    myTextField.text = mySelectedDate as String
    
}
