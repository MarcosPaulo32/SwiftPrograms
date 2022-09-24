//
//  FatorialViewController.swift
//  FiboNacci
//
//  Created by ICMMAC05-7528 on 20/09/22.
//

import UIKit

class FatorialViewController: UIViewController {

    @IBOutlet weak var txtFatorial: UITextField!
    @IBOutlet weak var lbResultado: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btFatoCalculo(_ sender: Any) {
        var numberofatorial = 1
        if let numeroFatorial = Int(txtFatorial.text!){
            for i in 1...numeroFatorial{
                numberofatorial = numberofatorial*i
            }
            lbResultado.text = "\(numberofatorial)"
        }
        view.endEditing(true)
        txtFatorial.text = ""
    }
}
