//
//  Tab2MySchedulesViewController.swift
//  Carwash
//
//  Created by Bluecore on 29/08/18.
//

import UIKit
import PopupDialog

/*
 Controller Tab2 - Responsável pelo gerenciamento das solicitações feitas pelos usuários
 */
class Tab2MySchedulesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var viewLoading:UIView!
    @IBOutlet weak var spinnerLoading:UIActivityIndicatorView!
    
    @IBOutlet weak var tableView:UITableView!
    
    var listOrders:[ResponseItemOrder] = []
    
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
        tableView.estimatedRowHeight = 60
        tableView.delegate = self
        tableView.dataSource = self

        fillData()
    }

    @IBAction func fillData(){
    
        showLoading()
        // Chamar metodo listagem de pedidos por usuario
        let api = RestApi()
        
        api.listOrderByUser(token: UserSession.sharedInstance.resultLogin.Token, onSuccessCallback: { (response) -> (Void) in
            
            self.stopLoading()
            
            self.listOrders = response.Result!.reversed()
            self.tableView.reloadData()
            
        }) { (errorMessage) -> (Void) in
            
            self.stopLoading()
            
            let alert = UIAlertController(title: "", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOrders.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellOrder")!
        
        let imgView = cell.viewWithTag(1) as! UIImageView
        let labelStatus = cell.viewWithTag(2) as! UILabel
        let labelSchedule = cell.viewWithTag(3) as! UILabel
        let button_accept = cell.viewWithTag(11) as! UIButton
        let button_reject = cell.viewWithTag(10) as! UIButton
        let button_evaluate = cell.viewWithTag(102) as! UIButton
        
        let labelClient = cell.viewWithTag(6) as! UILabel
        let labelWasher = cell.viewWithTag(7) as! UILabel
        let labelYourEvaluation = cell.viewWithTag(8) as! UILabel
        let rating = cell.viewWithTag(9) as! CosmosView
        
        button_accept.titleLabel?.tag = indexPath.row
        button_reject.titleLabel?.tag = indexPath.row
        button_evaluate.titleLabel?.tag = indexPath.row
        
        button_accept.addTarget(self, action: #selector(acceptOrder(sender:)), for: UIControl.Event.touchUpInside)
        button_reject.addTarget(self, action: #selector(rejectOrder(sender:)), for: UIControl.Event.touchUpInside)
        button_evaluate.addTarget(self, action: #selector(evaluate(sender:)), for: UIControl.Event.touchUpInside)
        
        labelStatus.text = ""
        labelSchedule.text = ""
        
        labelClient.text = ""
        labelWasher.text = ""
        
        labelYourEvaluation.isHidden = true
        rating.settings.updateOnTouch = false
        rating.isHidden = true
        
        let item = listOrders[indexPath.row]
        
        if item.UserName != nil{
            labelClient.text = "Cliente: " + item.UserName!
        }
        if item.WasherName != nil{
            labelWasher.text = "Lavador:" + item.WasherName!
        }
        
        // Esconder Aceitar/reijeitar
        button_accept.isHidden = true
        button_reject.isHidden = true
        button_evaluate.isHidden = true
        
        if item.Status == 1{
            // iniciado
           
            if UserSession.sharedInstance.resultLogin.RoleId == 1{
                labelStatus.text = "Reserva enviada"
                imgView.image = UIImage(named: "calendar-clock-blue")
                if item.ScheduledDateTime != nil{
                    labelSchedule.text = Utils.formatDate(inputDate: item.ScheduledDateTime!, inputFormat: "yyyy-MM-dd'T'HH:mm:ss", endFormat: "dd/MM/yyyy HH:mm:ss")
                }
            }
            else{
                // Mostrar aceitar Rejeitar
                button_accept.isHidden = false
                button_reject.isHidden = false
                
                labelStatus.text = "Reserva recebida"
                imgView.image = UIImage(named: "calendar-clock-blue")
                if item.ScheduledDateTime != nil{
                    labelSchedule.text = Utils.formatDate(inputDate: item.ScheduledDateTime!, inputFormat: "yyyy-MM-dd'T'HH:mm:ss", endFormat: "dd/MM/yyyy HH:mm:ss")
                }
            }
        }
        else if item.Status == 2{
            //cancelado
            labelStatus.text = "Lavagem cancelada"
            imgView.image = UIImage(named: "close")
            if item.ScheduledDateTime != nil{
                labelSchedule.text = Utils.formatDate(inputDate: item.ScheduledDateTime!, inputFormat: "yyyy-MM-dd'T'HH:mm:ss", endFormat: "dd/MM/yyyy HH:mm:ss")
            }
        }
        else if item.Status == 3{
            //negado
            labelStatus.text = "Sua reserva foi recusada"
            imgView.image = UIImage(named: "alert")
            if item.ScheduledDateTime != nil{
                labelSchedule.text = Utils.formatDate(inputDate: item.ScheduledDateTime!, inputFormat: "yyyy-MM-dd'T'HH:mm:ss", endFormat: "dd/MM/yyyy HH:mm:ss")
            }
        }
        else if item.Status == 4{
            //aceito
            labelStatus.text = "Reserva confirmada"
            imgView.image = UIImage(named: "calendar-check-green")
            if item.ScheduledDateTime != nil{
                labelSchedule.text = Utils.formatDate(inputDate: item.ScheduledDateTime!, inputFormat: "yyyy-MM-dd'T'HH:mm:ss", endFormat: "dd/MM/yyyy HH:mm:ss")
            }
            
            if item.Evaluation != nil{
                labelYourEvaluation.isHidden = false
                rating.settings.updateOnTouch = false
                rating.isHidden = false
                rating.rating = Double(item.Evaluation!)
            }
            else{
                button_evaluate.isHidden = false
            }
        }
        else if item.Status == 5{
            // finalizado
            labelStatus.text = "Lavagem concluída"
            imgView.image = UIImage(named: "")
            if item.ScheduledDateTime != nil{
                labelSchedule.text = Utils.formatDate(inputDate: item.ScheduledDateTime!, inputFormat: "yyyy-MM-dd'T'HH:mm:ss", endFormat: "dd/MM/yyyy HH:mm:ss")
            }
        }
        
        
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func acceptOrder(sender:UIButton){
        showLoading()
        let item = listOrders[(sender.titleLabel?.tag)!]
        
        let api = RestApi()
        api.acceptOrder(token: UserSession.sharedInstance.resultLogin.Token, orderID: item.OrderId, onSuccessCallback: { (response) -> (Void) in
            
            self.stopLoading()
            
            self.fillData()
            
        }) { (errorMessage) -> (Void) in
            self.stopLoading()
            let alert = UIAlertController(title: "", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func rejectOrder(sender:UIButton){
        showLoading()
        let item = listOrders[(sender.titleLabel?.tag)!]
        
        let api = RestApi()
        api.rejectOrder(token: UserSession.sharedInstance.resultLogin.Token, orderID: item.OrderId, onSuccessCallback: { (response) -> (Void) in
            
            self.stopLoading()
            
            self.fillData()
        }) { (errorMessage) -> (Void) in
            self.stopLoading()
            let alert = UIAlertController(title: "", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    @objc func evaluate(sender:UIButton){
        let item = listOrders[(sender.titleLabel?.tag)!]
        
        // Create a custom view controller
        let ratingVC = RatingViewController(nibName: "RatingViewController", bundle: nil)

        
        // Create the dialog
        let popup = PopupDialog(viewController: ratingVC,
                                buttonAlignment: .horizontal,
                                transitionStyle: .bounceDown,
                                tapGestureDismissal: true,
                                panGestureDismissal: false)
        
        // Create first button
        let buttonOne = CancelButton(title: "CANCELAR", height: 60) {
            
        }
        
        // Create second button
        let buttonTwo = DefaultButton(title: "AVALIAR", height: 60) {
            //ratingVC.cosmosStarRating.rating
            self.showLoading()
           
            let api = RestApi()
            let request = RequestEvaluate()
            request.Score = String(Int(ratingVC.cosmosStarRating.rating))
            request.UserIdFrom = String(UserSession.sharedInstance.resultLogin.Id)
            if UserSession.sharedInstance.resultLogin.RoleId == 1{
                request.UserIdTo = String(item.WasherId)
            }
            else{
                request.UserIdTo = String(item.UserId)
            }
            request.Token = UserSession.sharedInstance.resultLogin.Token
            request.OrderedId = item.OrderId
            
            api.evaluateUser(req: request, onSuccessCallback: { (response) -> (Void) in
                
                self.stopLoading()
                
                let alert = UIAlertController(title: "Sucesso", message: response.Result, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                self.fillData()
            }, onFailureCallback: { (errorMessage) -> (Void) in
                
                self.stopLoading()
                
                let alert = UIAlertController(title: "", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            })
        }
        
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo])
        
        // Present dialog
        present(popup, animated: true, completion: nil)
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
