//
//  SchemeViewController.swift
//  ParsingJson_lab
//
//  Created by EricM on 8/28/19.
//  Copyright © 2019 EricM. All rights reserved.
//

import UIKit

class SchemeViewController: UIViewController {
    var coloring: Color!
    @IBOutlet weak var colorOutlet: UILabel!
    @IBOutlet weak var hexOutlet: UILabel!
    @IBOutlet weak var rgbOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorOutlet.text = "Color: \(coloring.name.value)"
        hexOutlet.text = "HEX: \(coloring.hex.clean)"
        rgbOutlet.text = "Red: \(coloring.rgb.r) Green: \(coloring.rgb.g) Blue: \(coloring.rgb.b)"
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
