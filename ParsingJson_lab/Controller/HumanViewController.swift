//
//  HumanViewController.swift
//  ParsingJson_lab
//
//  Created by EricM on 8/28/19.
//  Copyright © 2019 EricM. All rights reserved.
//

import UIKit

class HumanViewController: UIViewController {
    var person: People!
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var homeOutlet: UILabel!
    @IBOutlet weak var dobOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameOutlet.text = "Name: \(person.name.first) \(person.name.last)"
        homeOutlet.text = "Address: \(person.location.city) \(person.location.street)"
        dobOutlet.text = "DOB: \(person.dob.date)"

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
