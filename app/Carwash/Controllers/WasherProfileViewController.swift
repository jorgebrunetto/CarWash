//
//  WasherProfileViewController.swift
//  Carwash
//
//  Created by Bluecore on 25/10/18.
//

import UIKit
import Kingfisher

/*
    Controller WasherProfile - Responsável pelo gerenciamento do perfil do lavador selecionado
 */
class WasherProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var washerItem:ResponseWashers!
    var availableServices:[ResponseItemService]?
    
    @IBOutlet weak var labelTotalWashs:UILabel!
    @IBOutlet weak var labelScore:UILabel!
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var imgView:UIImageView!
    
    @IBOutlet weak var viewLoading:UIView!
    @IBOutlet weak var spinnerLoading:UIActivityIndicatorView!
    
    @IBOutlet weak var navigationBar:UINavigationBar!
    
    
    @IBAction func back(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func scheduleWash(){
    
        if availableServices == nil {
            let alert = UIAlertController(title: "", message: Messages.NOT_AVAILABLE_SERVICES, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if availableServices?.count == 0{
            let alert = UIAlertController(title: "", message: Messages.NOT_AVAILABLE_SERVICES, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "ScheduleServiceViewController") as! ScheduleServiceViewController
            detailsVC.washerItem = washerItem
            detailsVC.availableServices = availableServices
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
    
    func showLoading(){
        viewLoading.isHidden = false
        spinnerLoading.startAnimating()
    }
    func stopLoading(){
        viewLoading.isHidden = true
        spinnerLoading.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        availableServices = [ResponseItemService]()
        imgView.layer.cornerRadius = 0.5 * 90;
        
        if washerItem.Name != nil{
            navigationBar.topItem?.title = washerItem.Name
        }
        let name = washerItem.Name?.replacingOccurrences(of: " ", with: "+")
        let url = URL(string: "https://ui-avatars.com/api/?rounded=true&font-size=0.33&name=\(name ?? "")")
        
        imgView.kf.setImage(with: url)

        
        labelScore.text = "5"
        labelTotalWashs.text = "0"
        
        if washerItem.ScoreAverage != nil{
            labelScore.text = String(Int(washerItem.ScoreAverage!))
        }
        
        if washerItem.OrderAmount != nil{
            labelTotalWashs.text = String(washerItem.OrderAmount!)
        }
        
        tableView.backgroundColor = UIColor.white
        imgView.clipsToBounds = true
        tableView.delegate = self
        tableView.dataSource = self
        
        showLoading()
        let api = RestApi()
        api.listServicesByWasher(token: UserSession.sharedInstance.resultLogin.Token, washerID: washerItem.Id, onSuccessCallback: { (response) -> (Void) in
            self.stopLoading()
            
            self.availableServices = response.Result
            self.tableView.reloadData()
        }) { (messageError) -> (Void) in
            self.stopLoading()
            
            let alert = UIAlertController(title: "", message: messageError, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        /*api.listAllServices(token: UserSession.sharedInstance.resultLogin.Token, onSuccessCallback: { (response) -> (Void) in
            
            self.stopLoading()
            
            self.availableServices = response
            self.tableView.reloadData()
        }) { (messageError) -> (Void) in
            self.stopLoading()
            
            let alert = UIAlertController(title: "", message: messageError, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }*/
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + availableServices!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellEmpty = tableView.dequeueReusableCell(withIdentifier: "CellEmpty")!
        if  indexPath.row == 0{
            return cellEmpty
        }
        
        let item = availableServices![indexPath.row - 1]
        
        let cellService = tableView.dequeueReusableCell(withIdentifier: "CellService")!
        let labelDescription = cellService.viewWithTag(1) as! UILabel
        let labelPrize = cellService.viewWithTag(2) as! UILabel
        
        labelDescription.text = ""
        labelPrize.text = ""
        
        if item.Name != nil
        {
            labelDescription.text = item.Name
        }
        
        if item.SpecificPrice != nil{
            labelPrize.text = String(format: "R$ %.2f", Double(item.SpecificPrice!)).replacingOccurrences(of: ".", with: ",")
        }
        else{
            labelPrize.text = String(format: "R$ %.2f", Double(item.DefaultPrice)).replacingOccurrences(of: ".", with: ",")
        }
        return cellService
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
