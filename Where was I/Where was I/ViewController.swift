//
//  ViewController.swift
//  Where was I
//
//  Created by Mac Pro on 2/16/19.
//  Copyright © 2019 Mac Pro. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager();
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func saveBtnClicked(_ sender: Any) {
        let coord = locationManager.location?.coordinate
        if let lat = coord?.latitude{
            if let long = coord?.longitude{
                DataStore().storeDataPoint(latitude:String(lat), longitude:String(long))
                UpdatePinAnnotation()
            }
        }
        print("pressed")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self;
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation();
        UpdatePinAnnotation();
    }
    func UpdatePinAnnotation(){
        let annoRem = mapView.annotations.filter{$0 !== mapView.userLocation};
        mapView.removeAnnotations(annoRem)
        if let oldCoords = DataStore().getLastLocation(){
            let anotation = MKPointAnnotation()
            anotation.coordinate.latitude = Double(oldCoords.latitude)!
            anotation.coordinate.longitude = Double(oldCoords.longitude)!
            anotation.title = "I was here"
            anotation.subtitle = "Remeber ?"
            mapView.addAnnotation(anotation)
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else{
            print("Location not enabled");
            return;
        }
        print("location allowed");
        mapView.showsUserLocation = true;
    }


}

