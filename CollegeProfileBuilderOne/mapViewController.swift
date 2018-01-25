//
//  mapViewController.swift
//  CollegeProfileBuilderOne
//
//  Created by Elizabeth on 3/7/17.
//  Copyright © 2017 Elizabeth. All rights reserved.
//

import UIKit
import MapKit

class mapViewController: UIViewController,UISearchBarDelegate
{
    @IBOutlet weak var myMapView: MKMapView!
    
    var searchController : UISearchController! // manages presentation of search bar
    var annotation : MKAnnotation!
    var localSearchRequest : MKLocalSearchRequest! // request search for poi
    var localSearch : MKLocalSearch! // initiates the search
    var localSearchResponse : MKLocalSearchResponse! // stores result
    var pointAnnotation : MKPointAnnotation!
    var pinAnnotationView : MKPinAnnotationView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
    
    }

    @IBAction func showSearchBar(_ sender: Any)
    {
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
        //making the search controller, presenting it, etc.
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        if myMapView.annotations.count != 0
        {
            annotation = myMapView.annotations[0]
            myMapView.removeAnnotation(annotation)
        }
        localSearchRequest = MKLocalSearchRequest()
        localSearchRequest.naturalLanguageQuery = searchBar.text
        localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start
            {
                (localSearchResponse, error) in
                if localSearchResponse == nil
                {
                    let alertController = UIAlertController(title: " Place Not Found", message: nil, preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title:"dismiss",style: UIAlertActionStyle.default, handler: nil))
                    self.present(alertController, animated:true, completion:nil)
                    return//in case of no result
                }
                self.pointAnnotation = MKPointAnnotation()
                self.pointAnnotation.title = searchBar.text
                self.pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude: localSearchResponse!.boundingRegion.center.longitude)
                self.pinAnnotationView = MKPinAnnotationView(annotation:self.pointAnnotation, reuseIdentifier: nil)
                self.myMapView.centerCoordinate = self.pointAnnotation.coordinate
                self.myMapView.addAnnotation(self.pinAnnotationView.annotation!)
                self.centerMap(location: self.pointAnnotation.coordinate)
        }
    }
    
    func centerMap(location: CLLocationCoordinate2D)
    {
        let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
        let region = MKCoordinateRegion(center: location, span: span)
        myMapView.setRegion(region, animated: true)
    }
    
    
    


}
