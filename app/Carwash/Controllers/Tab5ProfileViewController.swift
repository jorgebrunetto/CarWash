//
//  Tab5ProfileViewController.swift
//  Carwash
//
//  Created by Bluecore on 29/08/18.
//

import UIKit
import ActionSheetPicker_3_0

/*
 Controller Tab5 - Responsável pelo gerenciamento do perfil do usuário conectado
 */
class Tab5ProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var labelTotalEvaluations:UILabel!
    @IBOutlet weak var labelTotalWashes:UILabel!
    @IBOutlet weak var imgView:UIImageView!
    
    var NUMBER_SECTIONS = 0
    var NUMBER_ROWS = 0
    var NUMBER_SERVICES = 0
    
    var availableServices:[ResponseItemService]!
    var myServices:[ResponseItemService]!
    
    @IBOutlet weak var viewLoading:UIView!
    @IBOutlet weak var spinnerLoading:UIActivityIndicatorView!
    
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
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate =  self
        tableView.dataSource = self
        
        imgView.layer.cornerRadius = 0.5 * 90;
        labelTotalWashes.text = "0"
        labelTotalEvaluations.text = "0"
        
        if UserSession.sharedInstance.resultLogin.RoleId == 1{
            // Cliente
            NUMBER_SECTIONS = 2
            NUMBER_ROWS = 1
            tableView.reloadData()
        }
        else{
            // Lavador/lava-rapido
            //get service list
            let api = RestApi()
            api.listAllServices(token: UserSession.sharedInstance.resultLogin.Token, onSuccessCallback: { (response) -> (Void) in
                
                self.availableServices = response
                
                api.listServicesByWasher(token: UserSession.sharedInstance.resultLogin.Token, washerID:
                    
                    UserSession.sharedInstance.resultLogin.Id, onSuccessCallback: { (myResponse) -> (Void) in
                    
                        self.NUMBER_SECTIONS = 4
                        self.NUMBER_ROWS = 1
                        if myResponse.Result == nil{
                            self.myServices = [ResponseItemService]()
                        }
                        else{
                            self.myServices = myResponse.Result
                        }
                        self.NUMBER_SERVICES = self.myServices.count
                        self.tableView.reloadData()
                }, onFailureCallback: { (errorMessage) -> (Void) in

                    let alert = UIAlertController(title: "Erro", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                })
            }) { (errorMessage) -> (Void) in
                let alert = UIAlertController(title: "Erro", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return NUMBER_SECTIONS
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section < 3{
            return NUMBER_ROWS
        }
        return NUMBER_SERVICES
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell!
        if indexPath.section == 0{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellLogout")
        }
        else if indexPath.section == 1{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellInfos")
            let labelName = cell.viewWithTag(1) as! UILabel
            let labelPhone = cell.viewWithTag(2) as! UILabel
            let labelEmail = cell.viewWithTag(3) as! UILabel
            labelName.text = ""
            labelPhone.text = ""
            labelEmail.text = ""
            
            if UserSession.sharedInstance.resultLogin.Name != nil{
                labelName.text = UserSession.sharedInstance.resultLogin.Name
            }
            if UserSession.sharedInstance.resultLogin.PhoneNumber != nil{
                if UserSession.sharedInstance.resultLogin.PhoneNumber?.count != 11 {
                    labelPhone.text = UserSession.sharedInstance.resultLogin.PhoneNumber
                }
                else{
                    // Mask
                    labelPhone.text = UserSession.sharedInstance.resultLogin.PhoneNumber
                }
            }
            labelEmail.text = UserSession.sharedInstance.resultLogin.Email
        }
        else if indexPath.section == 2{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellAddServices")
            let button_add = cell.viewWithTag(1) as! UIButton
            button_add.addTarget(self, action: #selector(newService), for: UIControl.Event.touchUpInside)
        }
        else if indexPath.section == 3{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellService")
            
            let item = myServices[indexPath.row]
            
            let labelServiceName = cell.viewWithTag(1) as! UILabel
            let labelPrize = cell.viewWithTag(2) as! UILabel
            //let bt_changeservice = cell.viewWithTag(3) as! UIButton
            let bt_changeprize = cell.viewWithTag(4) as! UIButton
            //let bt_delete = cell.viewWithTag(5) as! UIButton
            
            bt_changeprize.titleLabel?.tag = indexPath.row
            bt_changeprize.addTarget(self, action: #selector(addSpecificPrize(sender:)), for: UIControl.Event.touchUpInside)
            
            labelServiceName.text = ""
            labelPrize.text = ""
            
            if item.Name != nil{
                labelServiceName.text = item.Name
            }
            if item.SpecificPrice != nil{
                labelPrize.text = String(item.SpecificPrice!) + ",00"
            }
            else{
                labelPrize.text = String(item.DefaultPrice) + ",00"
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            UserSession.sharedInstance.resultLogin = nil
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func addSpecificPrize(sender:UIButton){
        
        let index = sender.titleLabel?.tag
        let item = self.myServices[index!]
        
        // open popup com caixa texto numerica
    }
    @objc func newService(){
        // pegar os itens service disponiveis e mostrar apenas os que ainda nao foram vinculados
        if availableServices != nil{
            if availableServices.count > 0{
                var list = [Int]()
                for i in myServices{
                    var index = 0
                    for av in availableServices{
                        if i.ServiceId == av.Id{
                            list.append(i.ServiceId)
                            break
                        }
                        index = index + 1
                    }
                }
                var temp = [ResponseItemService]()
                
                for av in availableServices{
                    var canAdd = true
                    for ix in list{
                        if av.Id == ix{
                            canAdd = false
                            break
                        }
                    }
                    if canAdd{
                        temp.append(av)
                    }
                }
                if temp.count > 0{
                    // ok - show picker
                    var mItems = [String]()
                    for i in temp{
                        mItems.append(i.Name)
                    }
                    ActionSheetStringPicker.show(withTitle: "Serviço:", rows: mItems, initialSelection: 0, doneBlock: {
                        picker, value, index in
                        
                        // Cadastra servico
                        let api = RestApi()
                        let request = RequestServiceToWasher()
                        request.Token = UserSession.sharedInstance.resultLogin.Token
                        request.ServiceId = temp[value].ServiceId
                        request.SpecificPrice = 0
                        api.addServiceToWasher(req: request, onSuccessCallback: { (response) -> (Void) in
                            
                        }, onFailureCallback: { (messageError) -> (Void) in
                            
                        })
                        // se ok, add na lista
                        self.myServices.append(temp[value])
                        self.NUMBER_SERVICES = self.myServices.count
                        self.tableView.reloadData()
                        
                        //print("value = \(value)")
                        //print("index = \(index)")
                        //print("picker = \(picker)")
                        
                    }, cancel: { ActionStringCancelBlock in return }, origin: tableView)
                }
                else{
                    // no service available
                    let alert = UIAlertController(title: "Erro", message: Messages.CANNOT_ADD_MORE_SERVICES, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
            else{
                // no service available
                let alert = UIAlertController(title: "Erro", message: Messages.CANNOT_ADD_MORE_SERVICES, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        else{
            // no service available
            let alert = UIAlertController(title: "Erro", message: Messages.CANNOT_ADD_MORE_SERVICES, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
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
