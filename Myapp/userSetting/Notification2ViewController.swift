import UIKit
import UserNotifications

let center = UNUserNotificationCenter.current()

class Notification2ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mydatepicker.setValue(UIColor.lightGray, forKey: "textColor")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var mydatepicker: UIDatePicker!
    
    @IBAction func DateSelector(_ sender: UIDatePicker) {
        
        changeDate(date: mydatepicker.date)
        
    }
    
    @IBAction func mySwitch(_ sender: UISwitch) {
        
        if mySwitch.isOn {
            mydatepicker.isMultipleTouchEnabled = true
            mydatepicker.isUserInteractionEnabled = true
            mydatepicker.setValue(UIColor.black, forKey: "textColor")
            
            center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            }
        } else {
            mydatepicker.isMultipleTouchEnabled = false
            mydatepicker.isUserInteractionEnabled = false
            mydatepicker.setValue(UIColor.lightGray, forKey: "textColor")
        }
        
    }
    
    func changeDate(date:Date){
        
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd HH:mm"
        df.locale = Locale(identifier: "ja_JP")
        let SettingDate = df.string(from: date)
        
        setNotification(date: SettingDate)
    }
    
    func setNotification(date:String){
        
        let content = UNMutableNotificationContent()
        content.title = "こころぐを書く時間です"
        content.body = "今日のこころぐは書きましたか？\n日々の感情を記録に録りましょう。"
        content.sound = UNNotificationSound.default()
        
        let date = date.components(separatedBy: " ")
        let dates = date[0].components(separatedBy: "/")
        let Time = date[1].components(separatedBy: ":")
        
        let setDC = DateComponents(year: Int(dates[0]), month: Int(dates[1]), day: Int(dates[2]), hour: Int(Time[0]), minute: Int(Time[1]))
        
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: setDC as DateComponents, repeats: true)
        
        let request = UNNotificationRequest.init(identifier: "CalendarNotification", content: content, trigger: trigger);
        center.add(request)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
}
