import UIKit
import CoreData
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        changeSwiftyOnBoard()
        IQKeyboardManager.shared.enable = true
        
        return true
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
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
        let userDefault = UserDefaults.standard
        
        let storyboard:UIStoryboard = UIStoryboard(name: "Main",bundle:nil)
        
        if((userDefault.object(forKey: "key")) != nil){
            
            userDefault.set(userDefault.integer(forKey: "key") + 1, forKey: "key")
            
            userDefault.synchronize()
            
            let goTopPage = storyboard.instantiateViewController(withIdentifier: "topPage") as UIViewController
            UserDefaults.standard.set(true, forKey: "openApp")
            window?.rootViewController = goTopPage
            
        } else {
            
            userDefault.set(2, forKey: "key")
        }
    }
    
}
