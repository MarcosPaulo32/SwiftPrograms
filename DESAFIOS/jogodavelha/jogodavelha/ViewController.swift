//
//  ViewController.swift
//  jogodavelha
//
//  Created by ICMMAC08-5617 on 10/09/22.
//

import UIKit

class ViewController: UIViewController {
    // Cada bloco no jogo da velha
    @IBOutlet weak var X: UIButton!
    @IBOutlet weak var O: UIButton!
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
    // Tela para Vitória
    @IBOutlet weak var TeladeVitoria: UIView!
    
    // Variável de escolha (x ou o)
    var Choose = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func X(_ sender: Any) {
       Choose = 2
        jogodavelha.isHidden = true
        
    }
    @IBAction func Bola(_ sender: Any) {
        Choose = 1
        jogodavelha.isHidden = true
    }
    @IBAction func XO1(_ sender: Any) {
        if Choose == 1 {
            xo1.setBackgroundImage(UIImage(named: "circulozinho"), for: .normal)
            Choose = 2
            xo1.isUserInteractionEnabled = false
        }else{
            xo1.setBackgroundImage(UIImage(named: "xiszinho"), for: .normal)
            Choose = 1
            xo1.isUserInteractionEnabled = false
        }
        vitoriadascolunas()
        vitoriadaslinhas()
        vitoriadasdiagonais()
        
    }
    @IBAction func XO2(_ sender: Any) {
        if Choose == 1 {
            xo2.setBackgroundImage(UIImage(named: "circulozinho"), for: .normal)
            Choose = 2
            xo2.isUserInteractionEnabled = false
        }else{
            xo2.setBackgroundImage(UIImage(named: "xiszinho"), for: .normal)
            Choose = 1
            xo2.isUserInteractionEnabled = false
        }
        vitoriadascolunas()
        vitoriadaslinhas()
        vitoriadasdiagonais()
    }
    @IBAction func XO3(_ sender: Any) {
        if Choose == 1 {
            xo3.setBackgroundImage(UIImage(named: "circulozinho"), for: .normal)
            Choose = 2
            xo3.isUserInteractionEnabled = false
        }else{
            xo3.setBackgroundImage(UIImage(named: "xiszinho"), for: .normal)
            Choose = 1
            xo3.isUserInteractionEnabled = false
        }
        vitoriadascolunas()
        vitoriadaslinhas()
        vitoriadasdiagonais()
    }
    @IBAction func XO4(_ sender: Any) {
        if Choose == 1 {
            xo4.setBackgroundImage(UIImage(named: "circulozinho"), for: .normal)
            Choose = 2
            xo4.isUserInteractionEnabled = false
        }else{
            xo4.setBackgroundImage(UIImage(named: "xiszinho"), for: .normal)
            Choose = 1
            xo4.isUserInteractionEnabled = false
        }
        vitoriadascolunas()
        vitoriadaslinhas()
        vitoriadasdiagonais()
    }
    @IBAction func XO5(_ sender: Any) {
        if Choose == 1 {
            xo5.setBackgroundImage(UIImage(named: "circulozinho"), for: .normal)
            Choose = 2
            xo5.isUserInteractionEnabled = false
        }else{
            xo5.setBackgroundImage(UIImage(named: "xiszinho"), for: .normal)
            Choose = 1
            xo5.isUserInteractionEnabled = false
        }
        vitoriadascolunas()
        vitoriadaslinhas()
        vitoriadasdiagonais()
    }
    @IBAction func XO6(_ sender: Any) {
        if Choose == 1 {
            xo6.setBackgroundImage(UIImage(named: "circulozinho"), for: .normal)
            Choose = 2
            xo6.isUserInteractionEnabled = false
        }else{
            xo6.setBackgroundImage(UIImage(named: "xiszinho"), for: .normal)
            Choose = 1
            xo6.isUserInteractionEnabled = false
        }
        vitoriadascolunas()
        vitoriadaslinhas()
        vitoriadasdiagonais()
    }
    @IBAction func XO7(_ sender: Any) {
        if Choose == 1 {
            xo7.setBackgroundImage(UIImage(named: "circulozinho"), for: .normal)
            Choose = 2
            xo7.isUserInteractionEnabled = false
        }else{
            xo7.setBackgroundImage(UIImage(named: "xiszinho"), for: .normal)
            Choose = 1
            xo7.isUserInteractionEnabled = false
        }
        vitoriadascolunas()
        vitoriadaslinhas()
        vitoriadasdiagonais()
    }
    @IBAction func XO8(_ sender: Any) {
        if Choose == 1 {
            xo8.setBackgroundImage(UIImage(named: "circulozinho"), for: .normal)
            Choose = 2
            xo8.isUserInteractionEnabled = false
        }else{
            xo8.setBackgroundImage(UIImage(named: "xiszinho"), for: .normal)
            Choose = 1
            xo8.isUserInteractionEnabled = false
        }
        vitoriadascolunas()
        vitoriadaslinhas()
        vitoriadasdiagonais()
    }
    @IBAction func XO9(_ sender: Any) {
        if Choose == 1 {
            xo9.setBackgroundImage(UIImage(named: "circulozinho"), for: .normal)
            Choose = 2
            xo9.isUserInteractionEnabled = false
        }else{
            xo9.setBackgroundImage(UIImage(named: "xiszinho"), for: .normal)
            Choose = 1
            xo9.isUserInteractionEnabled = false
        }
        vitoriadascolunas()
        vitoriadaslinhas()
        vitoriadasdiagonais()
    }
    @IBAction func CloseButton(_ sender: Any) {
        jogodavelha.isHidden = false
                xo1.setBackgroundImage(UIImage(named: ""), for: .normal)
                xo1.isUserInteractionEnabled = true
                xo2.setBackgroundImage(UIImage(named: ""), for: .normal)
                xo2.isUserInteractionEnabled = true
                xo3.setBackgroundImage(UIImage(named: ""), for: .normal)
                xo3.isUserInteractionEnabled = true
                xo4.setBackgroundImage(UIImage(named: ""), for: .normal)
                xo4.isUserInteractionEnabled = true
                xo5.setBackgroundImage(UIImage(named: ""), for: .normal)
        xo5.isUserInteractionEnabled = true
                xo6.isUserInteractionEnabled = true
                xo6.setBackgroundImage(UIImage(named: ""), for: .normal)
        xo7.setBackgroundImage(UIImage(named: ""), for: .normal)
                xo7.isUserInteractionEnabled = true
                xo8.setBackgroundImage(UIImage(named: ""), for: .normal)
        xo8.isUserInteractionEnabled = true
                xo9.isUserInteractionEnabled = true
                xo9.setBackgroundImage(UIImage(named: ""), for: .normal)
    }
    @IBAction func CloseWin(_ sender: Any) {
        jogodavelha.isHidden = false
        TeladeVitoria.isHidden = true
        xo1.setBackgroundImage(UIImage(named: ""), for: .normal)
        xo1.isUserInteractionEnabled = true
        xo2.setBackgroundImage(UIImage(named: ""), for: .normal)
        xo2.isUserInteractionEnabled = true
        xo3.setBackgroundImage(UIImage(named: ""), for: .normal)
        xo3.isUserInteractionEnabled = true
        xo4.setBackgroundImage(UIImage(named: ""), for: .normal)
        xo4.isUserInteractionEnabled = true
        xo5.setBackgroundImage(UIImage(named: ""), for: .normal)
xo5.isUserInteractionEnabled = true
        xo6.isUserInteractionEnabled = true
        xo6.setBackgroundImage(UIImage(named: ""), for: .normal)
xo7.setBackgroundImage(UIImage(named: ""), for: .normal)
        xo7.isUserInteractionEnabled = true
        xo8.setBackgroundImage(UIImage(named: ""), for: .normal)
xo8.isUserInteractionEnabled = true
        xo9.isUserInteractionEnabled = true
        xo9.setBackgroundImage(UIImage(named: ""), for: .normal)
    }
    func vitoriadascolunas(){
        if xo1.backgroundImage(for: .normal) == xo2.backgroundImage(for: .normal) && xo2.backgroundImage(for: .normal) == xo3.backgroundImage(for: .normal) && (xo1.backgroundImage(for: .normal) == UIImage(named: "xiszinho") || xo1.backgroundImage(for: .normal) == UIImage(named:"circulozinho")){
            TeladeVitoria.isHidden = false
        }else if
            xo4.backgroundImage(for: .normal) == xo5.backgroundImage(for: .normal) && xo5.backgroundImage(for: .normal) == xo6.backgroundImage(for: .normal) && (xo4.backgroundImage(for: .normal) == UIImage(named: "xiszinho") || xo4.backgroundImage(for: .normal) == UIImage(named:"circulozinho")){
                TeladeVitoria.isHidden = false
            }else if
                xo7.backgroundImage(for: .normal) == xo8.backgroundImage(for: .normal) && xo8.backgroundImage(for: .normal) == xo9.backgroundImage(for: .normal) && (xo7.backgroundImage(for: .normal) == UIImage(named: "xiszinho") || xo7.backgroundImage(for: .normal) == UIImage(named:"circulozinho")){
                    TeladeVitoria.isHidden = false
                }
}
    func vitoriadaslinhas(){
        if xo1.backgroundImage(for: .normal) == xo4.backgroundImage(for: .normal) && xo4.backgroundImage(for: .normal) == xo7.backgroundImage(for: .normal) && (xo1.backgroundImage(for: .normal) == UIImage(named: "xiszinho") || xo1.backgroundImage(for: .normal) == UIImage(named:"circulozinho")){
            TeladeVitoria.isHidden = false
    }else if
        xo2.backgroundImage(for: .normal) == xo5.backgroundImage(for: .normal) && xo5.backgroundImage(for: .normal) == xo8.backgroundImage(for: .normal) && (xo2.backgroundImage(for: .normal) == UIImage(named: "xiszinho") || xo2.backgroundImage(for: .normal) == UIImage(named:"circulozinho")){
            TeladeVitoria.isHidden = false
    }else if
        xo3.backgroundImage(for: .normal) == xo6.backgroundImage(for: .normal) && xo6.backgroundImage(for: .normal) == xo9.backgroundImage(for: .normal) && (xo3.backgroundImage(for: .normal) == UIImage(named: "xiszinho") || xo3.backgroundImage(for: .normal) == UIImage(named:"circulozinho")){
            TeladeVitoria.isHidden = false
    }
    }
        func vitoriadasdiagonais(){
            if xo1.backgroundImage(for: .normal) == xo5.backgroundImage(for: .normal) && xo5.backgroundImage(for: .normal) == xo9.backgroundImage(for: .normal) && (xo1.backgroundImage(for: .normal) == UIImage(named: "xiszinho") || xo1.backgroundImage(for: .normal) == UIImage(named:"circulozinho")){
                TeladeVitoria.isHidden = false
        }else if
            xo7.backgroundImage(for: .normal) == xo5.backgroundImage(for: .normal) && xo5.backgroundImage(for: .normal) == xo3.backgroundImage(for: .normal) && (xo7.backgroundImage(for: .normal) == UIImage(named: "xiszinho") || xo7.backgroundImage(for: .normal) == UIImage(named:"circulozinho")){
                TeladeVitoria.isHidden = false
        }
        }
    }
