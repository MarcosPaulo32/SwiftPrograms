//
//  campofácilViewController.swift
//  Minesweeper
//
//  Created by ICMMAC04-3F86 on 29/09/22.
//

import UIKit

class campofacilViewController: UIViewController {
    @IBOutlet weak var lbBandeiranumero: UILabel!
    @IBOutlet weak var lbModoBandeira: UILabel!
    @IBOutlet weak var btBandeira: UIButton!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var a4: UIButton!
    @IBOutlet weak var a5: UIButton!
    @IBOutlet weak var a6: UIButton!
    @IBOutlet weak var a7: UIButton!
    @IBOutlet weak var a8: UIButton!
    @IBOutlet weak var a9: UIButton!
    @IBOutlet weak var a10: UIButton!
    @IBOutlet weak var a11: UIButton!
    @IBOutlet weak var a12: UIButton!
    @IBOutlet weak var a13: UIButton!
    @IBOutlet weak var a14: UIButton!
    @IBOutlet weak var a15: UIButton!
    @IBOutlet weak var a16: UIButton!
    @IBOutlet weak var a17: UIButton!
    @IBOutlet weak var a18: UIButton!
    @IBOutlet weak var a19: UIButton!
    @IBOutlet weak var a20: UIButton!
    @IBOutlet weak var a21: UIButton!
    @IBOutlet weak var a22: UIButton!
    @IBOutlet weak var a23: UIButton!
    @IBOutlet weak var a24: UIButton!
    @IBOutlet weak var a25: UIButton!
    @IBOutlet weak var restart: UIButton!
    @IBOutlet weak var label1: UILabel!
    
    lazy var boardA: [[UIButton]] = [[a1, a2, a3, a4, a5], [a6, a7, a8, a9, a10], [a11, a12, a13, a14, a15, a16], [a17, a18, a19, a20, a21], [a22, a23, a24, a25]]
    var boardB: [[Int]] = [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0,], [0, 0, 0, 0, 0], [0, 0, 0, 0,]]
    
    var trocar = 0
    var botao_bandeira = false
    var numerodebandeiras = 5
    var apertarbandeira = false
    var trocarbandeira = 0
    var primeiropasso = true
    var b1 = false, b2 = false, b3 = false, b4 = false, b5 = false, b6 = false, b7 = false, b8 = false, b9 = false, b10 = false, b11 = false, b12 = false, b13 = false, b14 = false, b15 = false, b16 = false, b17 = false, b18 = false, b19 = false, b20 = false, b21 = false, b22 = false, b23 = false, b24 = false, b25 = false
    var c1 = true, c2 = true, c3 = true, c4 = true, c5 = true, c6 = true, c7 = true, c8 = true, c9 = true, c10 = true, c11 = true, c12 = true, c13 = true, c14 = true, c15 = true, c16 = true, c17 = true, c18 = true, c19 = true, c20 = true, c21 = true, c22 = true, c23 = true, c24 = true, c25 = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restart.setTitleColor(UIColor.clear, for: .normal)
        restart.backgroundColor = UIColor.clear
        restart.layer.cornerRadius = 10.0
        restart.isUserInteractionEnabled = false
        label1.text = ""
        label1.backgroundColor = UIColor.clear
        label1.layer.cornerRadius = 10.0
        btBandeira.layer.cornerRadius = 10.0
        btBandeira.isUserInteractionEnabled = false
        btBandeira.setTitleColor(UIColor.blue, for: .normal)
        lbBandeiranumero.text = String(numerodebandeiras)
        lbModoBandeira.text = "Modo Bandeira: Desligado"
        lbModoBandeira.layer.cornerRadius = 10.0
        lbModoBandeira.layer.masksToBounds = true
        for i in 0...4{
            for j in 0...4{
                boardA[i][j].layer.borderColor = (UIColor.black).cgColor
            boardA[i][j].layer.borderWidth = 1
            boardA[i][j].backgroundColor = UIColor.lightGray
            boardA[i][j].setTitle("", for: .normal)
            }
        }
    }
    func preencher(_ x: Int, _ y: Int){
        var bombacoorI = 0
        var bombacoorJ = 0
        
        repeat{
            for i in 0...4{
                for j in 0...4{
                    boardB[i][j] = 0
                }
            }
            for _ in 0...4{
                
            }
        }
    }
}
