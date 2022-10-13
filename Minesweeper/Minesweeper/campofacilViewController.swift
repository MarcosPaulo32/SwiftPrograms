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
            for _ in 0...4 {
                bombacoorI = Int(arc4random_uniform(5))
                bombacoorJ = Int(arc4random_uniform(5))
                while (boardB[bombacoorI][bombacoorJ] == -1 || (bombacoorI == x && bombacoorJ == y)) {
                    bombacoorI = Int(arc4random_uniform(5));
                    bombacoorJ = Int(arc4random_uniform(5));
                }
                boardB[bombacoorI][bombacoorJ] = -1;
                if (bombacoorI + 1 < 5 ) {
                    if (boardB[bombacoorI + 1][bombacoorJ] != -1) {
                        boardB[bombacoorI + 1 ][bombacoorJ] += 1;
                    }
                    
                }
                if (bombacoorI - 1 > -1){
                    if (boardB[bombacoorI - 1][bombacoorJ] != -1) {
                        boardB[bombacoorI - 1][bombacoorJ] += 1;
                    }
                }
                if (bombacoorI + 1 < 5){
                    if (boardB[bombacoorI][bombacoorJ] != -1) {
                        boardB[bombacoorI][bombacoorJ] += 1;
                    }
                }
                if (bombacoorI - 1 > -1){
                    if (boardB[bombacoorI][bombacoorJ] != -1) {
                        boardB[bombacoorI][bombacoorJ] += 1;
                    }
                }
                if (bombacoorI + 1 < 5 && bombacoorJ + 1 < 5){
                    if (boardB[bombacoorI + 1][bombacoorJ + 1] != -1) {
                        boardB[bombacoorI + 1][bombacoorJ + 1] += 1;
                    }
                }
                if (bombacoorI + 1 < 5 && bombacoorJ - 1 > -1){
                    if (boardB[bombacoorI + 1][bombacoorJ - 1] != -1) {
                        boardB[bombacoorI + 1][bombacoorJ - 1] += 1;
                    }
                }
                if (bombacoorI - 1 > -1 && bombacoorJ + 1 < 5){
                    if (boardB[bombacoorI - 1][bombacoorJ + 1] != -1) {
                        boardB[bombacoorI - 1][bombacoorJ + 1] += 1;
                    }
                }
                if (bombacoorI - 1 > -1 && bombacoorJ - 1 > -1){
                    if (boardB[bombacoorI - 1][bombacoorJ - 1] != -1) {
                        boardB[bombacoorI - 1][bombacoorJ - 1] += 1;
                    }
                }
            }
        } while (boardB[x][y] != 0)
    }
    func zero(_ x: Int, _ y: Int){
        if (y + 1 < 5){
            if (boardB[x][y + 1] == 0){
                boardB[x][y + 1] = -2
                boardA[x][y + 1].backgroundColor = UIColor.white
                boardA[x][y + 1].isUserInteractionEnabled = false
                zero(x, y + 1)
                boardA[x][y].setTitle(String(boardB[x][y]), for: .normal)
                if (y + 1 < 5){
                    boardA[x][y + 1].setTitle(String(boardB[x][y + 1]), for: .normal)
                    boardA[x][y + 1].isUserInteractionEnabled = false
                }
                if (y - 1 > -1){
                    boardA[x][y - 1].setTitle(String(boardB[x][y - 1]), for: .normal)
                    boardA[x][y - 1].backgroundColor = UIColor.white
                    boardA[x][y - 1].isUserInteractionEnabled = false
                }
                if (x + 1 < 5){
                    boardA[x + 1][y].setTitle(String(boardB[x + 1][y]), for: .normal)
                    boardA[x + 1][y].backgroundColor = UIColor.white
                    boardA[x + 1][y].isUserInteractionEnabled = false
                }
                if (x + 1 < 5 && y + 1 < 5){
                    boardA[x + 1][y + 1].setTitle(String(boardB[x + 1][y + 1]), for: .normal)
                    boardA[x + 1][y + 1].backgroundColor = UIColor.white
                    boardA[x + 1][y + 1].isUserInteractionEnabled = false
                }
                if (x + 1 < 5 && y - 1 > -1){
                    boardA[x + 1][y - 1].setTitle(String(boardB[x + 1][y - 1]), for: .normal)
                    boardA[x + 1][y - 1].backgroundColor = UIColor.white
                    boardA[x + 1][y - 1].isUserInteractionEnabled = false
                }
                if (x - 1 > -1){
                    boardA[x - 1][y].setTitle(String(boardB[x + 1][y]), for: .normal)
                    boardA[x - 1][y].backgroundColor = UIColor.white
                    boardA[x - 1][y].isUserInteractionEnabled = false
                }
                if (x - 1 > -1 && y + 1 < 5){
                    boardA[x - 1][y + 1].setTitle(String(boardB[x - 1][y + 1]), for: .normal)
                    boardA[x - 1][y + 1].backgroundColor = UIColor.white
                    boardA[x - 1][y + 1].isUserInteractionEnabled = false
                }
                if (x - 1 > -1 && y - 1 > -1){
                    boardA[x - 1][y - 1].setTitle(String(boardB[x - 1][y - 1]), for: .normal)
                    boardA[x - 1][y - 1].backgroundColor = UIColor.white
                    boardA[x - 1][y - 1].isUserInteractionEnabled = false
                }
            }
        }
        if (y - 1 > -1){
            if (boardB[x][y - 1] == 0){
                boardB[x][y - 1] = -2
                boardA[x][y - 1].backgroundColor = UIColor.white
                boardA[x][y - 1].isUserInteractionEnabled = false
                zero(x, y - 1)
                boardA[x][y].setTitle(String(boardB[x][y]), for: .normal)
                if (y + 1 < 5){
                    boardA[x][y + 1].setTitle(String(boardB[x][y + 1]), for: .normal)
                    boardA[x][y + 1].backgroundColor = UIColor.white
                    boardA[x][y + 1].isUserInteractionEnabled = false
                }
                if (y - 1 > -1){
                    boardA[x][y - 1].setTitle(String(boardB[x][y - 1]), for: .normal)
                    boardA[x][y - 1].backgroundColor = UIColor.white
                    boardA[x][y - 1].isUserInteractionEnabled = false
                }
                if (x + 1 < 5){
                    boardA[x + 1][y].setTitle(String(boardB[x + 1][y]), for: .normal)
                    boardA[x + 1][y].backgroundColor = UIColor.white
                    boardA[x + 1][y].isUserInteractionEnabled = false
                }
                if (x + 1 < 5 && y + 1 < 5){
                    boardA[x + 1][y + 1].setTitle(String(boardB[x + 1][y + 1]), for: .normal)
                    boardA[x + 1][y + 1].backgroundColor = UIColor.white
                    boardA[x + 1][y + 1].isUserInteractionEnabled = false
                }
                if (x + 1 < 5 && y + 1 > -1){
                    boardA[x + 1][y - 1].setTitle(String(boardB[x + 1][y - 1]), for: .normal)
                    boardA[x + 1][y - 1].backgroundColor = UIColor.white
                    boardA[x + 1][y - 1].isUserInteractionEnabled = false
                }
                if (x - 1 > -1){
                    boardA[x - 1][y].setTitle(String(boardB[x - 1][y]), for: .normal)
                    boardA[x - 1][y].backgroundColor = UIColor.white
                    boardA[x - 1][y].isUserInteractionEnabled = false
                }
                if (x - 1 > -1 && y + 1 < 5){
                    boardA[x - 1][y + 1].setTitle(String(boardB[x - 1][y + 1]), for: .normal)
                    boardA[x - 1][y + 1].backgroundColor = UIColor.white
                    boardA[x - 1][y + 1].isUserInteractionEnabled = false
                }
                if (x - 1 > -1 && y - 1 > -1){
                    boardA[x - 1][y - 1].setTitle(String(boardB[x - 1][y - 1]), for: .normal)
                    boardA[x - 1][y - 1].backgroundColor = UIColor.white
                    boardA[x - 1][y - 1].isUserInteractionEnabled = false
                }
                if (x + 1 < 5){
                    if (y + 1 < 5){
                        boardA[x][y + 1].setTitle(String(boardB[x][y + 1]), for: .normal)
                        boardA[x][y + 1].isUserInteractionEnabled = false
                    }
                    if (y - 1 > -1){
                        boardA[x][y - 1].setTitle(String(boardB[x][y - 1]), for: .normal)
                        boardA[x][y - 1].backgroundColor = UIColor.white
                        boardA[x][y - 1].isUserInteractionEnabled = false
                    }
                    if (x + 1 < 5){
                        boardA[x + 1][y].setTitle(String(boardB[x + 1][y]), for: .normal)
                        boardA[x + 1][y].backgroundColor = UIColor.white
                        boardA[x + 1][y].isUserInteractionEnabled = false
                    }
                    if (x + 1 < 5 && y + 1 < 5){
                        boardA[x + 1][y + 1].setTitle(String(boardB[x + 1][y + 1]), for: .normal)
                        boardA[x + 1][y + 1].backgroundColor = UIColor.white
                        boardA[x + 1][y + 1].isUserInteractionEnabled = false
                    }
                    if (x + 1 < 5 && y - 1 > -1){
                        boardA[x + 1][y - 1].setTitle(String(boardB[x + 1][y - 1]), for: .normal)
                        boardA[x + 1][y - 1].backgroundColor = UIColor.white
                        boardA[x + 1][y - 1].isUserInteractionEnabled = false
                    }
                    if (x - 1 > -1){
                        boardA[x - 1][y].setTitle(String(boardB[x + 1][y]), for: .normal)
                        boardA[x - 1][y].backgroundColor = UIColor.white
                        boardA[x - 1][y].isUserInteractionEnabled = false
                    }
                    if (x - 1 > -1 && y + 1 < 5){
                        boardA[x - 1][y + 1].setTitle(String(boardB[x - 1][y + 1]), for: .normal)
                        boardA[x - 1][y + 1].backgroundColor = UIColor.white
                        boardA[x - 1][y + 1].isUserInteractionEnabled = false
                    }
                    if (x - 1 > -1 && y - 1 > -1){
                        boardA[x - 1][y - 1].setTitle(String(boardB[x - 1][y - 1]), for: .normal)
                        boardA[x - 1][y - 1].backgroundColor = UIColor.white
                        boardA[x - 1][y - 1].isUserInteractionEnabled = false
                    }
                }
            }
            if (x + 1 < 5 && y + 1 < 5){
                if (boardB[x + 1][y + 1] == 0){
                    boardB[x + 1][y + 1] = -2
                    boardA[x + 1][y + 1].backgroundColor = UIColor.white
                    boardA[x + 1][y + 1].isUserInteractionEnabled = false
                    zero(x + 1, y + 1)
                    boardA[x][y].setTitle(String(boardB[x][y]), for: .normal)
                    if (y + 1 < 5){
                        boardA[x][y + 1].setTitle(String(boardB[x][y + 1]), for: .normal)
                        boardA[x][y + 1].isUserInteractionEnabled = false
                    }
                    if (y - 1 > -1){
                        boardA[x][y - 1].setTitle(String(boardB[x][y - 1]), for: .normal)
                        boardA[x][y - 1].backgroundColor = UIColor.white
                        boardA[x][y - 1].isUserInteractionEnabled = false
                    }
                    if (x + 1 < 5){
                        boardA[x + 1][y].setTitle(String(boardB[x + 1][y]), for: .normal)
                        boardA[x + 1][y].backgroundColor = UIColor.white
                        boardA[x + 1][y].isUserInteractionEnabled = false
                    }
                    if (x + 1 < 5 && y + 1 < 5){
                        boardA[x + 1][y + 1].setTitle(String(boardB[x + 1][y + 1]), for: .normal)
                        boardA[x + 1][y + 1].backgroundColor = UIColor.white
                        boardA[x + 1][y + 1].isUserInteractionEnabled = false
                    }
                    if (x + 1 < 5 && y - 1 > -1){
                        boardA[x + 1][y - 1].setTitle(String(boardB[x + 1][y - 1]), for: .normal)
                        boardA[x + 1][y - 1].backgroundColor = UIColor.white
                        boardA[x + 1][y - 1].isUserInteractionEnabled = false
                    }
                    if (x - 1 > -1){
                        boardA[x - 1][y].setTitle(String(boardB[x + 1][y]), for: .normal)
                        boardA[x - 1][y].backgroundColor = UIColor.white
                        boardA[x - 1][y].isUserInteractionEnabled = false
                    }
                    if (x - 1 > -1 && y + 1 < 5){
                        boardA[x - 1][y + 1].setTitle(String(boardB[x - 1][y + 1]), for: .normal)
                        boardA[x - 1][y + 1].backgroundColor = UIColor.white
                        boardA[x - 1][y + 1].isUserInteractionEnabled = false
                    }
                    if (x - 1 > -1 && y - 1 > -1){
                        boardA[x - 1][y - 1].setTitle(String(boardB[x - 1][y - 1]), for: .normal)
                        boardA[x - 1][y - 1].backgroundColor = UIColor.white
                        boardA[x - 1][y - 1].isUserInteractionEnabled = false
                    }
                }
            }
            if (x + 1 < 5 && y - 1 > -1){
                if (boardB[x + 1][y - 1] == 0){
                    boardB[x + 1][y - 1] = -2
                    boardA[x + 1][y - 1].backgroundColor = UIColor.white
                    boardA[x + 1][y - 1].isUserInteractionEnabled = false
                    zero(x + 1, y - 1)
                    boardA[x][y].setTitle(String(boardB[x][y]), for: .normal)
                    if (y + 1 < 5){
                        boardA[x][y + 1].setTitle(String(boardB[x][y + 1]), for: .normal)
                        boardA[x][y + 1].isUserInteractionEnabled = false
                    }
                    if (y - 1 > -1){
                        boardA[x][y - 1].setTitle(String(boardB[x][y - 1]), for: .normal)
                        boardA[x][y - 1].backgroundColor = UIColor.white
                        boardA[x][y - 1].isUserInteractionEnabled = false
                    }
                    if (x + 1 < 5){
                        boardA[x + 1][y].setTitle(String(boardB[x + 1][y]), for: .normal)
                        boardA[x + 1][y].backgroundColor = UIColor.white
                        boardA[x + 1][y].isUserInteractionEnabled = false
                    }
                    if (x + 1 < 5 && y + 1 < 5){
                        boardA[x + 1][y + 1].setTitle(String(boardB[x + 1][y + 1]), for: .normal)
                        boardA[x + 1][y + 1].backgroundColor = UIColor.white
                        boardA[x + 1][y + 1].isUserInteractionEnabled = false
                    }
                    if (x + 1 < 5 && y - 1 > -1){
                        boardA[x + 1][y - 1].setTitle(String(boardB[x + 1][y - 1]), for: .normal)
                        boardA[x + 1][y - 1].backgroundColor = UIColor.white
                        boardA[x + 1][y - 1].isUserInteractionEnabled = false
                    }
                    if (x - 1 > -1){
                        boardA[x - 1][y].setTitle(String(boardB[x + 1][y]), for: .normal)
                        boardA[x - 1][y].backgroundColor = UIColor.white
                        boardA[x - 1][y].isUserInteractionEnabled = false
                    }
                    if (x - 1 > -1 && y + 1 < 5){
                        boardA[x - 1][y + 1].setTitle(String(boardB[x - 1][y + 1]), for: .normal)
                        boardA[x - 1][y + 1].backgroundColor = UIColor.white
                        boardA[x - 1][y + 1].isUserInteractionEnabled = false
                    }
                    if (x - 1 > -1 && y - 1 > -1){
                        boardA[x - 1][y - 1].setTitle(String(boardB[x - 1][y - 1]), for: .normal)
                        boardA[x - 1][y - 1].backgroundColor = UIColor.white
                        boardA[x - 1][y - 1].isUserInteractionEnabled = false
                    }
                }
            }
            if (x - 1 > -1){
                if (boardB[x - 1][y] == 0){
                    boardB[x - 1][y] = -2
                    boardA[x - 1][y].backgroundColor = UIColor.white
                    boardA[x - 1][y].isUserInteractionEnabled = false
                    zero(x - 1, y)
                    boardA[x][y].setTitle(String(boardB[x][y]), for: .normal)
                    if (y + 1 < 5){
                        boardA[x][y + 1].setTitle(String(boardB[x][y + 1]), for: .normal)
                        boardA[x][y + 1].isUserInteractionEnabled = false
                    }
                    if (y - 1 > -1){
                        boardA[x][y - 1].setTitle(String(boardB[x][y - 1]), for: .normal)
                        boardA[x][y - 1].backgroundColor = UIColor.white
                        boardA[x][y - 1].isUserInteractionEnabled = false
                    }
                    if (x + 1 < 5){
                        boardA[x + 1][y].setTitle(String(boardB[x + 1][y]), for: .normal)
                        boardA[x + 1][y].backgroundColor = UIColor.white
                        boardA[x + 1][y].isUserInteractionEnabled = false
                    }
                    if (x + 1 < 5 && y + 1 < 5){
                        boardA[x + 1][y + 1].setTitle(String(boardB[x + 1][y + 1]), for: .normal)
                        boardA[x + 1][y + 1].backgroundColor = UIColor.white
                        boardA[x + 1][y + 1].isUserInteractionEnabled = false
                    }
                    if (x + 1 < 5 && y - 1 > -1){
                        boardA[x + 1][y - 1].setTitle(String(boardB[x + 1][y - 1]), for: .normal)
                        boardA[x + 1][y - 1].backgroundColor = UIColor.white
                        boardA[x + 1][y - 1].isUserInteractionEnabled = false
                    }
                    if (x - 1 > -1){
                        boardA[x - 1][y].setTitle(String(boardB[x + 1][y]), for: .normal)
                        boardA[x - 1][y].backgroundColor = UIColor.white
                        boardA[x - 1][y].isUserInteractionEnabled = false
                    }
                    if (x - 1 > -1 && y + 1 < 5){
                        boardA[x - 1][y + 1].setTitle(String(boardB[x - 1][y + 1]), for: .normal)
                        boardA[x - 1][y + 1].backgroundColor = UIColor.white
                        boardA[x - 1][y + 1].isUserInteractionEnabled = false
                    }
                    if (x - 1 > -1 && y - 1 > -1){
                        boardA[x - 1][y - 1].setTitle(String(boardB[x - 1][y - 1]), for: .normal)
                        boardA[x - 1][y - 1].backgroundColor = UIColor.white
                        boardA[x - 1][y - 1].isUserInteractionEnabled = false
                    }
                }
            }
            if (x - 1 > -1 && y + 1 < 5){
                if (boardB[x - 1][y + 1] == 0){
                    boardB[x - 1][y + 1] = -2
                    boardA[x - 1][y + 1].backgroundColor = UIColor.white
                    boardA[x - 1][y + 1].isUserInteractionEnabled = false
                    zero(x - 1, y + 1)
                    boardA[x][y].setTitle(String(boardB[x][y]), for: .normal)
                    if (y + 1 < 5){
                        boardA[x][y + 1].setTitle(String(boardB[x][y + 1]), for: .normal)
                        boardA[x][y + 1].isUserInteractionEnabled = false
                    }
                    if (y - 1 > -1){
                        boardA[x][y - 1].setTitle(String(boardB[x][y - 1]), for: .normal)
                        boardA[x][y - 1].backgroundColor = UIColor.white
                        boardA[x][y - 1].isUserInteractionEnabled = false
                    }
                    if (x + 1 < 5){
                        boardA[x + 1][y].setTitle(String(boardB[x + 1][y]), for: .normal)
                        boardA[x + 1][y].backgroundColor = UIColor.white
                        boardA[x + 1][y].isUserInteractionEnabled = false
                    }
                    if (x + 1 < 5 && y + 1 < 5){
                        boardA[x + 1][y + 1].setTitle(String(boardB[x + 1][y + 1]), for: .normal)
                        boardA[x + 1][y + 1].backgroundColor = UIColor.white
                        boardA[x + 1][y + 1].isUserInteractionEnabled = false
                    }
                    if (x + 1 < 5 && y - 1 > -1){
                        boardA[x + 1][y - 1].setTitle(String(boardB[x + 1][y - 1]), for: .normal)
                        boardA[x + 1][y - 1].backgroundColor = UIColor.white
                        boardA[x + 1][y - 1].isUserInteractionEnabled = false
                    }
                    if (x - 1 > -1){
                        boardA[x - 1][y].setTitle(String(boardB[x + 1][y]), for: .normal)
                        boardA[x - 1][y].backgroundColor = UIColor.white
                        boardA[x - 1][y].isUserInteractionEnabled = false
                    }
                    if (x - 1 > -1 && y + 1 < 5){
                        boardA[x - 1][y + 1].setTitle(String(boardB[x - 1][y + 1]), for: .normal)
                        boardA[x - 1][y + 1].backgroundColor = UIColor.white
                        boardA[x - 1][y + 1].isUserInteractionEnabled = false
                    }
                    if (x - 1 > -1 && y - 1 > -1){
                        boardA[x - 1][y - 1].setTitle(String(boardB[x - 1][y - 1]), for: .normal)
                        boardA[x - 1][y - 1].backgroundColor = UIColor.white
                        boardA[x - 1][y - 1].isUserInteractionEnabled = false
                    }
                }
            }
            if (x - 1 > -1 && y - 1 > -1){
                if (boardB[x - 1][y - 1] == 0){
                    boardB[x - 1][y - 1] = -2
                    boardA[x - 1][y - 1].backgroundColor = UIColor.white
                    boardA[x - 1][y - 1].isUserInteractionEnabled = false
                    zero(x - 1, y - 1)
                    boardA[x][y].setTitle(String(boardB[x][y]), for: .normal)
                    if (y + 1 < 5){
                        boardA[x][y + 1].setTitle(String(boardB[x][y + 1]), for: .normal)
                        boardA[x][y + 1].isUserInteractionEnabled = false
                    }
                    if (y - 1 > -1){
                        boardA[x][y - 1].setTitle(String(boardB[x][y - 1]), for: .normal)
                        boardA[x][y - 1].backgroundColor = UIColor.white
                        boardA[x][y - 1].isUserInteractionEnabled = false
                    }
                    if (x + 1 < 5){
                        boardA[x + 1][y].setTitle(String(boardB[x + 1][y]), for: .normal)
                        boardA[x + 1][y].backgroundColor = UIColor.white
                        boardA[x + 1][y].isUserInteractionEnabled = false
                    }
                    if (x + 1 < 5 && y + 1 < 5){
                        boardA[x + 1][y + 1].setTitle(String(boardB[x + 1][y + 1]), for: .normal)
                        boardA[x + 1][y + 1].backgroundColor = UIColor.white
                        boardA[x + 1][y + 1].isUserInteractionEnabled = false
                    }
                    if (x + 1 < 5 && y - 1 > -1){
                        boardA[x + 1][y - 1].setTitle(String(boardB[x + 1][y - 1]), for: .normal)
                        boardA[x + 1][y - 1].backgroundColor = UIColor.white
                        boardA[x + 1][y - 1].isUserInteractionEnabled = false
                    }
                    if (x - 1 > -1){
                        boardA[x - 1][y].setTitle(String(boardB[x + 1][y]), for: .normal)
                        boardA[x - 1][y].backgroundColor = UIColor.white
                        boardA[x - 1][y].isUserInteractionEnabled = false
                    }
                    if (x - 1 > -1 && y + 1 < 5){
                        boardA[x - 1][y + 1].setTitle(String(boardB[x - 1][y + 1]), for: .normal)
                        boardA[x - 1][y + 1].backgroundColor = UIColor.white
                        boardA[x - 1][y + 1].isUserInteractionEnabled = false
                    }
                    if (x - 1 > -1 && y - 1 > -1){
                        boardA[x - 1][y - 1].setTitle(String(boardB[x - 1][y - 1]), for: .normal)
                        boardA[x - 1][y - 1].backgroundColor = UIColor.white
                        boardA[x - 1][y - 1].isUserInteractionEnabled = false
                    }
                }
            }
            if (y + 1 < 5){
                boardA[x][y + 1].setTitle(String(boardB[x][y + 1]), for: .normal)
                boardA[x][y + 1].backgroundColor = UIColor.white
                boardA[x][y + 1].isUserInteractionEnabled = false
            }
            if (y - 1 < 5){
                boardA[x][y - 1].setTitle(String(boardB[x][y - 1]), for: .normal)
                boardA[x][y - 1].backgroundColor = UIColor.white
                boardA[x][y - 1].isUserInteractionEnabled = false
            }
            if (x + 1 < 5){
                boardA[x + 1][y].setTitle(String(boardB[x + 1][y]), for: .normal)
                boardA[x + 1][y].backgroundColor = UIColor.white
                boardA[x + 1][y].isUserInteractionEnabled = false
            }
            if (x + 1 < 5 && y + 1 < 5){
                boardA[x + 1][y + 1].setTitle(String(boardB[x + 1][y + 1]), for: .normal)
                boardA[x + 1][y + 1].backgroundColor = UIColor.white
                boardA[x + 1][y + 1].isUserInteractionEnabled = false
            }
            if (x + 1 < 5 && y - 1 > -1){
                boardA[x + 1][y - 1].setTitle(String(boardB[x + 1][y - 1]), for: .normal)
                boardA[x + 1 ][y - 1].backgroundColor = UIColor.white
                boardA[x + 1][y - 1].isUserInteractionEnabled = false
            }
            if (x - 1 > -1){
                boardA[x - 1][y].setTitle(String(boardB[x - 1][y]), for: .normal)
                boardA[x - 1][y].backgroundColor = UIColor.white
                boardA[x - 1][y].isUserInteractionEnabled = false
            }
            if (x - 1 > -1 && y + 1 < 5){
                boardA[x - 1][y + 1].setTitle(String(boardB[x - 1][y + 1]), for: .normal)
                boardA[x - 1][y + 1].backgroundColor = UIColor.white
                boardA[x - 1][y + 1].isUserInteractionEnabled = false
            }
            if (x - 1 > -1 && y - 1 > -1){
                boardA[x - 1][y - 1].setTitle(String(boardB[x - 1][y - 1]), for: .normal)
                boardA[x - 1][y - 1].backgroundColor = UIColor.white
                boardA[x - 1][y - 1].isUserInteractionEnabled = false
            }
        }
        
    }
    @IBAction func A1(_ sender: Any) {
        if (botao_bandeira == true && boardA[0][0].backgroundColor != UIColor.white){
            if (c1 == true){
                if (numerodebandeiras >= 1){
                    c1 = false
                    numerodebandeiras -= 1
                    if (boardB[0][0] == -1){
                        trocarbandeira += 1
                    }
                    boardA[0][0].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                    boardA[0][0].setTitle("", for: .normal)
                }
            }
            else if (c1 == false){
                c1 = true
                numerodebandeiras += 1
                if (boardB[0][0] == -1){
                    trocarbandeira -= 1
                }
                boardA[0][0].setBackgroundImage(nil, for: .normal)
                boardA[0][0].setTitle("", for: .normal)
            }
            lbBandeiranumero.text = String(numerodebandeiras)
            if (trocarbandeira == 5){
                restart.isUserInteractionEnabled = true
                restart.setTitleColor(UIColor.blue, for: .normal)
                restart.backgroundColor = UIColor.yellow
                btBandeira.isUserInteractionEnabled = false
                for i in 0...4{
                    for j in 0...4{
                        boardA[i][j].isUserInteractionEnabled = false
                    }
                }
                label1.text = "Parabéns, você desarmou todas as minas!"
                label1.font = UIFont.systemFont(ofSize: 30.0)
                label1.textColor = UIColor.yellow
                label1.backgroundColor = UIColor.orange
                label1.alpha = 0.8
                for i in 0...4{
                    for j in 0...4{
                        if (boardB[i][j] == -1){
                            boardA[i][j].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[i][j].setTitle("", for: .normal)
                        }
                    }
                }
            }
        }
        else if (b1 == false && boardA[0][0].currentBackgroundImage != UIImage(named: "Bandeira")){
            b1 = true
            btBandeira.isUserInteractionEnabled = true
            a1.backgroundColor = UIColor.white
            if (primeiropasso == true){
                primeiropasso = false
                preencher(0, 0)
            }
            if (boardB[0][0] == -1){
                restart.isUserInteractionEnabled = true
                restart.setTitleColor(UIColor.blue, for: .normal)
                restart.backgroundColor = UIColor.yellow
                btBandeira.isUserInteractionEnabled = false
                for i in 0...4{
                    for j in 0...4{
                        boardA[i][j].isUserInteractionEnabled = false
                    }
                }
                label1.text = "Pisastes em uma mina, perdeste papayo."
                label1.font = UIFont.systemFont(ofSize: 30.0)
                label1.textColor = UIColor.red
                label1.backgroundColor = UIColor.black
                label1.alpha = 0.0
                for i in 0...4{
                    for j in 0...4{
                        if (boardB[i][j] == -1){
                            boardA[i][j].setBackgroundImage(UIImage(named: "Bomba"), for: .normal)
                            boardA[i][j].backgroundColor = UIColor.red
                            boardA[i][j].setTitle("", for: .normal)
                        }
                    }
                }
                return
            }
            else{
                if (boardB[0][0] == 0){
                    boardA[0][0].backgroundColor = UIColor.white
                    boardA[0][0].isUserInteractionEnabled = false
                    zero(0, 0)
                    for i in 0...4{
                        for j in 0...4{
                            if (boardB[i][j] == -2){
                                boardA[i][j].setTitle("", for: .normal)
                            }
                        }
                    }
                }
                else{
                    boardA[0][0].setTitle(String(boardB[0][0]), for: .normal)
                }
            }
            for i in 0...4{
                for j in 0...4{
                    if (boardA[0][0].backgroundColor ==  UIColor.lightGray){
                        trocar += 1
                    }
                }
            }
            if (trocar == 5){
                restart.isUserInteractionEnabled = true
                restart.setTitleColor(UIColor.blue, for: .normal)
                restart.backgroundColor = UIColor.yellow
                btBandeira.isUserInteractionEnabled = false
                for i in 0...4{
                    for j in 0...4{
                        boardA[i][j].isUserInteractionEnabled = false
                    }
                }
                label1.text = "Parabéns, você desativou todas as minas!"
                label1.font = UIFont.systemFont(ofSize: 30.0)
                label1.textColor = UIColor.yellow
                label1.backgroundColor = UIColor.orange
                label1.alpha = 0.0
                for i in 0...4{
                    for j in 0...4{
                        if (boardB[i][j] == -1){
                            boardA[i][j].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[i][j].setTitle("", for: .normal)
                        }
                    }
                }
            }
            else{
                trocar = 0
            }
        }
    }
    @IBAction func A2(_ sender: Any) {
        if (botao_bandeira == true && boardA[0][1].backgroundColor != UIColor.white){
            if (c2 == true){
                if (numerodebandeiras >= 1){
                    c2 = false
                    numerodebandeiras -= 1
                    if (boardB[0][1] == -1){
                        trocarbandeira += 1
                    }
                    boardA[0][1].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                    boardA[0][1].setTitle("", for: .normal)
                }
            }
            else if (c2 == false){
                c2 = true
                numerodebandeiras += 1
                if (boardB[0][1] == -1){
                    trocarbandeira -= 1
                }
                boardA[0][1].setBackgroundImage(nil, for: .normal)
                boardA[0][1].setTitle("", for: .normal)
            }
            lbBandeiranumero.text = String(numerodebandeiras)
            if (trocarbandeira == 5){
                restart.isUserInteractionEnabled = true
                restart.setTitleColor(UIColor.blue, for: .normal)
                restart.backgroundColor = UIColor.yellow
                btBandeira.isUserInteractionEnabled = false
                for i in 0...4{
                    for j in 0...4{
                        boardA[i][j].isUserInteractionEnabled = false
                    }
                }
                label1.text = "Parabéns, você desarmou todas as minas!"
                label1.font = UIFont.systemFont(ofSize: 30.0)
                label1.textColor = UIColor.yellow
                label1.backgroundColor = UIColor.orange
                label1.alpha = 0.8
                for i in 0...4{
                    for j in 0...4{
                        if (boardB[i][j] == -1){
                            boardA[i][j].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[i][j].setTitle("", for: .normal)
                        }
                    }
                }
            }
        }
        else if (b2 == false && boardA[0][1].currentBackgroundImage != UIImage(named: "Bandeira")){
            b2 = true
            btBandeira.isUserInteractionEnabled = true
            a2.backgroundColor = UIColor.white
            if (primeiropasso == true){
                primeiropasso = false
                preencher(0, 0)
            }
            if (boardB[0][1] == -1){
                restart.isUserInteractionEnabled = true
                restart.setTitleColor(UIColor.blue, for: .normal)
                restart.backgroundColor = UIColor.yellow
                btBandeira.isUserInteractionEnabled = false
                for i in 0...4{
                    for j in 0...4{
                        boardA[i][j].isUserInteractionEnabled = false
                    }
                }
                label1.text = "Pisastes em uma mina, perdeste papayo."
                label1.font = UIFont.systemFont(ofSize: 30.0)
                label1.textColor = UIColor.red
                label1.backgroundColor = UIColor.black
                label1.alpha = 0.0
                for i in 0...4{
                    for j in 0...4{
                        if (boardB[i][j] == -1){
                            boardA[i][j].setBackgroundImage(UIImage(named: "Bomba"), for: .normal)
                            boardA[i][j].backgroundColor = UIColor.red
                            boardA[i][j].setTitle("", for: .normal)
                        }
                    }
                }
                return
            }
            else{
                if (boardB[0][1] == 0){
                    boardA[0][1].backgroundColor = UIColor.white
                    boardA[0][1].isUserInteractionEnabled = false
                    zero(0, 1)
                    for i in 0...4{
                        for j in 0...4{
                            if (boardB[i][j] == -2){
                                boardA[i][j].setTitle("", for: .normal)
                            }
                        }
                    }
                }
                else{
                    boardA[0][1].setTitle(String(boardB[0][1]), for: .normal)
                }
            }
            for i in 0...4{
                for j in 0...4{
                    if (boardA[0][1].backgroundColor ==  UIColor.lightGray){
                        trocar += 1
                    }
                }
            }
            if (trocar == 5){
                restart.isUserInteractionEnabled = true
                restart.setTitleColor(UIColor.blue, for: .normal)
                restart.backgroundColor = UIColor.yellow
                btBandeira.isUserInteractionEnabled = false
                for i in 0...4{
                    for j in 0...4{
                        boardA[i][j].isUserInteractionEnabled = false
                    }
                }
                label1.text = "Parabéns, você desativou todas as minas!"
                label1.font = UIFont.systemFont(ofSize: 30.0)
                label1.textColor = UIColor.yellow
                label1.backgroundColor = UIColor.orange
                label1.alpha = 0.0
                for i in 0...4{
                    for j in 0...4{
                        if (boardB[i][j] == -1){
                            boardA[i][j].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[i][j].setTitle("", for: .normal)
                        }
                    }
                }
            }
            else{
                trocar = 0
            }
        }
    }
    @IBAction func A3(_ sender: Any) {
        if (botao_bandeira == true && boardA[0][2].backgroundColor != UIColor.white){
            if (c3 == true){
                if (numerodebandeiras >= 1){
                    c3 = false
                    numerodebandeiras -= 1
                    if (boardB[0][2] == -1){
                        trocarbandeira += 1
                    }
                    boardA[0][2].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                    boardA[0][2].setTitle("", for: .normal)
                }
            }
            else if (c3 == false){
                c3 = true
                numerodebandeiras += 1
                if (boardB[0][2] == -1){
                    trocarbandeira -= 1
                }
                boardA[0][2].setBackgroundImage(nil, for: .normal)
                boardA[0][2].setTitle("", for: .normal)
            }
            lbBandeiranumero.text = String(numerodebandeiras)
            if (trocarbandeira == 5){
                restart.isUserInteractionEnabled = true
                restart.setTitleColor(UIColor.blue, for: .normal)
                restart.backgroundColor = UIColor.yellow
                btBandeira.isUserInteractionEnabled = false
                for i in 0...4{
                    for j in 0...4{
                        boardA[i][j].isUserInteractionEnabled = false
                    }
                }
                label1.text = "Parabéns, você desarmou todas as minas!"
                label1.font = UIFont.systemFont(ofSize: 30.0)
                label1.textColor = UIColor.yellow
                label1.backgroundColor = UIColor.orange
                label1.alpha = 0.8
                for i in 0...4{
                    for j in 0...4{
                        if (boardB[i][j] == -1){
                            boardA[i][j].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[i][j].setTitle("", for: .normal)
                        }
                    }
                }
            }
        }
        else if (b3 == false && boardA[0][2].currentBackgroundImage != UIImage(named: "Bandeira")){
            b3 = true
            btBandeira.isUserInteractionEnabled = true
            a3.backgroundColor = UIColor.white
            if (primeiropasso == true){
                primeiropasso = false
                preencher(0, 0)
            }
            if (boardB[0][2] == -1){
                restart.isUserInteractionEnabled = true
                restart.setTitleColor(UIColor.blue, for: .normal)
                restart.backgroundColor = UIColor.yellow
                btBandeira.isUserInteractionEnabled = false
                for i in 0...4{
                    for j in 0...4{
                        boardA[i][j].isUserInteractionEnabled = false
                    }
                }
                label1.text = "Pisastes em uma mina, perdeste papayo."
                label1.font = UIFont.systemFont(ofSize: 30.0)
                label1.textColor = UIColor.red
                label1.backgroundColor = UIColor.black
                label1.alpha = 0.0
                for i in 0...4{
                    for j in 0...4{
                        if (boardB[i][j] == -1){
                            boardA[i][j].setBackgroundImage(UIImage(named: "Bomba"), for: .normal)
                            boardA[i][j].backgroundColor = UIColor.red
                            boardA[i][j].setTitle("", for: .normal)
                        }
                    }
                }
                return
            }
            else{
                if (boardB[0][2] == 0){
                    boardA[0][2].backgroundColor = UIColor.white
                    boardA[0][2].isUserInteractionEnabled = false
                    zero(0, 2)
                    for i in 0...4{
                        for j in 0...4{
                            if (boardB[i][j] == -2){
                                boardA[i][j].setTitle("", for: .normal)
                            }
                        }
                    }
                }
                else{
                    boardA[0][2].setTitle(String(boardB[0][2]), for: .normal)
                }
            }
            for i in 0...4{
                for j in 0...4{
                    if (boardA[0][1].backgroundColor ==  UIColor.lightGray){
                        trocar += 1
                    }
                }
            }
            if (trocar == 5){
                restart.isUserInteractionEnabled = true
                restart.setTitleColor(UIColor.blue, for: .normal)
                restart.backgroundColor = UIColor.yellow
                btBandeira.isUserInteractionEnabled = false
                for i in 0...4{
                    for j in 0...4{
                        boardA[i][j].isUserInteractionEnabled = false
                    }
                }
                label1.text = "Parabéns, você desativou todas as minas!"
                label1.font = UIFont.systemFont(ofSize: 30.0)
                label1.textColor = UIColor.yellow
                label1.backgroundColor = UIColor.orange
                label1.alpha = 0.0
                for i in 0...4{
                    for j in 0...4{
                        if (boardB[i][j] == -1){
                            boardA[i][j].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[i][j].setTitle("", for: .normal)
                        }
                    }
                }
            }
            else{
                trocar = 0
            }
        }
    }
    @IBAction func A4(_ sender: Any) {
        if (botao_bandeira == true && boardA[0][3].backgroundColor != UIColor.white){
            if (c4 == true){
                if (numerodebandeiras >= 1){
                    c4 = false
                    numerodebandeiras -= 1
                    if (boardB[0][3] == -1){
                        trocarbandeira += 1
                    }
                    boardA[0][3].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                    boardA[0][3].setTitle("", for: .normal)
                }
            }
            else if (c4 == false){
                c4 = true
                numerodebandeiras += 1
                if (boardB[0][3] == -1){
                    trocarbandeira -= 1
                }
                boardA[0][3].setBackgroundImage(nil, for: .normal)
                boardA[0][3].setTitle("", for: .normal)
            }
            lbBandeiranumero.text = String(numerodebandeiras)
            if (trocarbandeira == 5){
                restart.isUserInteractionEnabled = true
                restart.setTitleColor(UIColor.blue, for: .normal)
                restart.backgroundColor = UIColor.yellow
                btBandeira.isUserInteractionEnabled = false
                for i in 0...4{
                    for j in 0...4{
                        boardA[i][j].isUserInteractionEnabled = false
                    }
                }
                label1.text = "Parabéns, você desarmou todas as minas!"
                label1.font = UIFont.systemFont(ofSize: 30.0)
                label1.textColor = UIColor.yellow
                label1.backgroundColor = UIColor.orange
                label1.alpha = 0.8
                for i in 0...4{
                    for j in 0...4{
                        if (boardB[i][j] == -1){
                            boardA[i][j].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[i][j].setTitle("", for: .normal)
                        }
                    }
                }
            }
        }
        else if (b4 == false && boardA[0][3].currentBackgroundImage != UIImage(named: "Bandeira")){
            b4 = true
            btBandeira.isUserInteractionEnabled = true
            a4.backgroundColor = UIColor.white
            if (primeiropasso == true){
                primeiropasso = false
                preencher(0, 3)
            }
            if (boardB[0][3] == -1){
                restart.isUserInteractionEnabled = true
                restart.setTitleColor(UIColor.blue, for: .normal)
                restart.backgroundColor = UIColor.yellow
                btBandeira.isUserInteractionEnabled = false
                for i in 0...4{
                    for j in 0...4{
                        boardA[i][j].isUserInteractionEnabled = false
                    }
                }
                label1.text = "Pisastes em uma mina, perdeste papayo."
                label1.font = UIFont.systemFont(ofSize: 30.0)
                label1.textColor = UIColor.red
                label1.backgroundColor = UIColor.black
                label1.alpha = 0.0
                for i in 0...4{
                    for j in 0...4{
                        if (boardB[i][j] == -1){
                            boardA[i][j].setBackgroundImage(UIImage(named: "Bomba"), for: .normal)
                            boardA[i][j].backgroundColor = UIColor.red
                            boardA[i][j].setTitle("", for: .normal)
                        }
                    }
                }
                return
            }
            else{
                if (boardB[0][3] == 0){
                    boardA[0][3].backgroundColor = UIColor.white
                    boardA[0][3].isUserInteractionEnabled = false
                    zero(0, 3)
                    for i in 0...4{
                        for j in 0...4{
                            if (boardB[i][j] == -2){
                                boardA[i][j].setTitle("", for: .normal)
                            }
                        }
                    }
                }
                else{
                    boardA[0][3].setTitle(String(boardB[0][3]), for: .normal)
                }
            }
            for i in 0...4{
                for j in 0...4{
                    if (boardA[0][3].backgroundColor ==  UIColor.lightGray){
                        trocar += 1
                    }
                }
            }
            if (trocar == 5){
                restart.isUserInteractionEnabled = true
                restart.setTitleColor(UIColor.blue, for: .normal)
                restart.backgroundColor = UIColor.yellow
                btBandeira.isUserInteractionEnabled = false
                for i in 0...4{
                    for j in 0...4{
                        boardA[i][j].isUserInteractionEnabled = false
                    }
                }
                label1.text = "Parabéns, você desativou todas as minas!"
                label1.font = UIFont.systemFont(ofSize: 30.0)
                label1.textColor = UIColor.yellow
                label1.backgroundColor = UIColor.orange
                label1.alpha = 0.0
                for i in 0...4{
                    for j in 0...4{
                        if (boardB[i][j] == -1){
                            boardA[i][j].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[i][j].setTitle("", for: .normal)
                        }
                    }
                }
            }
            else{
                trocar = 0
            }
            
        }
    }
    @IBAction func A5(_ sender: Any) {
        if (botao_bandeira == true && boardA[0][4].backgroundColor != UIColor.white){
            if (c5 == true){
                if (numerodebandeiras >= 1){
                    c5 = false
                    numerodebandeiras -= 1
                    if (boardB[0][4] == -1){
                        trocarbandeira += 1
                    }
                    boardA[0][4].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                    boardA[0][1].setTitle("", for: .normal)
                }
            }
            else if (c5 == false){
                c5 = true
                numerodebandeiras += 1
                if (boardB[0][4] == -1){
                    trocarbandeira -= 1
                }
                boardA[0][4].setBackgroundImage(nil, for: .normal)
                boardA[0][4].setTitle("", for: .normal)
            }
            lbBandeiranumero.text = String(numerodebandeiras)
            if (trocarbandeira == 5){
                restart.isUserInteractionEnabled = true
                restart.setTitleColor(UIColor.blue, for: .normal)
                restart.backgroundColor = UIColor.yellow
                btBandeira.isUserInteractionEnabled = false
                for i in 0...4{
                    for j in 0...4{
                        boardA[i][j].isUserInteractionEnabled = false
                    }
                }
                label1.text = "Parabéns, você desarmou todas as minas!"
                label1.font = UIFont.systemFont(ofSize: 30.0)
                label1.textColor = UIColor.yellow
                label1.backgroundColor = UIColor.orange
                label1.alpha = 0.8
                for i in 0...4{
                    for j in 0...4{
                        if (boardB[i][j] == -1){
                            boardA[i][j].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[i][j].setTitle("", for: .normal)
                        }
                    }
                }
            }
        }
        else if (b5 == false && boardA[0][4].currentBackgroundImage != UIImage(named: "Bandeira")){
            b5 = true
            btBandeira.isUserInteractionEnabled = true
            a5.backgroundColor = UIColor.white
            if (primeiropasso == true){
                primeiropasso = false
                preencher(0, 0)
            }
            if (boardB[0][4] == -1){
                restart.isUserInteractionEnabled = true
                restart.setTitleColor(UIColor.blue, for: .normal)
                restart.backgroundColor = UIColor.yellow
                btBandeira.isUserInteractionEnabled = false
                for i in 0...4{
                    for j in 0...4{
                        boardA[i][j].isUserInteractionEnabled = false
                    }
                }
                label1.text = "Pisastes em uma mina, perdeste papayo."
                label1.font = UIFont.systemFont(ofSize: 30.0)
                label1.textColor = UIColor.red
                label1.backgroundColor = UIColor.black
                label1.alpha = 0.0
                for i in 0...4{
                    for j in 0...4{
                        if (boardB[i][j] == -1){
                            boardA[i][j].setBackgroundImage(UIImage(named: "Bomba"), for: .normal)
                            boardA[i][j].backgroundColor = UIColor.red
                            boardA[i][j].setTitle("", for: .normal)
                        }
                    }
                }
                return
            }
            else{
                if (boardB[0][4] == 0){
                    boardA[0][4].backgroundColor = UIColor.white
                    boardA[0][4].isUserInteractionEnabled = false
                    zero(0, 4)
                    for i in 0...4{
                        for j in 0...4{
                            if (boardB[i][j] == -2){
                                boardA[i][j].setTitle("", for: .normal)
                            }
                        }
                    }
                }
                else{
                    boardA[0][4].setTitle(String(boardB[0][4]), for: .normal)
                }
            }
            for i in 0...4{
                for j in 0...4{
                    if (boardA[0][4].backgroundColor ==  UIColor.lightGray){
                        trocar += 1
                    }
                }
            }
            if (trocar == 5){
                restart.isUserInteractionEnabled = true
                restart.setTitleColor(UIColor.blue, for: .normal)
                restart.backgroundColor = UIColor.yellow
                btBandeira.isUserInteractionEnabled = false
                for i in 0...4{
                    for j in 0...4{
                        boardA[i][j].isUserInteractionEnabled = false
                    }
                }
                label1.text = "Parabéns, você desativou todas as minas!"
                label1.font = UIFont.systemFont(ofSize: 30.0)
                label1.textColor = UIColor.yellow
                label1.backgroundColor = UIColor.orange
                label1.alpha = 0.0
                for i in 0...4{
                    for j in 0...4{
                        if (boardB[i][j] == -1){
                            boardA[i][j].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[i][j].setTitle("", for: .normal)
                        }
                    }
                }
            }
            else{
                trocar = 0
            }
        }
    }
    @IBAction func A6(_ sender: Any) {
        if (botao_bandeira == true && boardA[0][5].backgroundColor != UIColor.white){
            if (c6 == true){
                if (numerodebandeiras >= 1){
                    c5 = false
                    numerodebandeiras -= 1
                    if (boardB[0][5] == -1){
                        trocarbandeira += 1
                    }
                    boardA[0][5].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                    boardA[0][5].setTitle("", for: .normal)
                }
            }
            else if (c6 == false){
                c6 = true
                numerodebandeiras += 1
                if (boardB[0][5] == -1){
                    trocarbandeira -= 1
                }
                boardA[0][5].setBackgroundImage(nil, for: .normal)
                boardA[0][5].setTitle("", for: .normal)
            }
            lbBandeiranumero.text = String(numerodebandeiras)
            if (trocarbandeira == 5){
                restart.isUserInteractionEnabled = true
                restart.setTitleColor(UIColor.blue, for: .normal)
                restart.backgroundColor = UIColor.yellow
                btBandeira.isUserInteractionEnabled = false
                for i in 0...4{
                    for j in 0...4{
                        boardA[i][j].isUserInteractionEnabled = false
                    }
                }
                label1.text = "Parabéns, você desarmou todas as minas!"
                label1.font = UIFont.systemFont(ofSize: 30.0)
                label1.textColor = UIColor.yellow
                label1.backgroundColor = UIColor.orange
                label1.alpha = 0.8
                for i in 0...4{
                    for j in 0...4{
                        if (boardB[i][j] == -1){
                            boardA[i][j].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[i][j].setTitle("", for: .normal)
                        }
                    }
                }
            }
        }
        else if (b6 == false && boardA[0][5].currentBackgroundImage != UIImage(named: "Bandeira")){
            b6 = true
            btBandeira.isUserInteractionEnabled = true
            a6.backgroundColor = UIColor.white
            if (primeiropasso == true){
                primeiropasso = false
                preencher(0, 5)
            }
            if (boardB[0][5] == -1){
                restart.isUserInteractionEnabled = true
                restart.setTitleColor(UIColor.blue, for: .normal)
                restart.backgroundColor = UIColor.yellow
                btBandeira.isUserInteractionEnabled = false
                for i in 0...4{
                    for j in 0...4{
                        boardA[i][j].isUserInteractionEnabled = false
                    }
                }
                label1.text = "Pisastes em uma mina, perdeste papayo."
                label1.font = UIFont.systemFont(ofSize: 30.0)
                label1.textColor = UIColor.red
                label1.backgroundColor = UIColor.black
                label1.alpha = 0.0
                for i in 0...4{
                    for j in 0...4{
                        if (boardB[i][j] == -1){
                            boardA[i][j].setBackgroundImage(UIImage(named: "Bomba"), for: .normal)
                            boardA[i][j].backgroundColor = UIColor.red
                            boardA[i][j].setTitle("", for: .normal)
                        }
                    }
                }
                return
            }
            else{
                if (boardB[0][5] == 0){
                    boardA[0][5].backgroundColor = UIColor.white
                    boardA[0][5].isUserInteractionEnabled = false
                    zero(0, 5)
                    for i in 0...4{
                        for j in 0...4{
                            if (boardB[i][j] == -2){
                                boardA[i][j].setTitle("", for: .normal)
                            }
                        }
                    }
                }
                else{
                    boardA[0][5].setTitle(String(boardB[0][5]), for: .normal)
                }
            }
            for i in 0...4{
                for j in 0...4{
                    if (boardA[0][1].backgroundColor ==  UIColor.lightGray){
                        trocar += 1
                    }
                }
            }
            if (trocar == 5){
                restart.isUserInteractionEnabled = true
                restart.setTitleColor(UIColor.blue, for: .normal)
                restart.backgroundColor = UIColor.yellow
                btBandeira.isUserInteractionEnabled = false
                for i in 0...4{
                    for j in 0...4{
                        boardA[i][j].isUserInteractionEnabled = false
                    }
                }
                label1.text = "Parabéns, você desativou todas as minas!"
                label1.font = UIFont.systemFont(ofSize: 30.0)
                label1.textColor = UIColor.yellow
                label1.backgroundColor = UIColor.orange
                label1.alpha = 0.0
                for i in 0...4{
                    for j in 0...4{
                        if (boardB[i][j] == -1){
                            boardA[i][j].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[i][j].setTitle("", for: .normal)
                        }
                    }
                }
            }
            else{
                trocar = 0
            }
        }
    }
}
