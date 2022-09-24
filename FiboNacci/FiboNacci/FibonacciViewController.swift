//
//  FibonacciViewController.swift
//  FiboNacci
//
//  Created by ICMMAC05-7528 on 20/09/22.
//

import UIKit

class FibonacciViewController: UIViewController {
    @IBOutlet weak var txtFibonacci: UITextField!
    @IBOutlet weak var lbResultado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btCalculoFibo(_ sender: Any) {
        var penultimonumero = 1
        var ultimonumero = 1
        var resultadodonumero = 1
        if let numeroFibonacci = Int(txtFibonacci.text!){
            for i in 1...(numeroFibonacci-2){
                resultadodonumero = ultimonumero + penultimonumero
                penultimonumero = ultimonumero
                ultimonumero = resultadodonumero
            }
            lbResultado.text = "\(resultadodonumero)"
            view.endEditing(true)
        }
    }
    
}
