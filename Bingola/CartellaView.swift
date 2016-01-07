//
//  CartellaView.swift
//  Bingola
//
//  Created by Marco Pugliese on 06/01/16.
//  Copyright © 2016 Marco Pugliese. All rights reserved.
//

import UIKit

class CartellaView: UIView {

    var caselle = [CasellaView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        super.drawRect(rect)
        
        let w = rect.width / 9
        let h = rect.height / 3
        
        for col in 0...8 {
            
            for row in 0...3 {
                
                let x = CGFloat(col) * w
                let y:CGFloat = CGFloat(row) * h
                let labelRect = CGRect(x: x, y: y, width: w, height: h)
                let casella = CasellaView(frame: labelRect)
                
                caselle.append(casella)

                self.addSubview(casella)
                
            }
            
        }
        
        popolate()
        
    }
    
    func popolate() {
        
        // svuoto
        for c in caselle {
            c.numero = ""
        }
        
        var numeri = generateNumbers()
        var indice = 0
        for col in 0...8 {
            
            for row in 0...3 {
                
                var numero = ""
                if (row < numeri[col].count) {
                    numero = (numeri[col][row] > 0) ? "\(numeri[col][row])" : ""
                }
                
                caselle[indice].numero = numero
                indice++
                
            }
            
        }
        
    }
    
    func generateNumbers() -> Array<Array<Int>> {
        
        // popolo le colonne
        var cols = Array<Array<Int>>()
        var positions:Array<Array<Int>> = [Array](count: 9, repeatedValue: [Int](count: 3, repeatedValue: 0))
        
        for x in 1...9 {
            var c = Array<Int>()
            let start = (x-1) * 10;
            for y in start...start+9 { c.append(y+1) }
            cols.append(c)
        }
        
        // riempio tutte le caselle
        for x in 0...8 {
            for y in 0...2 {
                let index2 = Int(arc4random_uniform(UInt32(cols[x].count)))
                positions[x][y] = cols[x][index2]
                cols[x].removeAtIndex(index2)
            }
            positions[x].sortInPlace()
        }
        
        // svuoto quelle che non mi servono
        for y in 0...2 {
            var chiavi = [0,1,2,3,4,5,6,7,8]
            for _ in 1...4 {
                let index2 = Int(arc4random_uniform(UInt32(chiavi.count)))
                positions[chiavi[index2]][y] = 0
                chiavi.removeAtIndex(index2)
            }
        }
        
        return positions
        
    }

}
