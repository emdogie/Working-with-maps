//
//  ViewController.swift
//  Maps
//
//  Created by marek on 07.06.2019.
//  Copyright © 2019 Marek Garczewski. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate, createLine {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    var myInitLocation = CLLocationCoordinate2D(latitude: 54.3520, longitude: 18.6466)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        let region = MKCoordinateRegion(center: myInitLocation, span: span)
        
        mapView.setRegion(region, animated: true)
        mapView.delegate = self
        
        createPolyline()
    }

    func createPolyline() {
        let locations = [CLLocationCoordinate2D(latitude: 54.371943, longitude: 18.611805),
                         CLLocationCoordinate2D(latitude: 54.371268, longitude: 18.612341),
                         CLLocationCoordinate2D(latitude: 54.371956, longitude: 18.612942),
                         CLLocationCoordinate2D(latitude: 54.371943, longitude: 18.611805)]
        let aPolyline = MKPolyline(coordinates: locations, count: locations.count)
        mapView.addOverlay(aPolyline)
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if (overlay is MKPolyline) {
            let polylineRender = MKPolylineRenderer(overlay: overlay)
            polylineRender.strokeColor = UIColor.red.withAlphaComponent(0.5)
            polylineRender.lineWidth = 5
            return polylineRender
        }
        return MKPolylineRenderer()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            let vcDestination = segue.destination as! TableTableViewController
            vcDestination.delegate = self
        }
    }
    
    @IBAction func selectRoadButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    func drawLine(_ locations: [CLLocationCoordinate2D]) {
        let aPolyline = MKPolyline(coordinates: locations, count: locations.count)
        mapView.addOverlay(aPolyline)
    }
    
}

