//
//  ViewController.swift
//  IMC
//
//  Created by ICMMAC05-7528 on 17/08/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Peso: UITextField!
    @IBOutlet weak var Altura: UITextField!
    @IBOutlet weak var corpinho: UIImageView!
    @IBOutlet weak var tipo: UILabel!
    @IBOutlet weak var resultado2: UILabel!
    
    
    
    var pesinho = 0.0
    var alturinha = 0.0
    var imc = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func calculo(_ sender: AnyObject) {
        pesinho = Double(Peso.text!) ?? 0.0
        alturinha = Double(Altura.text!) ?? 0.0
        
        imc = floor((pesinho/(alturinha*alturinha))*100)/100
        resultado2.text = "\(imc)"
        if imc > 25{
            resultado2.text = "\(imc)"
            corpinho.image = UIImage(named: "obeso")
            tipo.text = "Está precisando emagrecer um pouco amigo."
        } else if imc < 18{
            resultado2.text = "\(imc)"
            corpinho.image = UIImage(named: "magro")
            tipo.text = "Ihhhh, precisa comer um pouco mais amigo."
        } else if imc < 25{
            resultado2.text = "\(imc)"
            corpinho.image = UIImage(named: "pesonormal")
            tipo.text = "Está em um peso normal, continue assim."
        }
}
}
