//
//  ViewController.swift
//  FatoNacci
//
//  Created by ICMMAC08-5617 on 16/09/22.
//

import UIKit

class FatorarController: UIViewController {
    @IBOutlet weak var txtFatorar: UITextField!
    @IBOutlet weak var lbResultado2: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func ReturnMainView(primeira: UIStoryboardSegue){}
    @IBAction func btCalculoFatorar(_ sender: Any) {
        if let number = Int(txtFatorar.text!){
            var resultado = 1
            if number > 0{
                for i in 1...number{
                    resultado = resultado*i
                }
                lbResultado2.text = "\(resultado)"
            }else{
                lbResultado2.text = "Infelizmente, não consegui calcular o valor"
            }
        }else{
            lbResultado2.text = "Infelizmente, não consegui achar o valor que você queria"
        }
        view.endEditing(true)
        txtFatorar.text = ""
        
    }
    
}

