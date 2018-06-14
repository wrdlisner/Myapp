import UIKit

var selected = ["喜を選んだあなたへ","怒を選んだあなたへ","哀を選んだあなたへ","楽を選んだあなたへ"]

class Question2ViewController: UIViewController {
    
    @IBOutlet weak var name1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name1.text = selected[choice]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }

}
