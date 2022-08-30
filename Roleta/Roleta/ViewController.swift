//
//  ViewController.swift
//  Roleta
//
//  Created by ICMMAC02-29DE on 23/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var input: UITextField!
    
    @IBOutlet weak var Resultado: UILabel!
    
    var numero = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Resultado.isHidden = true
    }
    @IBAction func check(_ sender: Any) {
        numero = Int(input.text!) ?? 0
        multiplo10()
        Resultado.isHidden = false
        view.endEditing(true)
    }
    
    
    func multiplo10(){
        if numero % 10 == 0 {
            Resultado.text = "multiplo de 10"
        }else{
            Resultado.text = "nao eh multiplo de 10"
        }
        
    }
    
}

