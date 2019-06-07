//
//  TableTableViewController.swift
//  Maps
//
//  Created by marek on 07.06.2019.
//  Copyright © 2019 Marek Garczewski. All rights reserved.
//

import UIKit
import MapKit
protocol createLine {
    func drawLine(_ locations: [CLLocationCoordinate2D])
}
class TableTableViewController: UITableViewController {

    let roads = ["Gdansk -> Sopot", "Gdynia -> Gdansk"]
    var delegate: ViewController?
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return roads.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = roads[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let locations = [CLLocationCoordinate2D(latitude: 54.352024, longitude: 18.646639),
                             CLLocationCoordinate2D(latitude: 54.441582, longitude: 18.560097)]
            delegate!.drawLine(locations)
        } else {
            let locations = [CLLocationCoordinate2D(latitude: 54.352024, longitude: 18.646639),
                             CLLocationCoordinate2D(latitude: 54.518890, longitude: 18.530540)]
            delegate!.drawLine(locations)
        }
    }

}
