//
//  ForcastViewController.swift
//  ParsingJson_lab
//
//  Created by EricM on 8/28/19.
//  Copyright © 2019 EricM. All rights reserved.
//

import UIKit

class ForcastViewController: UIViewController {
    var forcasts : WeatherInfo!
    @IBOutlet weak var locationOutlet: UILabel!
    @IBOutlet weak var typeOutlet: UILabel!
    @IBOutlet weak var descriptionOutlet: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationOutlet.text = "\(forcasts.name)"
        typeOutlet.text = "\(forcasts.weather[0].main)"
        descriptionOutlet.text = "\(forcasts.weather[0].description)"

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
