//
//  ViewController.swift
//  jogodavelha
//
//  Created by ICMMAC08-5617 on 10/09/22.
//

import UIKit

class ViewController: UIViewController {
    // Cada bloco no jogo da velha
    @IBOutlet weak var xo1: UIButton!
    @IBOutlet weak var xo2: UIButton!
    @IBOutlet weak var xo3: UIButton!
    @IBOutlet weak var xo4: UIButton!
    @IBOutlet weak var xo5: UIButton!
    @IBOutlet weak var xo6: UIButton!
    @IBOutlet weak var xo7: UIButton!
    @IBOutlet weak var xo8: UIButton!
    @IBOutlet weak var xo9: UIButton!
    // Botão de fechar
    @IBOutlet weak var CloseButton: UIButton!
    // Second View (Jogo da Velha)
    @IBOutlet weak var jogodavelha: UIView!
    
    // Variável de escolha (x ou o)
    var Choose = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func X(_ sender: Any) {
       Choose = 1
        jogodavelha.isHidden = true
        
    }
    @IBAction func Bola(_ sender: Any) {
        Choose = 2
        jogodavelha.isHidden = true
    }
    

}

