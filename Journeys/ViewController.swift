//
//  ViewController.swift
//  Journeys
//
//  Created by Rajtharan Gopal on 18/07/18.
//  Copyright © 2018 Rajtharan Gopal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toAddressTextField: UITextField!
    var mapView: MMIMapView!
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MMIMapView(frame: view.frame)
        if let aView = mapView {
            view.addSubview(aView)
            view.sendSubview(toBack: aView)
        }
        mapView.zoom = 14.0
        mapView.showZoomButtons(true)
        mapView.showCurrentLocationButton(true)
        mapView.showUserLocation = true
        print("User's location: \(mapView.userLocation)")
        mapView.clusteringEnabled = true
        mapView.getCurrentLocationButton().frame.origin = CGPoint(x: view.frame.maxX - mapView.getCurrentLocationButton().frame.width - 10, y: view.frame.maxY - mapView.getCurrentLocationButton().frame.height - 10)
        mapView.getCurrentLocationButton().setTitle("", for: .normal)
        mapView.getCurrentLocationButton().setImage(#imageLiteral(resourceName: "current_location"), for: .normal)
        mapView.getZoomButtonsContainer().frame.origin = CGPoint(x: view.frame.maxX - mapView.getZoomButtonsContainer().frame.width - 10, y: view.frame.maxY - 10 - mapView.getZoomButtonsContainer().frame.height - 10 - mapView.getCurrentLocationButton().frame.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBAction
    
    @IBAction func toAddressButtonPressed(_ sender: UIButton) {
        let searchAddressViewController = SearchAddressViewController.searchAddressViewController()
        navigationController?.pushViewController(searchAddressViewController, animated: true)
    }
    
    // MARK: - Custom
    
    func addMarker(latitude: Double, longitude: Double, description: String, image: UIImage?, opacity: Float = 1) {
        let annotation = MMIAnnotation()
        annotation.latitude = latitude
        annotation.longitude = longitude
        annotation.title = description
        if let markerImage = image {
            annotation.markerImage = markerImage
            annotation.makerSize = CGSize(width: 48, height: 48)
        }
        annotation.canShowCallout = true
        annotation.opacity = opacity
        mapView.add(annotation)
    }
    
    func addPolylines(locations: [CLLocation], width: Float, color: UIColor) {
        mapView.polylineWidth = width
        mapView.polylineColor = color
        mapView.drawPolyLine(locations)
    }
    
    func drawCircle(latitude: Double, longitude: Double, radius: CGFloat, lineWidth: CGFloat, lineColor: UIColor, fillColor: UIColor) {
        let annotation = MMIAnnotation()
        annotation.latitude = latitude
        annotation.longitude = longitude
        annotation.radiusInMeters = radius
        annotation.lineWidthInPixels = lineWidth
        annotation.lineColor = lineColor
        annotation.fillColor = fillColor
        mapView.add(annotation)
    }
    
    func route(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) {
        let directionManagerObject = DirectionManager()
        directionManagerObject.with_advices = "1"
        //if you want full textual advice in the response
        directionManagerObject.getDirections(from, endPoint: to, viaPoints: ["\(28.123),\(78.451)"]) { result, error in
            // if error is nil, then result is success. // result is response
        }
    }
    
    func distance(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) {
        let distanceManagerObject = DistanceManager()
        distanceManagerObject.getDistance(from, points: [to]) { result, error in
            // if error is nil, then result is success.
            // result is response
        }
    }

}

extension ViewController: MMIDelegate {
    
    func mapViewRegionDidChange(_ mapView: MMIMapView?) {
    }
    
    func afterMapMove(_ map: MMIMapView?, byUser wasUserAction: Bool) {
    }
    
    func afterMapZoom(_ map: MMIMapView?, byUser wasUserAction: Bool) {
    }
    
    func tap(on annotation: MMIAnnotation?, onMap mapView: MMIMapView?) {
    }
    
    func singleTap(onMap map: MMIMapView!, at point: CGPoint) {
    }
    
    func longPress(onMap map: MMIMapView!, at point: CGPoint) {
    }
    
}

