import UIKit

class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = mydata {
            task.text = mydata?.task
            desc.text = mydata?.desc
        }
    }
    
    
    @IBOutlet weak var task: UITextField!
    @IBOutlet weak var desc: UITextField!
    
    var mydata: MyData?
}
