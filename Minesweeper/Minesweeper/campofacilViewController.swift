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
        for i in 0...4 {
            for j in 0...4{
                boardA[i][j].layer.borderColor = (UIColor.black).cgColor
                boardA[i][j].layer.borderWidth = 1
                boardA[i][j].backgroundColor = UIColor.lightGray
                boardA[i][j].setTitle(" ", for: .normal)
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
        if (botao_bandeira == true && boardA[1][0].backgroundColor != UIColor.white){
            if (c6 == true){
                if (numerodebandeiras >= 1){
                    c6 = false
                    numerodebandeiras -= 1
                    if (boardB[1][0] == -1){
                        trocarbandeira += 1
                    }
                    boardA[1][0].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                    boardA[1][0].setTitle("", for: .normal)
                }
            }
            else if (c6 == false){
                c6 = true
                numerodebandeiras += 1
                if (boardB[1][0] == -1){
                    trocarbandeira -= 1
                }
                boardA[1][0].setBackgroundImage(nil, for: .normal)
                boardA[1][0].setTitle("", for: .normal)
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
        else if (b6 == false && boardA[1][0].currentBackgroundImage != UIImage(named: "Bandeira")){
            b6 = true
            btBandeira.isUserInteractionEnabled = true
            a6.backgroundColor = UIColor.white
            if (primeiropasso == true){
                primeiropasso = false
                preencher(1, 0)
            }
            if (boardB[1][0] == -1){
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
                if (boardB[1][0] == 0){
                    boardA[1][0].backgroundColor = UIColor.white
                    boardA[1][0].isUserInteractionEnabled = false
                    zero(1, 0)
                    for i in 0...4{
                        for j in 0...4{
                            if (boardB[i][j] == -2){
                                boardA[i][j].setTitle("", for: .normal)
                            }
                        }
                    }
                }
                else{
                    boardA[1][0].setTitle(String(boardB[0][5]), for: .normal)
                }
            }
            for i in 0...4{
                for j in 0...4{
                    if (boardA[1][0].backgroundColor ==  UIColor.lightGray){
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
    @IBAction func A7(_ sender: Any) {
        if (botao_bandeira == true && boardA[1][1].backgroundColor != UIColor.white){
            if (c7 == true){
                if (numerodebandeiras >= 1){
                    c7 = false
                    numerodebandeiras -= 1
                    if (boardB[1][1] == -1){
                        trocarbandeira += 1
                    }
                    boardA[1][1].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                    boardA[1][1].setTitle("", for: .normal)
                }
            }
            else if (c7 == false){
                c7 = true
                numerodebandeiras += 1
                if (boardB[1][1] == -1){
                    trocarbandeira -= 1
                }
                boardA[1][1].setBackgroundImage(nil, for: .normal)
                boardA[1][1].setTitle("", for: .normal)
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
        else if (b7 == false && boardA[1][1].currentBackgroundImage != UIImage(named: "Bandeira")){
            b7 = true
            btBandeira.isUserInteractionEnabled = true
            a7.backgroundColor = UIColor.white
            if (primeiropasso == true){
                primeiropasso = false
                preencher(1, 1)
            }
            if (boardB[1][1] == -1){
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
                if (boardB[1][1] == 0){
                    boardA[1][1].backgroundColor = UIColor.white
                    boardA[1][1].isUserInteractionEnabled = false
                    zero(1, 1)
                    for i in 0...4{
                        for j in 0...4{
                            if (boardB[i][j] == -2){
                                boardA[i][j].setTitle("", for: .normal)
                            }
                        }
                    }
                }
                else{
                    boardA[0][1].setTitle(String(boardB[0][6]), for: .normal)
                }
            }
            for i in 0...4{
                for j in 0...4{
                    if (boardA[1][1].backgroundColor ==  UIColor.lightGray){
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
    @IBAction func A8(_ sender: Any) {
        if (botao_bandeira == true && boardA[1][2].backgroundColor != UIColor.white){
            if (c8 == true){
                if (numerodebandeiras >= 1){
                    c8 = false
                    numerodebandeiras -= 1
                    if (boardB[1][2] == -1){
                        trocarbandeira += 1
                    }
                    boardA[1][2].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                    boardA[1][2].setTitle("", for: .normal)
                }
            }
            else if (c8 == false){
                c8 = true
                numerodebandeiras += 1
                if (boardB[1][2] == -1){
                    trocarbandeira -= 1
                }
                boardA[1][2].setBackgroundImage(nil, for: .normal)
                boardA[1][2].setTitle("", for: .normal)
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
        else if (b8 == false && boardA[1][2].currentBackgroundImage != UIImage(named: "Bandeira")){
            b8 = true
            btBandeira.isUserInteractionEnabled = true
            a8.backgroundColor = UIColor.white
            if (primeiropasso == true){
                primeiropasso = false
                preencher(1, 2)
            }
            if (boardB[1][2] == -1){
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
                if (boardB[1][2] == 0){
                    boardA[1][2].backgroundColor = UIColor.white
                    boardA[1][2].isUserInteractionEnabled = false
                    zero(1, 2)
                    for i in 0...4{
                        for j in 0...4{
                            if (boardB[i][j] == -2){
                                boardA[i][j].setTitle("", for: .normal)
                            }
                        }
                    }
                }
                else{
                    boardA[1][2].setTitle(String(boardB[1][2]), for: .normal)
                }
            }
            for i in 0...4{
                for j in 0...4{
                    if (boardA[1][2].backgroundColor ==  UIColor.lightGray){
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
    @IBAction func A9(_ sender: Any) {
        if (botao_bandeira == true && boardA[1][3].backgroundColor != UIColor.white){
            if (c9 == true){
                if (numerodebandeiras >= 1){
                    c9 = false
                    numerodebandeiras -= 1
                    if (boardB[1][3] == -1){
                        trocarbandeira += 1
                    }
                    boardA[1][3].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                    boardA[1][3].setTitle("", for: .normal)
                }
            }
            else if (c9 == false){
                c9 = true
                numerodebandeiras += 1
                if (boardB[1][3] == -1){
                    trocarbandeira -= 1
                }
                boardA[1][3].setBackgroundImage(nil, for: .normal)
                boardA[1][3].setTitle("", for: .normal)
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
        else if (b9 == false && boardA[1][3].currentBackgroundImage != UIImage(named: "Bandeira")){
            b9 = true
            btBandeira.isUserInteractionEnabled = true
            a9.backgroundColor = UIColor.white
            if (primeiropasso == true){
                primeiropasso = false
                preencher(1, 3)
            }
            if (boardB[1][3] == -1){
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
                if (boardB[1][3] == 0){
                    boardA[1][3].backgroundColor = UIColor.white
                    boardA[1][3].isUserInteractionEnabled = false
                    zero(1, 3)
                    for i in 0...4{
                        for j in 0...4{
                            if (boardB[i][j] == -2){
                                boardA[i][j].setTitle("", for: .normal)
                            }
                        }
                    }
                }
                else{
                    boardA[1][3].setTitle(String(boardB[1][3]), for: .normal)
                }
            }
            for i in 0...4{
                for j in 0...4{
                    if (boardA[1][3].backgroundColor ==  UIColor.lightGray){
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
    @IBAction func A10(_ sender: Any) {
        if (botao_bandeira == true && boardA[1][4].backgroundColor != UIColor.white){
            if (c10 == true){
                if (numerodebandeiras >= 1){
                    c10 = false
                    numerodebandeiras -= 1
                    if (boardB[1][4] == -1){
                        trocarbandeira += 1
                    }
                    boardA[1][4].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                    boardA[1][4].setTitle("", for: .normal)
                }
            }
            else if (c10 == false){
                c10 = true
                numerodebandeiras += 1
                if (boardB[1][4] == -1){
                    trocarbandeira -= 1
                }
                boardA[1][4].setBackgroundImage(nil, for: .normal)
                boardA[1][4].setTitle("", for: .normal)
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
        else if (b10 == false && boardA[1][4].currentBackgroundImage != UIImage(named: "Bandeira")){
            b10 = true
            btBandeira.isUserInteractionEnabled = true
            a10.backgroundColor = UIColor.white
            if (primeiropasso == true){
                primeiropasso = false
                preencher(1, 4)
            }
            if (boardB[1][4] == -1){
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
                if (boardB[1][4] == 0){
                    boardA[1][4].backgroundColor = UIColor.white
                    boardA[1][4].isUserInteractionEnabled = false
                    zero(1, 4)
                    for i in 0...4{
                        for j in 0...4{
                            if (boardB[i][j] == -2){
                                boardA[i][j].setTitle("", for: .normal)
                            }
                        }
                    }
                }
                else{
                    boardA[1][4].setTitle(String(boardB[1][4]), for: .normal)
                }
            }
            for i in 0...4{
                for j in 0...4{
                    if (boardA[0][9].backgroundColor ==  UIColor.lightGray){
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
    @IBAction func A11(_ sender: Any) {
        if (botao_bandeira == true && boardA[2][0].backgroundColor != UIColor.white){
                    if (c11 == true){
                        if (numerodebandeiras >= 1){
                            c1 = false
                            numerodebandeiras -= 1
                            if (boardB[2][0] == -1){
                                trocarbandeira += 1
                            }
                            boardA[2][0].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[2][0].setTitle("", for: .normal)
                        }
                    }
                    else if (c11 == false){
                        c11 = true
                        numerodebandeiras += 1
                        if (boardB[2][0] == -1){
                            trocarbandeira -= 1
                        }
                        boardA[2][0].setBackgroundImage(nil, for: .normal)
                        boardA[2][0].setTitle("", for: .normal)
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
                else if (b1 == false && boardA[2][0].currentBackgroundImage != UIImage(named: "Bandeira")){
                    b11 = true
                    btBandeira.isUserInteractionEnabled = true
                    a11.backgroundColor = UIColor.white
                    if (primeiropasso == true){
                        primeiropasso = false
                        preencher(2, 0)
                    }
                    if (boardB[2][0] == -1){
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
                        if (boardB[2][0] == 0){
                            boardA[2][0].backgroundColor = UIColor.white
                            boardA[2][0].isUserInteractionEnabled = false
                            zero(2, 0)
                            for i in 0...4{
                                for j in 0...4{
                                    if (boardB[i][j] == -2){
                                        boardA[i][j].setTitle("", for: .normal)
                                    }
                                }
                            }
                        }
                        else{
                            boardA[2][0].setTitle(String(boardB[2][0]), for: .normal)
                        }
                    }
                    for i in 0...4{
                        for j in 0...4{
                            if (boardA[2][0].backgroundColor ==  UIColor.lightGray){
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
    @IBAction func A12(_ sender: Any) {
        if (botao_bandeira == true && boardA[2][1].backgroundColor != UIColor.white){
                    if (c12 == true){
                        if (numerodebandeiras >= 1){
                            c12 = false
                            numerodebandeiras -= 1
                            if (boardB[2][1] == -1){
                                trocarbandeira += 1
                            }
                            boardA[2][1].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[2][1].setTitle("", for: .normal)
                        }
                    }
                    else if (c12 == false){
                        c12 = true
                        numerodebandeiras += 1
                        if (boardB[2][1] == -1){
                            trocarbandeira -= 1
                        }
                        boardA[2][1].setBackgroundImage(nil, for: .normal)
                        boardA[2][1].setTitle("", for: .normal)
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
                else if (b1 == false && boardA[2][1].currentBackgroundImage != UIImage(named: "Bandeira")){
                    b1 = true
                    btBandeira.isUserInteractionEnabled = true
                    a1.backgroundColor = UIColor.white
                    if (primeiropasso == true){
                        primeiropasso = false
                        preencher(2, 1)
                    }
                    if (boardB[2][1] == -1){
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
                        if (boardB[2][1] == 0){
                            boardA[2][1].backgroundColor = UIColor.white
                            boardA[2][1].isUserInteractionEnabled = false
                            zero(2, 1)
                            for i in 0...4{
                                for j in 0...4{
                                    if (boardB[i][j] == -2){
                                        boardA[i][j].setTitle("", for: .normal)
                                    }
                                }
                            }
                        }
                        else{
                            boardA[2][1].setTitle(String(boardB[2][1]), for: .normal)
                        }
                    }
                    for i in 0...4{
                        for j in 0...4{
                            if (boardA[2][1].backgroundColor ==  UIColor.lightGray){
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
    @IBAction func A13(_ sender: Any) {
        if (botao_bandeira == true && boardA[2][3].backgroundColor != UIColor.white){
                    if (c13 == true){
                        if (numerodebandeiras >= 1){
                            c13 = false
                            numerodebandeiras -= 1
                            if (boardB[2][3] == -1){
                                trocarbandeira += 1
                            }
                            boardA[2][3].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[2][3].setTitle("", for: .normal)
                        }
                    }
                    else if (c13 == false){
                        c13 = true
                        numerodebandeiras += 1
                        if (boardB[2][3] == -1){
                            trocarbandeira -= 1
                        }
                        boardA[2][3].setBackgroundImage(nil, for: .normal)
                        boardA[2][3].setTitle("", for: .normal)
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
                else if (b13 == false && boardA[2][3].currentBackgroundImage != UIImage(named: "Bandeira")){
                    b13 = true
                    btBandeira.isUserInteractionEnabled = true
                    a13.backgroundColor = UIColor.white
                    if (primeiropasso == true){
                        primeiropasso = false
                        preencher(2, 3)
                    }
                    if (boardB[2][3] == -1){
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
                        if (boardB[2][3] == 0){
                            boardA[2][3].backgroundColor = UIColor.white
                            boardA[2][3].isUserInteractionEnabled = false
                            zero(2, 3)
                            for i in 0...4{
                                for j in 0...4{
                                    if (boardB[i][j] == -2){
                                        boardA[i][j].setTitle("", for: .normal)
                                    }
                                }
                            }
                        }
                        else{
                            boardA[2][3].setTitle(String(boardB[2][3]), for: .normal)
                        }
                    }
                    for i in 0...4{
                        for j in 0...4{
                            if (boardA[2][3].backgroundColor ==  UIColor.lightGray){
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
    @IBAction func A14(_ sender: Any) {
        if (botao_bandeira == true && boardA[2][4].backgroundColor != UIColor.white){
                    if (c14 == true){
                        if (numerodebandeiras >= 1){
                            c14 = false
                            numerodebandeiras -= 1
                            if (boardB[2][4] == -1){
                                trocarbandeira += 1
                            }
                            boardA[2][4].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[2][4].setTitle("", for: .normal)
                        }
                    }
                    else if (c14 == false){
                        c14 = true
                        numerodebandeiras += 1
                        if (boardB[2][4] == -1){
                            trocarbandeira -= 1
                        }
                        boardA[2][4].setBackgroundImage(nil, for: .normal)
                        boardA[2][4].setTitle("", for: .normal)
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
                else if (b14 == false && boardA[2][4].currentBackgroundImage != UIImage(named: "Bandeira")){
                    b14 = true
                    btBandeira.isUserInteractionEnabled = true
                    a14.backgroundColor = UIColor.white
                    if (primeiropasso == true){
                        primeiropasso = false
                        preencher(2, 4)
                    }
                    if (boardB[2][4] == -1){
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
                        if (boardB[2][4] == 0){
                            boardA[2][4].backgroundColor = UIColor.white
                            boardA[2][4].isUserInteractionEnabled = false
                            zero(2, 4)
                            for i in 0...4{
                                for j in 0...4{
                                    if (boardB[i][j] == -2){
                                        boardA[i][j].setTitle("", for: .normal)
                                    }
                                }
                            }
                        }
                        else{
                            boardA[2][4].setTitle(String(boardB[2][4]), for: .normal)
                        }
                    }
                    for i in 0...4{
                        for j in 0...4{
                            if (boardA[2][4].backgroundColor ==  UIColor.lightGray){
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
    @IBAction func A15(_ sender: Any) {
        if (botao_bandeira == true && boardA[3][0].backgroundColor != UIColor.white){
                    if (c15 == true){
                        if (numerodebandeiras >= 1){
                            c15 = false
                            numerodebandeiras -= 1
                            if (boardB[3][0] == -1){
                                trocarbandeira += 1
                            }
                            boardA[3][0].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[3][0].setTitle("", for: .normal)
                        }
                    }
                    else if (c15 == false){
                        c15 = true
                        numerodebandeiras += 1
                        if (boardB[3][0] == -1){
                            trocarbandeira -= 1
                        }
                        boardA[3][0].setBackgroundImage(nil, for: .normal)
                        boardA[3][0].setTitle("", for: .normal)
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
                else if (b15 == false && boardA[3][0].currentBackgroundImage != UIImage(named: "Bandeira")){
                    b15 = true
                    btBandeira.isUserInteractionEnabled = true
                    a15.backgroundColor = UIColor.white
                    if (primeiropasso == true){
                        primeiropasso = false
                        preencher(3, 0)
                    }
                    if (boardB[3][0] == -1){
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
                        if (boardB[3][0] == 0){
                            boardA[3][0].backgroundColor = UIColor.white
                            boardA[3][0].isUserInteractionEnabled = false
                            zero(3, 0)
                            for i in 0...4{
                                for j in 0...4{
                                    if (boardB[i][j] == -2){
                                        boardA[i][j].setTitle("", for: .normal)
                                    }
                                }
                            }
                        }
                        else{
                            boardA[3][0].setTitle(String(boardB[3][0]), for: .normal)
                        }
                    }
                    for i in 0...4{
                        for j in 0...4{
                            if (boardA[3][0].backgroundColor ==  UIColor.lightGray){
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
    @IBAction func A16(_ sender: Any) {
        if (botao_bandeira == true && boardA[3][1].backgroundColor != UIColor.white){
                    if (c16 == true){
                        if (numerodebandeiras >= 1){
                            c16 = false
                            numerodebandeiras -= 1
                            if (boardB[3][1] == -1){
                                trocarbandeira += 1
                            }
                            boardA[3][1].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[3][1].setTitle("", for: .normal)
                        }
                    }
                    else if (c16 == false){
                        c16 = true
                        numerodebandeiras += 1
                        if (boardB[3][1] == -1){
                            trocarbandeira -= 1
                        }
                        boardA[3][1].setBackgroundImage(nil, for: .normal)
                        boardA[3][1].setTitle("", for: .normal)
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
                else if (b16 == false && boardA[3][1].currentBackgroundImage != UIImage(named: "Bandeira")){
                    b16 = true
                    btBandeira.isUserInteractionEnabled = true
                    a16.backgroundColor = UIColor.white
                    if (primeiropasso == true){
                        primeiropasso = false
                        preencher(3, 1)
                    }
                    if (boardB[3][1] == -1){
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
                        if (boardB[3][1] == 0){
                            boardA[3][1].backgroundColor = UIColor.white
                            boardA[3][1].isUserInteractionEnabled = false
                            zero(3, 1)
                            for i in 0...4{
                                for j in 0...4{
                                    if (boardB[i][j] == -2){
                                        boardA[i][j].setTitle("", for: .normal)
                                    }
                                }
                            }
                        }
                        else{
                            boardA[3][1].setTitle(String(boardB[3][1]), for: .normal)
                        }
                    }
                    for i in 0...4{
                        for j in 0...4{
                            if (boardA[3][1].backgroundColor ==  UIColor.lightGray){
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
    @IBAction func A17(_ sender: Any) {
        if (botao_bandeira == true && boardA[3][2].backgroundColor != UIColor.white){
                    if (c17 == true){
                        if (numerodebandeiras >= 1){
                            c17 = false
                            numerodebandeiras -= 1
                            if (boardB[3][2] == -1){
                                trocarbandeira += 1
                            }
                            boardA[3][2].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[3][2].setTitle("", for: .normal)
                        }
                    }
                    else if (c17 == false){
                        c17 = true
                        numerodebandeiras += 1
                        if (boardB[3][2] == -1){
                            trocarbandeira -= 1
                        }
                        boardA[3][2].setBackgroundImage(nil, for: .normal)
                        boardA[3][2].setTitle("", for: .normal)
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
                else if (b17 == false && boardA[3][2].currentBackgroundImage != UIImage(named: "Bandeira")){
                    b17 = true
                    btBandeira.isUserInteractionEnabled = true
                    a17.backgroundColor = UIColor.white
                    if (primeiropasso == true){
                        primeiropasso = false
                        preencher(3, 2)
                    }
                    if (boardB[3][2] == -1){
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
                        if (boardB[3][2] == 0){
                            boardA[3][2].backgroundColor = UIColor.white
                            boardA[3][2].isUserInteractionEnabled = false
                            zero(3, 2)
                            for i in 0...4{
                                for j in 0...4{
                                    if (boardB[i][j] == -2){
                                        boardA[i][j].setTitle("", for: .normal)
                                    }
                                }
                            }
                        }
                        else{
                            boardA[3][2].setTitle(String(boardB[3][2]), for: .normal)
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
    @IBAction func A18(_ sender: Any) {
        if (botao_bandeira == true && boardA[3][3].backgroundColor != UIColor.white){
                    if (c18 == true){
                        if (numerodebandeiras >= 1){
                            c18 = false
                            numerodebandeiras -= 1
                            if (boardB[3][3] == -1){
                                trocarbandeira += 1
                            }
                            boardA[3][3].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[3][3].setTitle("", for: .normal)
                        }
                    }
                    else if (c18 == false){
                        c18 = true
                        numerodebandeiras += 1
                        if (boardB[3][3] == -1){
                            trocarbandeira -= 1
                        }
                        boardA[3][3].setBackgroundImage(nil, for: .normal)
                        boardA[3][3].setTitle("", for: .normal)
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
                else if (b18 == false && boardA[3][3].currentBackgroundImage != UIImage(named: "Bandeira")){
                    b18 = true
                    btBandeira.isUserInteractionEnabled = true
                    a18.backgroundColor = UIColor.white
                    if (primeiropasso == true){
                        primeiropasso = false
                        preencher(3, 3)
                    }
                    if (boardB[3][3] == -1){
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
                        if (boardB[3][3] == 0){
                            boardA[3][3].backgroundColor = UIColor.white
                            boardA[3][3].isUserInteractionEnabled = false
                            zero(3, 3)
                            for i in 0...4{
                                for j in 0...4{
                                    if (boardB[i][j] == -2){
                                        boardA[i][j].setTitle("", for: .normal)
                                    }
                                }
                            }
                        }
                        else{
                            boardA[3][3].setTitle(String(boardB[3][3]), for: .normal)
                        }
                    }
                    for i in 0...4{
                        for j in 0...4{
                            if (boardA[3][3].backgroundColor ==  UIColor.lightGray){
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
    @IBAction func A19(_ sender: Any) {
        if (botao_bandeira == true && boardA[3][4].backgroundColor != UIColor.white){
                    if (c19 == true){
                        if (numerodebandeiras >= 1){
                            c19 = false
                            numerodebandeiras -= 1
                            if (boardB[3][4] == -1){
                                trocarbandeira += 1
                            }
                            boardA[3][4].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[3][4].setTitle("", for: .normal)
                        }
                    }
                    else if (c19 == false){
                        c19 = true
                        numerodebandeiras += 1
                        if (boardB[3][4] == -1){
                            trocarbandeira -= 1
                        }
                        boardA[3][4].setBackgroundImage(nil, for: .normal)
                        boardA[3][4].setTitle("", for: .normal)
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
                else if (b19 == false && boardA[3][4].currentBackgroundImage != UIImage(named: "Bandeira")){
                    b19 = true
                    btBandeira.isUserInteractionEnabled = true
                    a19.backgroundColor = UIColor.white
                    if (primeiropasso == true){
                        primeiropasso = false
                        preencher(3, 4)
                    }
                    if (boardB[3][4] == -1){
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
                        if (boardB[3][4] == 0){
                            boardA[3][4].backgroundColor = UIColor.white
                            boardA[3][4].isUserInteractionEnabled = false
                            zero(3, 4)
                            for i in 0...4{
                                for j in 0...4{
                                    if (boardB[i][j] == -2){
                                        boardA[i][j].setTitle("", for: .normal)
                                    }
                                }
                            }
                        }
                        else{
                            boardA[3][4].setTitle(String(boardB[3][4]), for: .normal)
                        }
                    }
                    for i in 0...4{
                        for j in 0...4{
                            if (boardA[3][4].backgroundColor ==  UIColor.lightGray){
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
    @IBAction func A20(_ sender: Any) {
        if (botao_bandeira == true && boardA[4][0].backgroundColor != UIColor.white){
                    if (c20 == true){
                        if (numerodebandeiras >= 1){
                            c20 = false
                            numerodebandeiras -= 1
                            if (boardB[4][0] == -1){
                                trocarbandeira += 1
                            }
                            boardA[4][0].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[4][0].setTitle("", for: .normal)
                        }
                    }
                    else if (c20 == false){
                        c20 = true
                        numerodebandeiras += 1
                        if (boardB[4][0] == -1){
                            trocarbandeira -= 1
                        }
                        boardA[4][0].setBackgroundImage(nil, for: .normal)
                        boardA[4][0].setTitle("", for: .normal)
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
                else if (b20 == false && boardA[4][0].currentBackgroundImage != UIImage(named: "Bandeira")){
                    b20 = true
                    btBandeira.isUserInteractionEnabled = true
                    a20.backgroundColor = UIColor.white
                    if (primeiropasso == true){
                        primeiropasso = false
                        preencher(4, 0)
                    }
                    if (boardB[4][0] == -1){
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
                        if (boardB[4][0] == 0){
                            boardA[4][0].backgroundColor = UIColor.white
                            boardA[4][0].isUserInteractionEnabled = false
                            zero(4, 0)
                            for i in 0...4{
                                for j in 0...4{
                                    if (boardB[i][j] == -2){
                                        boardA[i][j].setTitle("", for: .normal)
                                    }
                                }
                            }
                        }
                        else{
                            boardA[4][0].setTitle(String(boardB[4][0]), for: .normal)
                        }
                    }
                    for i in 0...4{
                        for j in 0...4{
                            if (boardA[4][0].backgroundColor ==  UIColor.lightGray){
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
    @IBAction func A21(_ sender: Any) {
        if (botao_bandeira == true && boardA[4][1].backgroundColor != UIColor.white){
                    if (c21 == true){
                        if (numerodebandeiras >= 1){
                            c21 = false
                            numerodebandeiras -= 1
                            if (boardB[4][1] == -1){
                                trocarbandeira += 1
                            }
                            boardA[4][1].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[4][1].setTitle("", for: .normal)
                        }
                    }
                    else if (c21 == false){
                        c21 = true
                        numerodebandeiras += 1
                        if (boardB[4][1] == -1){
                            trocarbandeira -= 1
                        }
                        boardA[4][1].setBackgroundImage(nil, for: .normal)
                        boardA[4][1].setTitle("", for: .normal)
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
                else if (b21 == false && boardA[4][1].currentBackgroundImage != UIImage(named: "Bandeira")){
                    b21 = true
                    btBandeira.isUserInteractionEnabled = true
                    a21.backgroundColor = UIColor.white
                    if (primeiropasso == true){
                        primeiropasso = false
                        preencher(4, 1)
                    }
                    if (boardB[4][1] == -1){
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
                        if (boardB[4][1] == 0){
                            boardA[4][1].backgroundColor = UIColor.white
                            boardA[4][1].isUserInteractionEnabled = false
                            zero(4, 1)
                            for i in 0...4{
                                for j in 0...4{
                                    if (boardB[i][j] == -2){
                                        boardA[i][j].setTitle("", for: .normal)
                                    }
                                }
                            }
                        }
                        else{
                            boardA[4][1].setTitle(String(boardB[4][1]), for: .normal)
                        }
                    }
                    for i in 0...4{
                        for j in 0...4{
                            if (boardA[4][1].backgroundColor ==  UIColor.lightGray){
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
    @IBAction func A22(_ sender: Any) {
        if (botao_bandeira == true && boardA[4][2].backgroundColor != UIColor.white){
                    if (c22 == true){
                        if (numerodebandeiras >= 1){
                            c22 = false
                            numerodebandeiras -= 1
                            if (boardB[4][2] == -1){
                                trocarbandeira += 1
                            }
                            boardA[4][2].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[4][2].setTitle("", for: .normal)
                        }
                    }
                    else if (c22 == false){
                        c22 = true
                        numerodebandeiras += 1
                        if (boardB[4][2] == -1){
                            trocarbandeira -= 1
                        }
                        boardA[4][2].setBackgroundImage(nil, for: .normal)
                        boardA[4][2].setTitle("", for: .normal)
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
                else if (b22 == false && boardA[4][2].currentBackgroundImage != UIImage(named: "Bandeira")){
                    b22 = true
                    btBandeira.isUserInteractionEnabled = true
                    a22.backgroundColor = UIColor.white
                    if (primeiropasso == true){
                        primeiropasso = false
                        preencher(4, 2)
                    }
                    if (boardB[4][2] == -1){
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
                        if (boardB[4][2] == 0){
                            boardA[4][2].backgroundColor = UIColor.white
                            boardA[4][2].isUserInteractionEnabled = false
                            zero(4, 2)
                            for i in 0...4{
                                for j in 0...4{
                                    if (boardB[i][j] == -2){
                                        boardA[i][j].setTitle("", for: .normal)
                                    }
                                }
                            }
                        }
                        else{
                            boardA[4][2].setTitle(String(boardB[4][2]), for: .normal)
                        }
                    }
                    for i in 0...4{
                        for j in 0...4{
                            if (boardA[4][2].backgroundColor ==  UIColor.lightGray){
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
    @IBAction func A23(_ sender: Any) {
        if (botao_bandeira == true && boardA[4][3].backgroundColor != UIColor.white){
                    if (c23 == true){
                        if (numerodebandeiras >= 1){
                            c23 = false
                            numerodebandeiras -= 1
                            if (boardB[4][3] == -1){
                                trocarbandeira += 1
                            }
                            boardA[4][3].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[4][3].setTitle("", for: .normal)
                        }
                    }
                    else if (c23 == false){
                        c23 = true
                        numerodebandeiras += 1
                        if (boardB[4][3] == -1){
                            trocarbandeira -= 1
                        }
                        boardA[4][3].setBackgroundImage(nil, for: .normal)
                        boardA[4][3].setTitle("", for: .normal)
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
                else if (b23 == false && boardA[4][3].currentBackgroundImage != UIImage(named: "Bandeira")){
                    b23 = true
                    btBandeira.isUserInteractionEnabled = true
                    a23.backgroundColor = UIColor.white
                    if (primeiropasso == true){
                        primeiropasso = false
                        preencher(4, 3)
                    }
                    if (boardB[4][3] == -1){
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
                        if (boardB[4][3] == 0){
                            boardA[4][3].backgroundColor = UIColor.white
                            boardA[4][3].isUserInteractionEnabled = false
                            zero(4, 3)
                            for i in 0...4{
                                for j in 0...4{
                                    if (boardB[i][j] == -2){
                                        boardA[i][j].setTitle("", for: .normal)
                                    }
                                }
                            }
                        }
                        else{
                            boardA[4][3].setTitle(String(boardB[4][3]), for: .normal)
                        }
                    }
                    for i in 0...4{
                        for j in 0...4{
                            if (boardA[4][3].backgroundColor ==  UIColor.lightGray){
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
    @IBAction func A24(_ sender: Any) {
        if (botao_bandeira == true && boardA[4][4].backgroundColor != UIColor.white){
                    if (c24 == true){
                        if (numerodebandeiras >= 1){
                            c24 = false
                            numerodebandeiras -= 1
                            if (boardB[4][4] == -1){
                                trocarbandeira += 1
                            }
                            boardA[4][4].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[4][4].setTitle("", for: .normal)
                        }
                    }
                    else if (c24 == false){
                        c24 = true
                        numerodebandeiras += 1
                        if (boardB[4][4] == -1){
                            trocarbandeira -= 1
                        }
                        boardA[4][4].setBackgroundImage(nil, for: .normal)
                        boardA[4][4].setTitle("", for: .normal)
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
                else if (b24 == false && boardA[4][4].currentBackgroundImage != UIImage(named: "Bandeira")){
                    b24 = true
                    btBandeira.isUserInteractionEnabled = true
                    a24.backgroundColor = UIColor.white
                    if (primeiropasso == true){
                        primeiropasso = false
                        preencher(4, 4)
                    }
                    if (boardB[4][4] == -1){
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
                        if (boardB[4][4] == 0){
                            boardA[4][4].backgroundColor = UIColor.white
                            boardA[4][4].isUserInteractionEnabled = false
                            zero(4, 4)
                            for i in 0...4{
                                for j in 0...4{
                                    if (boardB[i][j] == -2){
                                        boardA[i][j].setTitle("", for: .normal)
                                    }
                                }
                            }
                        }
                        else{
                            boardA[4][4].setTitle(String(boardB[4][4]), for: .normal)
                        }
                    }
                    for i in 0...4{
                        for j in 0...4{
                            if (boardA[4][4].backgroundColor ==  UIColor.lightGray){
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
    @IBAction func A25(_ sender: Any) {
        if (botao_bandeira == true && boardA[5][0].backgroundColor != UIColor.white){
                    if (c25 == true){
                        if (numerodebandeiras >= 1){
                            c25 = false
                            numerodebandeiras -= 1
                            if (boardB[5][0] == -1){
                                trocarbandeira += 1
                            }
                            boardA[5][0].setBackgroundImage(UIImage(named: "Bandeira"), for: .normal)
                            boardA[5][0].setTitle("", for: .normal)
                        }
                    }
                    else if (c25 == false){
                        c25 = true
                        numerodebandeiras += 1
                        if (boardB[5][0] == -1){
                            trocarbandeira -= 1
                        }
                        boardA[5][0].setBackgroundImage(nil, for: .normal)
                        boardA[5][0].setTitle("", for: .normal)
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
                else if (b25 == false && boardA[5][0].currentBackgroundImage != UIImage(named: "Bandeira")){
                    b25 = true
                    btBandeira.isUserInteractionEnabled = true
                    a25.backgroundColor = UIColor.white
                    if (primeiropasso == true){
                        primeiropasso = false
                        preencher(5, 0)
                    }
                    if (boardB[5][0] == -1){
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
                        if (boardB[5][0] == 0){
                            boardA[5][0].backgroundColor = UIColor.white
                            boardA[5][0].isUserInteractionEnabled = false
                            zero(5, 0)
                            for i in 0...4{
                                for j in 0...4{
                                    if (boardB[i][j] == -2){
                                        boardA[i][j].setTitle("", for: .normal)
                                    }
                                }
                            }
                        }
                        else{
                            boardA[5][0].setTitle(String(boardB[5][0]), for: .normal)
                        }
                    }
                    for i in 0...4{
                        for j in 0...4{
                            if (boardA[5][0].backgroundColor ==  UIColor.lightGray){
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
    @IBAction func Recomeçar(_ sender: Any) {
        trocar = 0
        primeiropasso = true
        botao_bandeira = false
        apertarbandeira = false
        numerodebandeiras = 5
        trocarbandeira = 0
        for i in 0...4{
            for j in 0...4{
                boardB[i][j] = 0
                boardA[i][j].isUserInteractionEnabled = true
                boardA[i][j].setBackgroundImage(nil, for: .normal)
            }
        }
        b1 = false; b2 = false; b3 = false; b4 = false; b5 = false; b6 = false; b7 = false; b8 = false; b9 = false; b10 = false; b11 = false; b12 = false; b13 = false; b14 = false; b15 = false; b16 = false; b17 = false; b18 = false; b19 = false; b20 = false; b21 = false; b22 = false; b23 = false; b24 = false; b25 = false
        c1 = true; c2 = true; c3 = true; c4 = true; c5 = true; c6 = true; c7 = true; c8 = true; c9 = true; c10 = true; c11 = true; c12 = true; c13 = true; c14 = true; c15 = true; c16 = true; c17 = true; c18 = true; c19 = true; c20 = true; c21 = true; c22 = true; c23 = true; c24 = true; c25 = true
        viewDidLoad()
    }
    @IBAction func Bandeira(_ sender: Any) {
        if (apertarbandeira == false){
            botao_bandeira = true
            apertarbandeira = true
        }
    }
    
}
