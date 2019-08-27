//
//  ColorViewController.swift
//  ParsingJson_lab
//
//  Created by EricM on 8/27/19.
//  Copyright © 2019 EricM. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var colorTableViewOutlet: UITableView!
    var colors = [Color]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = colorTableViewOutlet.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        cell.textLabel?.text = colors[indexPath.row].name.value
        cell.detailTextLabel?.text = "Color values: \(colors[indexPath.row].rgb)"
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(colors[indexPath.row].rgb.r/255), green: CGFloat(colors[indexPath.row].rgb.g/255), blue: CGFloat(colors[indexPath.row].rgb.b/255), alpha: 1)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        colorTableViewOutlet.dataSource = self
        colorTableViewOutlet.delegate = self
        loadData()
        // Do any additional setup after loading the view.
    }
    
    private func loadData(){
        // just the string for the name of the file
        guard let pathToJSONFile =
            Bundle.main.path(forResource: "color", ofType: "json") else {fatalError("couldn't Find json file")}
        print(pathToJSONFile)
        // is a reference to the ctual location of the json file
        let url = URL(fileURLWithPath: pathToJSONFile)
        do{
            let data = try Data(contentsOf: url)
            colors = try Color.getColor(from: data)
            // if either try fails the catch will catch both of them
        } catch{
            fatalError("couldn't get weather from JSON")
        }
        //whatever we decode from the json file
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
