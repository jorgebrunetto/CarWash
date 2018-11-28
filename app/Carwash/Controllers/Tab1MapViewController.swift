//
//  Tab1MapViewController.swift
//  Carwash
//
//  Created by Bluecore on 29/08/18.
//

import UIKit
import CoreLocation
import MapKit

/*
 Controller Tab 1 - Responsável pela gerenciamento de apresentação do mapa/lista de pessoas ao redor
 */
class Tab1MapViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var viewContainer:UIView!
    @IBOutlet weak var buttonFilter:UIButton!
    @IBOutlet weak var buttonMap:UIButton!
    @IBOutlet weak var buttonList:UIButton!

    @IBOutlet weak var viewLoading:UIView!
    @IBOutlet weak var spinnerLoading:UIActivityIndicatorView!
    
    @IBOutlet weak var labelKm: UILabel!
    
    
    @IBOutlet weak var horontalSlider:UISlider!
    
    var isMap:Bool=true
    
    var childMapController:MapViewController?
    
    var childListController:ListPeopleViewController?
    
    var locationManager:CLLocationManager!
    var location:CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.performSegue(withIdentifier: "segueMap", sender: nil)
        
        childMapController = self.storyboard?.instantiateViewController(withIdentifier: "MapViewController") as? MapViewController
       
        self.addChild(childMapController!)
        viewContainer.addSubview((childMapController?.view)!)
        childMapController?.didMove(toParent: self)
        
  
        // Get Current location
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        showLoading()
    }
    
    func showLoading(){
        viewLoading.isHidden = false
        spinnerLoading.startAnimating()
    }
    func stopLoading(){
        viewLoading.isHidden = true
        spinnerLoading.stopAnimating()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
        locationManager.delegate = nil
        locationManager.stopUpdatingLocation()
        
        location = locations.last! as CLLocation
        if(isMap){
            childMapController?.updateMap(location: location!)
            
            findWashers()
        }
        else{
            childListController?.setMyLocation(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
        }
    }
    
    func findWashers(){
        if(location != nil){
            let api = RestApi()
            let latitude = String(format: "%f", (location?.coordinate.latitude)!)
            let longitude = String(format: "%f", (location?.coordinate.longitude)!)
            api.apiFindWashersArround(token: UserSession.sharedInstance.resultLogin.Token, radius:Int(horontalSlider.value), latitude: latitude, longitude: longitude, onSuccessCallback: { (response) -> (Void) in
                
                self.stopLoading()
                if(self.isMap){
                    self.childMapController?.onSuccessGetWashers(list: response.listWashers!)
                }
                else{
                    self.childListController?.onSuccessGetWashers(list: response.listWashers!)
                }
            }) { (messageError) -> (Void) in
                self.stopLoading()
                
                let alert = UIAlertController(title: "", message: messageError, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
           
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let alert = UIAlertController(title: "Erro", message: "Não foi possível capturar dados da localização. Por favor, verifique a sua conexão com a Internet e se o GPS está habilitado.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        stopLoading()
    }
    
    @IBAction func filterList(){
        
        showLoading()
        findWashers()
        
        /*let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.cancel, handler: { (alert) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Filtro 1", style: UIAlertAction.Style.default, handler: { (alert) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Filtro 2", style: UIAlertAction.Style.default, handler: { (alert) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Filtro 3", style: UIAlertAction.Style.default, handler: { (alert) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(actionSheet, animated: true, completion: nil)*/
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        let currentValue = Int(sender.value)
        labelKm.text = String(currentValue) + " Km"
    }
    
    @IBAction func sliderTouchUp(sender:UISlider){
        showLoading()
        findWashers()
    }
    
    @IBAction func showListController(){
        showLoading()
        buttonList.isHidden = true
        buttonMap.isHidden = false
        isMap = false
     
        childMapController?.removeFromParent()
        
        childListController = self.storyboard?.instantiateViewController(withIdentifier: "ListPeopleViewController") as? ListPeopleViewController
        
        self.addChild(childListController!)
        viewContainer.addSubview((childListController?.view)!)
        childListController?.didMove(toParent: self)
        if (location != nil){
            childListController?.setMyLocation(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
        }

        findWashers()
    }
    @IBAction func showMapController(){
        showLoading()
        buttonList.isHidden = false
        buttonMap.isHidden = true
        isMap = true
        
        childListController?.removeFromParent()
        
        self.addChild(childMapController!)
        viewContainer.addSubview((childMapController?.view)!)
        childMapController?.didMove(toParent: self)
        if(location != nil){
            childMapController?.updateMap(location: location!)
            findWashers()
        }
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
