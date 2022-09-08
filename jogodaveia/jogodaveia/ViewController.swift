//
//  ViewController.swift
//  jogodaveia
//
//  Created by ICMMAC02-29DE on 08/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var xiszin: UIImageView!
    @IBOutlet weak var circrinho: UIImageView!
    @IBOutlet weak var viewjogodavelha: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func XO1(_ sender: Any) {
    }
    @IBAction func XO2(_ sender: Any) {
    }
    @IBAction func XO3(_ sender: Any) {
    }
    @IBAction func XO4(_ sender: Any) {
    }
    @IBAction func XO5(_ sender: Any) {
    }
    @IBAction func XO6(_ sender: Any) {
    }
    @IBAction func XO7(_ sender: Any) {
    }
    @IBAction func XO8(_ sender: Any) {
    }
    @IBAction func XO9(_ sender: Any) {
    }
    @IBAction func fechar(_ sender: Any) {
        jogodavelha.isHidden = true
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
        // código em beta
        
    }
    

}

