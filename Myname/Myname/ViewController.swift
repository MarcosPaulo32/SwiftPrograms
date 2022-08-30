//
//  ViewController.swift
//  Myname
//
//  Created by ICMMAC04-3F86 on 02/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Alcapone: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Capuccino(_ sender: Any) {
        Alcapone.text = "Carregando..."
    }
    
    @IBAction func Twitter(_ sender: Any) {
        Alcapone.text = "Limpar o celular"
    }
}

