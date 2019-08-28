//
//  PeopleViewController.swift
//  ParsingJson_lab
//
//  Created by EricM on 8/27/19.
//  Copyright © 2019 EricM. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var peopleTableViewOutlet: UITableView!
    var humans = [People]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return humans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = peopleTableViewOutlet.dequeueReusableCell(withIdentifier: "randCell", for: indexPath)
        cell.textLabel?.text = "First Name: \(humans[indexPath.row].name.first) Last Name: \(humans[indexPath.row].name.last)"
        cell.detailTextLabel?.text = "Age: \(humans[indexPath.row].dob.age)"
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peopleTableViewOutlet.dataSource = self
        peopleTableViewOutlet.delegate = self
        loadData()
        
        // Do any additional setup after loading the view.
    }
    
    private func loadData(){
        // just the string for the name of the file
        guard let pathToJSONFile =
            Bundle.main.path(forResource: "people", ofType: "json") else {fatalError("couldn't Find json file")}
        print(pathToJSONFile)
        // is a reference to the ctual location of the json file
        let url = URL(fileURLWithPath: pathToJSONFile)
        do{
            let data = try Data(contentsOf: url)
            humans = try People.getPeople(from: data)
            // if either try fails the catch will catch both of them
        } catch{
            fatalError("couldn't get weather from JSON")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else { fatalError("No identifier in segue") }
        
        switch segueIdentifier {
        case "humanSegway" :
            guard let humanVC = segue.destination as? HumanViewController else {
                fatalError("Unexpected segue VC")
            }
            guard let selectedIndexPath = peopleTableViewOutlet.indexPathForSelectedRow else {
                fatalError("No row was selected")
            }
            humanVC.person = humans[selectedIndexPath.row]
        default:
            fatalError("Nice Try")
        }
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
