import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        changeSwiftyOnBoard()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.

        self.saveContext()

    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "result")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func changeSwiftyOnBoard(){
        //UserDefaultのインスタンスを生成
        let userDefault = UserDefaults.standard
        
        let flg = false//分岐条件
        
        let storyboard:UIStoryboard = UIStoryboard(name: "topPage",bundle:nil)
        let viewController:UIViewController
        
        //前回の保存されたデータがあるかどうか判断
        if((userDefault.object(forKey: "key")) != nil){
            
            //データの保存。今回訪れた回数に+1している。
            userDefault.set(userDefault.integer(forKey: "key") + 1, forKey: "key")
            
            //データの同期
            userDefault.synchronize()
            
            let goTopPage = storyboard.instantiateViewController(withIdentifier: "topPage") as UIViewController
//            self.present(goTopPage!, animated: true, completion: nil)
            UserDefaults.standard.set(true, forKey: "openApp")
             window?.rootViewController = goTopPage
            
        } else {
            
            //次に訪れる回数の2を保存する
            userDefault.set(2, forKey: "key")
        }
       
    }
}
