//
//  SegundaViewController.swift
//  FatoNacci
//
//  Created by ICMMAC06-7A13 on 19/09/22.
//

import UIKit

class FibonarController: UIViewController {
    @IBOutlet weak var txtFibonar: UITextField!
    @IBOutlet weak var lbResultado1: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btCalculoFibo(_ sender: Any) {
        if let termo = Int(txtFibonar.text!){
            var ultimoTermo = 1
            var penultimotermo = 0
            var resultado = 1
            if termo > 1{
                for i in 1...(termo-1){
                    resultado = ultimoTermo + penultimotermo
                    penultimotermo = ultimoTermo
                    ultimoTermo = resultado
                    print(i)
                }
            }
            lbResultado1.text = "\(resultado)"
            view.endEditing(true)
        }else{
            lbResultado1.text = "Infelizmente não consegui calcular"
        }
        txtFibonar.text = ""
    }
}
