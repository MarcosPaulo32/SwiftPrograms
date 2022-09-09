//
//  ViewController.swift
//  jogodaveia
//
//  Created by ICMMAC02-29DE on 08/09/22.
//

import UIKit

class ViewController: UIViewController {
    // View do Jogo da Velha
    @IBOutlet weak var viewjogodavelha: UIView!
    // Variável dos Botões
    @IBOutlet weak var xo1: UIButton!
    @IBOutlet weak var xo2: UIButton!
    @IBOutlet weak var xo3: UIButton!
    @IBOutlet weak var xo4: UIButton!
    @IBOutlet weak var xo5: UIButton!
    @IBOutlet weak var xo6: UIButton!
    @IBOutlet weak var xo7: UIButton!
    @IBOutlet weak var xo8: UIButton!
    @IBOutlet weak var xo9: UIButton!
    // Var do botão de fechar
    @IBOutlet weak var botaofechar: UIButton!
    // Variável da escolhe entre círculo e X
    var choose = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func xiszin(_ sender: Any) {
        choose = 1
    }
    @IBAction func circrinho(_ sender: Any) {
        choose = 2
    }
    @IBAction func XO1(_ sender: Any) {
        if choose == 1{
            xo1.setBackgroundImage(UIImage(named: "xiszinho"), for: .normal)
            choose = 2
            xo1.isUserInteractionEnabled = false
        }else{
            xo1.setBackgroundImage(UIImage(named: "circulozinho"), for: .normal)
            choose = 1
            xo1.isUserInteractionEnabled = false
        }
    }
    @IBAction func XO2(_ sender: Any) {
        if choose == 1{
            xo2.setBackgroundImage(UIImage(named: "xiszinho"), for: .normal)
            choose = 2
            xo2.isUserInteractionEnabled = false
        }else{
            xo2.setBackgroundImage(UIImage(named: "circulozinho"), for: .normal)
            choose = 1
            xo2.isUserInteractionEnabled = false
        }
    }
    @IBAction func XO3(_ sender: Any) {
        if choose == 1{
            xo3.setBackgroundImage(UIImage(named: "xiszinho"), for: .normal)
            choose = 2
            xo3.isUserInteractionEnabled = false
        }else{
            xo3.setBackgroundImage(UIImage(named: "circulozinho"), for: .normal)
            choose = 1
            xo3.isUserInteractionEnabled = false
        }
    }
    @IBAction func XO4(_ sender: Any) {
        if choose == 1{
            xo4.setBackgroundImage(UIImage(named: "xiszinho"), for: .normal)
            choose = 2
            xo4.isUserInteractionEnabled = false
        }else{
            xo4.setBackgroundImage(UIImage(named: "circulozinho"), for: .normal)
            choose = 1
            xo4.isUserInteractionEnabled = false
        }
    }
    @IBAction func XO5(_ sender: Any) {
        if choose == 1{
            xo5.setBackgroundImage(UIImage(named: "xiszinho"), for: .normal)
            choose = 2
            xo5.isUserInteractionEnabled = false
        }else{
            xo5.setBackgroundImage(UIImage(named: "circulozinho"), for: .normal)
            choose = 1
            xo5.isUserInteractionEnabled = false
        }
    }
    @IBAction func XO6(_ sender: Any) {
        if choose == 1{
            xo6.setBackgroundImage(UIImage(named: "xiszinho"), for: .normal)
            choose = 2
            xo6.isUserInteractionEnabled = false
        }else{
            xo6.setBackgroundImage(UIImage(named: "circulozinho"), for: .normal)
            choose = 1
            xo6.isUserInteractionEnabled = false
        }
    }
    @IBAction func XO7(_ sender: Any) {
        if choose == 1{
            xo7.setBackgroundImage(UIImage(named: "xiszinho"), for: .normal)
            choose = 2
            xo7.isUserInteractionEnabled = false
        }else{
            xo7.setBackgroundImage(UIImage(named: "circulozinho"), for: .normal)
            choose = 1
            xo7.isUserInteractionEnabled = false
        }
    }
    @IBAction func XO8(_ sender: Any) {
        if choose == 1{
            xo8.setBackgroundImage(UIImage(named: "xiszinho"), for: .normal)
            choose = 2
            xo8.isUserInteractionEnabled = false
        }else{
            xo8.setBackgroundImage(UIImage(named: "circulozinho"), for: .normal)
            choose = 1
            xo8.isUserInteractionEnabled = false
        }
    }
    @IBAction func XO9(_ sender: Any) {
        if choose == 1{
            xo9.setBackgroundImage(UIImage(named: "xiszinho"), for: .normal)
            choose = 2
            xo9.isUserInteractionEnabled = false
        }else{
            xo9.setBackgroundImage(UIImage(named: "circulozinho"), for: .normal)
            choose = 1
            xo9.isUserInteractionEnabled = false
        }
    }
    @IBAction func fechar(_ sender: Any) {
        viewjogodavelha.isHidden = true
        xo1.setBackgroundImage(UIImage(named: ""), for: .normal)
        xo1.isUserInteractionEnabled = true
        xo2.setBackgroundImage(UIImage(named: ""), for: .normal)
        xo2.isUserInteractionEnabled = true
        xo3.setBackgroundImage(UIImage(named: ""), for: .normal)
        xo3.isUserInteractionEnabled = true
        xo4.setBackgroundImage(UIImage(named: ""), for: .normal)
        xo4.isUserInteractionEnabled = true
        xo5.setBackgroundImage(UIImage(named: ""), for: .normal)
        xo6.isUserInteractionEnabled = true
        xo6.setBackgroundImage(UIImage(named: ""), for: .normal)
        xo7.isUserInteractionEnabled = true
        xo8.setBackgroundImage(UIImage(named: ""), for: .normal)
        xo9.isUserInteractionEnabled = true
        xo9.setBackgroundImage(UIImage(named: ""), for: .normal)
        // código para fechar a segunda view
        
        botaofechar.isHidden = false
    }
    

}

