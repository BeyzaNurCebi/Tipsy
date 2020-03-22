

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result=Float()
    var numberOfPerson=Int()
    var percent=Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text=String(format: "%.1f", result)
        settingsLabel.text="Split between \(numberOfPerson) people, with \(percent)% tip."
    }
    
    
    @IBAction func recalculatedPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
