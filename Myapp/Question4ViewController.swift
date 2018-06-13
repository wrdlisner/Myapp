
import UIKit

class Question4ViewController: UIViewController {

    @IBOutlet weak var questionView: UITextView!
    
    var passedIndex:Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch passedIndex {
        case 0:
            questionView.text = dic1["joy3"] as? String
        case 1:
            questionView.text = dic2["angry3"] as? String
        case 2:
            questionView.text = dic3["sad3"] as? String
        case 3:
            questionView.text = dic4["fun3"] as? String
        default:
            print("nil")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
