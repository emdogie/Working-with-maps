//
//  ViewController.swift
//  Maps
//
//  Created by marek on 07.06.2019.
//  Copyright © 2019 Marek Garczewski. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate {

    
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
        let locations = [CLLocationCoordinate2D(latitude: 54.3520, longitude: 18.6466),
                         CLLocationCoordinate2D(latitude: 54.3600, longitude: 18.6366),
                         CLLocationCoordinate2D(latitude: 54.3640, longitude: 18.6266),
                         CLLocationCoordinate2D(latitude: 54.3660, longitude: 18.6166)]
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

    
    @IBAction func selectRoadButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "segue", sender: self)
    }
    
}

