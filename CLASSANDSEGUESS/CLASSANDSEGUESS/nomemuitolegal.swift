//
//  nomemuitolegal.swift
//  CLASSANDSEGUESS
//
//  Created by ICMMAC02-29DE on 13/09/22.
//

import UIKit

class nomemuitolegal: UIViewController {
    @IBOutlet weak var textin2: UILabel!
    
    @IBOutlet weak var textinho2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func Mostrar2(_ sender: Any) {
        textin2.text = textinho2.text
        textinho2.text = ""
    }
    @IBAction func ReturnSecondView(aywan: UIStoryboardSegue){}
    
}
