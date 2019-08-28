//
//  ViewController.swift
//  ParsingJson_lab
//
//  Created by EricM on 8/27/19.
//  Copyright © 2019 EricM. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var weatherTableViewOutlet: UITableView!
    var weathers = [WeatherInfo]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTableViewOutlet.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        cell.textLabel?.text = weathers[indexPath.row].name
        cell.detailTextLabel?.text = "Temperature Celsius: \(weathers[indexPath.row].main.temp)"
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableViewOutlet.dataSource = self
        weatherTableViewOutlet.delegate = self
        loadData()
        // Do any additional setup after loading the view.
    }
    
    private func loadData(){
        // just the string for the name of the file
        guard let pathToJSONFile =
            Bundle.main.path(forResource: "cityWeather", ofType: "json") else {fatalError("couldn't Find json file")}
        print(pathToJSONFile)
        // is a reference to the ctual location of the json file
        let url = URL(fileURLWithPath: pathToJSONFile)
        
        do{
            let data = try Data(contentsOf: url)
            weathers = try WeatherInfo.getWeather(from: data)
            // if either try fails the catch will catch both of them
        } catch{
            fatalError("couldn't get weather from JSON")
        }
        //whatever we decode from the json file
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else { fatalError("No identifier in segue") }
        
        switch segueIdentifier {
        case "weatherSegway" :
            guard let weatherVC = segue.destination as? ForcastViewController else {
                fatalError("Unexpected segue VC")
            }
            guard let selectedIndexPath = weatherTableViewOutlet.indexPathForSelectedRow else {
                fatalError("No row was selected")
            }
            weatherVC.forcasts = weathers[selectedIndexPath.row]
        default:
            fatalError("Nice Try")
        }
    }
}

