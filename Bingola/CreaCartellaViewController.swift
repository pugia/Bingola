//
//  CreaCartellaViewController.swift
//  Bingola
//
//  Created by Marco Pugliese on 06/01/16.
//  Copyright © 2016 Marco Pugliese. All rights reserved.
//

import UIKit

class CreaCartellaViewController: UIViewController {

    @IBOutlet weak var cartella: CartellaView!
    @IBAction func generateClick(sender: AnyObject) {
        cartella.popolate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        NSBundle.mainBundle().loadNibNamed("CreaCartellaViewController", owner: self, options: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
