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
        var real_cols:Array<Array<Int>> = [Array](count: 9, repeatedValue: [])
        var tot = 0
        
        for x in 1...9 {
            var c = Array<Int>()
            let start = (x-1) * 10;
            for y in start...start+9 { c.append(y+1) }
            cols.append(c)
        }
        
        
        while tot < 15 {
            
            let index1 = Int(arc4random_uniform(UInt32(cols.count)))
            
            if (real_cols[index1].count < 3) {
                let index2 = Int(arc4random_uniform(UInt32(cols[index1].count)))
                real_cols[index1].append(cols[index1][index2])
                cols[index1].removeAtIndex(index2)
                tot++
            }
            
            real_cols[index1].sortInPlace()
            
        }
        
        // creo i vuoti
        
        for (i,c) in real_cols.enumerate() {
            
            let vuoti = 3 - c.count
            
            if (vuoti > 0 && vuoti < 3) {
                for _ in 0...(vuoti-1) {
                    let index = Int(arc4random_uniform(3))
                    if (index < real_cols[i].count) {
                        real_cols[i].insert(0, atIndex: index)
                    } else {
                        real_cols[i].append(0)
                    }
                }
            }
            
        }
        
        return real_cols
        
    }

}
