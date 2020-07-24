//
//  ViewController.swift
//  Map
//
//  Created by soc-admin on 7/24/20.
//  Copyright © 2020 soc-admin. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController {

    @IBOutlet weak var userMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    fileprivate let  locationManager :  CLLocationManager = {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        return manager
    }()
    func currentLocation()
    {
        locationManager.delegate = self as! CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if #available(iOS 12.0, *)
        {
            locationManager.showsBackgroundLocationIndicator = true
        }
        else
        {
            
        }
       locationManager.startUpdatingLocation()
    }


}
extension ViewController : CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        let currentLocation =  location.coordinate
        let coordinateRegion = MKCoordinateRegion(center:currentLocation, latitudinalMeters: 800, longitudinalMeters: 800)
        userMapView.setRegion(coordinateRegion, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

