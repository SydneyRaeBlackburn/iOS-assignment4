//
//  MapViewController.swift
//  Assignment4
//
//  Created by Sydney Blackburn on 10/25/18.
//  Copyright © 2018 Sydney Blackburn. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    // MARK: - Variables
    @IBOutlet weak var mapView: MKMapView!
    var locationManager:CLLocationManager = CLLocationManager()
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Request location authorization
        locationManager.requestWhenInUseAuthorization()
        
        // Set the region to San Diego County
        mapView!.region = sanDiegoCountyLocation()
        
        // Set the map type
        mapView!.mapType = MKMapType.standard
        
        // Show user location
        mapView!.showsUserLocation = true
        
        // Show traffic
        mapView!.showsTraffic = true
    }
    
    // MARK: - region funcs
    func sanDiegoCountyLocation() -> MKCoordinateRegion {
        // get the location for San Diego County and the amount zoom
        let center = CLLocationCoordinate2DMake(32.76572795, -117.07319880 )
        let widthMeters:CLLocationDistance = 100
        let heightMeters:CLLocationDistance = 1000*120
        return MKCoordinateRegion(center: center, latitudinalMeters: widthMeters, longitudinalMeters: heightMeters)
    }
    
    // MARK: - viewWill funcs
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // name for map tab
        tabBarItem.title = "Map"
    }
}
