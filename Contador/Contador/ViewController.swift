//
//  ViewController.swift
//  Contador
//
//  Created by ICMMAC02-29DE on 25/08/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Texto2: UILabel!
    @IBOutlet weak var Resultado: UILabel!
    @IBOutlet weak var Calculo: UITextField!
    @IBOutlet weak var SecondView: UIView!
    
    var contador = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   @IBAction func Contar(_sender: Any){
        Resultado.text = Calculo.text
        contador = Int(Resultado.text!) ?? 0
        
        Calculo.text = ""
        
        SecondView.isHidden = false
        multiplo10()
        view.endEditing(true)
    }
    @IBAction func Fechar(_ sender: Any) {
        SecondView.isHidden = true
        Texto2.text = "Contando los números..."
    }
    @IBAction func aumentar(_ sender: Any) {
        contador += 1
        Resultado.text = "\(contador)"
        multiplo10()
        
    }
    @IBAction func diminuir(_ sender: Any) {
        contador -= 1
        Resultado.text = "\(contador)"
        multiplo10()
    }
    func multiplo10() {
        if contador % 10 == 0 {
            Texto2.text = "É um múltiplo de 10!"
        } else{
            Texto2.text = "Contando..."
            
        }
            
    }
    }
