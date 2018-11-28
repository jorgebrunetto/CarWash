//
//  ListPeopelViewController.swift
//  Carwash
//
//  Created by Bluecore on 01/09/18.
//

import UIKit
import Kingfisher
import CoreLocation

/*
 Controller ListPeople - Responsável pelo gerenciamento de listagem de pessoas ao redor
 */
class ListPeopleViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView:UITableView!
    
    private var list: [ResponseWashers]!
    var myLatitude:CLLocationDegrees?
    var myLongitude:CLLocationDegrees?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        list = [ResponseWashers]()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onSuccessGetWashers(list:[ResponseWashers]){
        self.list = list
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let item = list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellWashers")!

        let imgView = cell.viewWithTag(1) as! UIImageView
        let labelName = cell.viewWithTag(2) as! UILabel
        let labelTotalWashs = cell.viewWithTag(3) as! UILabel
        let labelDistance = cell.viewWithTag(4) as! UILabel
        let labelPrize = cell.viewWithTag(5) as! UILabel
        
        labelName.text = ""
        labelTotalWashs.text = ""
        labelDistance.text = ""
        labelPrize.text = ""
        
        if item.Name != nil{
            labelName.text = item.Name
        }
        
        if item.Address != nil && item.City != nil && item.State != nil{
            labelTotalWashs.text = item.Address! + ", " + item.City! + " - " + item.State!
        }
    
        if myLatitude != nil && myLongitude != nil && item.Latitude != nil && item.Longitude != nil{
            let c0 = CLLocation(latitude: myLatitude!, longitude: myLongitude!)
            let lat = (item.Latitude! as NSString).doubleValue
            let longit = (item.Longitude! as NSString).doubleValue
            let c1 = CLLocation(latitude: lat, longitude: longit)
            
            let distance = getDistanceInMeters(coordinate0: c0, coordinate1: c1)
            if distance < 1000{
                // apresentar em M
                labelDistance.text = String(distance) + " m"
                
            }
            else{
                // apresentar em KM
                labelDistance.text = String(format: "%.2f", Double(distance)/1000.0) + " km"
            }
        }
        labelPrize.text = "R$ " + String(format: "%.2f", item.MinPrice)
        
        // setar imagem, e chamar metodo para puxar imagem com as iniciais do nome
        imgView.layer.cornerRadius = 0.5 * 40;
        imgView.clipsToBounds = true
        /*var path:String = "https://ui-avatars.com/api/?background=d3d3d3&color=fff&font-size=0.33&name="
        if item.Name != nil{
            path = path + item.Name!
            path = path.addingPercentEncoding(withAllowedCharacters: .whitespaces)!
        }
        let url = URL(string: path)
        imgView.kf.setImage(with: url)*/
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "WasherProfileViewController") as! WasherProfileViewController
        
        let item = list[indexPath.row]
        detailsVC.washerItem = item
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }

    func setMyLocation(latitude:CLLocationDegrees, longitude:CLLocationDegrees){
        myLatitude = latitude
        myLongitude = longitude
        self.tableView.reloadData()
    }
    
    func getDistanceInMeters(coordinate0:CLLocation, coordinate1:CLLocation) -> Int{
        let distanceInMeters = coordinate0.distance(from: coordinate1) // result is in meters
        return Int(distanceInMeters)
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
