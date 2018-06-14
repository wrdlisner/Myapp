import UIKit

class Question5ViewController: UIViewController {
    @IBOutlet weak var questionView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch choice {
        case 0:
            questionView.text = dic1["joy4"] as? String
        case 1:
            questionView.text = dic2["angry4"] as? String
        case 2:
            questionView.text = dic3["sad4"] as? String
        case 3:
            questionView.text = dic4["fun4"] as? String
        default:
            print("nil")
        }
    }
    
    @IBAction func alertButton(_ sender: UIButton) {
    
    let alertController = UIAlertController(title: "Topに戻ります", message: nil, preferredStyle: .alert)
    
    let cancelAction:UIAlertAction = UIAlertAction(title: "戻らない", style: UIAlertActionStyle.default, handler:{
        
        (action:UIAlertAction!) -> Void in
        
    })
    
    let defaultAction1:UIAlertAction = UIAlertAction(title: "戻る", style: UIAlertActionStyle.default, handler:{
        
        (action:UIAlertAction!) -> Void in
        
        let controller = self.storyboard!.instantiateInitialViewController()
        
        self.show(controller!, sender: true)
        
    })
    
    alertController.addAction(cancelAction)
    alertController.addAction(defaultAction1)
    
    present(alertController, animated: true, completion: nil)
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func resultAlert(_ sender: UIButton) {
    
    let alertController = UIAlertController(title: "こころぐを記録します", message: nil, preferredStyle: .alert)
    
    let cancelAction:UIAlertAction = UIAlertAction(title: "戻る", style: UIAlertActionStyle.default, handler:{
        
        (action:UIAlertAction!) -> Void in
        
    })
    
    let defaultAction1:UIAlertAction = UIAlertAction(title: "ろぐを見る", style: UIAlertActionStyle.default, handler:{
        
        (action:UIAlertAction!) -> Void in
        
        //アラートからの遷移が上手くいかない死にたい
        let controller = ResultViewController()

        self.show(controller, sender: true)
        
    })
    
    alertController.addAction(cancelAction)
    alertController.addAction(defaultAction1)
    
    present(alertController, animated: true, completion: nil)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
}
