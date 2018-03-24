//
//  HomeViewController.swift
//  Demo
//
//  Created by ty on on 3/20/18.
//  Copyright © 2018 vanra. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
protocol HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark)
}
class HomeViewController: UIViewController, CLLocationManagerDelegate
{

    @IBOutlet weak var mapView: MKMapView!
    var selectedPin:MKPlacemark? = nil
    let zoom : Float = 15.0
    var locationManager = CLLocationManager()
    var savedLocation : [location]!
    var resultSearchController: UISearchController? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadSavedLocation()
        self.addSavedMarker()
        if self.revealViewController() != nil{
        
        self.setupMenuGestureRecognizer()
        self.navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage.init(named: "menu"), style: .plain, target: self.revealViewController, action: #selector(self.revealViewController().revealToggle(_:))), animated: true)
        }
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestLocation()
        
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "LocationSearchTable") as! LocationSearchTableViewController
        locationSearchTable.mapView = self.mapView
        locationSearchTable.handleMapSearchDelegate = self
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
        
    }
    
    
    //MARK: Create marker for all saved location
    func addSavedMarker(){
        if self.savedLocation != nil{
            for i in 0 ..< savedLocation.count{
                let currentLocation = savedLocation[i]
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2DMake(Double(currentLocation.lat!), Double(currentLocation.long!))
                annotation.title = currentLocation.name
                
                
                annotation.subtitle = currentLocation.address
                
                mapView.addAnnotation(annotation)
                mapView.selectAnnotation(annotation, animated: true)
            }
        }
    }

    
    //MARK: Load all save Location
    func loadSavedLocation(){
      
        if (LocationManager.shareInstance.getLocations()) != nil {
            self.savedLocation = LocationManager.shareInstance.getLocations()
            
        }
        else{
            self.savedLocation = dummyData
        }
          print(self.savedLocation.count)
       
    }
    
    
    
    
    //MARK: CLLoactionManager Delegate Method
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            locationManager.requestLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error loading map")
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if let location = locations.last{
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            self.mapView.setRegion(region, animated: true)
            print(location.coordinate)
        }
        
    }
    
}


//MARK: Handle Map Search Delegate Method
//MARK: Drop Pin and Zoom in when selected on a location
extension HomeViewController: HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark){
        selectedPin = placemark
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        
        if let city = placemark.locality,
            let state = placemark.administrativeArea {
            annotation.subtitle = "\(city) \(state)"
        }
        mapView.addAnnotation(annotation)
        mapView.selectAnnotation(annotation, animated: true)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(placemark.coordinate, span)
        mapView.setRegion(region, animated: true)
    }
}





private let DimmingViewTag = 10001
//MARK: - SWRevealViewControllerDelegate
extension UIViewController: SWRevealViewControllerDelegate {
   
    func setupMenuGestureRecognizer() {
        
        revealViewController().delegate = self
        
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        view.addGestureRecognizer(revealViewController().tapGestureRecognizer())
    }
    
    //MARK: Bring another view to the front when show menu side bar
    public func revealController(_ revealController: SWRevealViewController!, willMoveTo position: FrontViewPosition) {
        

        if case .right = position {
            print("right")
            let dimmingView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height + 60))
            dimmingView.tag = DimmingViewTag
            dimmingView.backgroundColor = .clear
            dimmingView.alpha = 1.0
        
            
            
            view?.addSubview(dimmingView)
            view?.bringSubview(toFront: dimmingView)
//            UIView.animate(withDuration: 0.5) { () -> Void in
//                dimmingView.alpha = 0.3
//
//            }



        } else {
            UIView.animate(withDuration: 0.5) { () -> Void in
                self.navigationController?.navigationBar.layer.zPosition = 1
                self.view?.viewWithTag(DimmingViewTag)?.removeFromSuperview()

            }

        }
    }
}
