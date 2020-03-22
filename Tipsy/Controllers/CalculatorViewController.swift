

import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
   
    var stepperValue=2
    var billValue = Float()
    var buttonDecimal:Float=0.0
    var result=Float()
    var buttonTitleInt=Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap=UITapGestureRecognizer(target: billTextField, action: #selector(billTextField.endEditing))
        view.addGestureRecognizer(tap)

    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected=false
        tenPctButton.isSelected=false
        twentyPctButton.isSelected=false
        
        let buttonTitle=sender.currentTitle!
        sender.isSelected=true
        
        
        buttonTitleInt=Int(buttonTitle.dropLast())!
        
        buttonDecimal=Float(buttonTitleInt) / Float(100)
        //view.endEditing(true)

        billValue = Float(billTextField.text!) ?? 0.0

    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepperValue = Int(sender.value)
        splitNumberLabel.text="\(stepperValue)"
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        result = (billValue + billValue*buttonDecimal) / Float(stepperValue)
        
        self.performSegue(withIdentifier: "goToResultView", sender: self)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultView"{
            let destiniation = segue.destination as! ResultsViewController
            destiniation.result=result
            destiniation.numberOfPerson=stepperValue
            destiniation.percent=buttonTitleInt
        }
    }
    
}

