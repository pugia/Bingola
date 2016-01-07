//
//  CasellaView.swift
//  Bingola
//
//  Created by Marco Pugliese on 06/01/16.
//  Copyright © 2016 Marco Pugliese. All rights reserved.
//

import UIKit

@IBDesignable class CasellaView: UIView {

    var view:UIView!
    var nibName:String = "CasellaView"
    
    @IBOutlet weak var valore: UILabel!
    
    @IBInspectable var numero : String {
        get {
            return valore.text!
        }
        set(n) {
            valore.text = n
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    func setup() {
        
        view = loadViewFromNib()
        
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        addSubview(view)
        
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
}
