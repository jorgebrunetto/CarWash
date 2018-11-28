//
//  Tab2MySchedulesViewController.swift
//  Carwash
//
//  Created by Bluecore on 29/08/18.
//

import UIKit

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
        tableView.delegate = self
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
            
            self.listOrders = response.Result!
            self.tableView.reloadData()
            
        }) { (messageError) -> (Void) in
            
            self.stopLoading()
            
            let alert = UIAlertController(title: "", message: messageError, preferredStyle: UIAlertController.Style.alert)
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
        
        labelStatus.text = ""
        labelSchedule.text = ""
        let item = listOrders[indexPath.row]
        
        if item.Status == 1{
            // iniciado
            labelStatus.text = "Reserva enviada"
            imgView.image = UIImage(named: "calendar-clock-blue")
            if item.ScheduledDateTime != nil{
                labelSchedule.text = item.ScheduledDateTime
            }
        }
        else if item.Status == 2{
            //cancelado
            labelStatus.text = "Lavagem cancelada"
            imgView.image = UIImage(named: "close")
            if item.ScheduledDateTime != nil{
                labelSchedule.text = item.ScheduledDateTime
            }
        }
        else if item.Status == 3{
            //negado
            labelStatus.text = "Sua reserva foi recusada"
            imgView.image = UIImage(named: "alert")
            if item.ScheduledDateTime != nil{
                labelSchedule.text = item.ScheduledDateTime
            }
        }
        else if item.Status == 4{
            //aceito
            labelStatus.text = "Reserva confirmada"
            imgView.image = UIImage(named: "calendar-check-green")
            if item.ScheduledDateTime != nil{
                labelSchedule.text = item.ScheduledDateTime
            }
        }
        else if item.Status == 5{
            // finalizado
            labelStatus.text = "Lavagem concluída"
            imgView.image = UIImage(named: "")
            if item.ScheduledDateTime != nil{
                labelSchedule.text = item.ScheduledDateTime
            }
        }
        
        
        return cell
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
