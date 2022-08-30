//
//  ViewController.swift
//  My Emotion
//
//  Created by ICMMAC06-7A13 on 16/08/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Pacmanmedo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func button(_ sender: Any) {
        if (Pacmanmedo.image == UIImage(named: "pacmedo")){
            Pacmanmedo.image = UIImage(named: "pacman")
        }else{
            Pacmanmedo.image = UIImage(named: "pacmedo")
        }
    }
    
    
}

