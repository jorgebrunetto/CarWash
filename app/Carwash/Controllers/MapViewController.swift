//
//  MapViewController.swift
//  Carwash
//
//  Created by Bluecore on 01/09/18.
//

import UIKit
import MapKit

/*
 Controller Map - Responsável pelo gerenciamento do mapa através da localização do usuário e apresentação dos lavadores ao redor
 */
class MapViewController: UIViewController,MKMapViewDelegate{

    @IBOutlet weak var mapView:MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapView.showsUserLocation = true
        mapView.delegate = self
        mapView.userLocation.title = "Sua Localização"
    }
    
    func updateMap(location:CLLocation){
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true)
    }
    
    func onSuccessGetWashers(list:[ResponseWashers]){
        
        for item in list{
            let annotation = AnnotationWasher()
            annotation.coordinate = CLLocationCoordinate2D(latitude: (item.Latitude! as NSString).doubleValue, longitude: (item.Longitude! as NSString).doubleValue)
            if item.Name != nil{
                annotation.title = item.Name
            }
            else{
                annotation.title = "Lavador desconhecido"
            }
        
            if item.Address != nil{
                annotation.subtitle = item.Address
            }
            annotation.itemWasher = item
            mapView.addAnnotation(annotation)
        }
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "WasherProfileViewController") as! WasherProfileViewController
        
        if let pin = view.annotation as? AnnotationWasher
        {
            detailsVC.washerItem = pin.itemWasher
        }
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
