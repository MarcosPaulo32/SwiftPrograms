//
//  ViewController.swift
//  CLASSANDSEGUESS
//
//  Created by ICMMAC02-29DE on 13/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textin1: UITextField!
    
    @IBOutlet var textinho: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Mostrar(_ sender: Any) {
        textinho.text = textin1.text
        textin1.text = ""
    }
    
    @IBAction func ReturnMainView(awaan: UIStoryboardSegue){}
    
    
}

