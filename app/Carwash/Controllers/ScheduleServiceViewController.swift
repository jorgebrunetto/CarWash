//
//  ScheduleServiceViewController.swift
//  Carwash
//
//  Created by Bluecore on 26/10/18.
//

import UIKit
import ActionSheetPicker_3_0

/*
 Controller ScheuleService - Responsável pelo gerenciamento da escolha dos serviços do lavador
 que o cliente seleciona.
 */
class ScheduleServiceViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var washerItem:ResponseWashers!
    var availableServices:[ResponseItemService]?
    
    var request:RequestCreateOrder!
    var selectedDate: String = ""
    var selectedHour: String = ""
    var mapSelectedItems:[Int] = []
    
    @IBOutlet weak var viewLoading:UIView!
    @IBOutlet weak var spinnerLoading:UIActivityIndicatorView!
    
    @IBOutlet weak var tableView:UITableView!
    
    func showLoading(){
        viewLoading.isHidden = false
        spinnerLoading.startAnimating()
    }
    func stopLoading(){
        viewLoading.isHidden = true
        spinnerLoading.stopAnimating()
    }
    
    @IBAction func back(){
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func executeOrder(){
        if !hasSelectedOneMoreServices(){
            let alert = UIAlertController(title: "", message: Messages.SELECT_ONE_ITEM, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if selectedDate == ""{
            let alert = UIAlertController(title: "", message: Messages.SELECT_ONE_DATE, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if selectedHour == ""{
            let alert = UIAlertController(title: "", message: Messages.SELECT_ONE_HOUR, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            // Capturar data e hora selecionada formatar (2018-09-12 17:00) e incluir no request
            let dateHour = selectedDate + " " + selectedHour
            let formatter = DateFormatter()
            // initially set the format based on your datepicker date / server String
            formatter.dateFormat = "dd/MM/yyyy HH:mm"
            // convert your string to date
            let date = formatter.date(from: dateHour)
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let scheduleDate = formatter.string(from: date!)
            
            request.ScheduledDateTime = scheduleDate
            
            // Preencher itens de serviço selecionado(s)
            var count = 0
            for i:Int in mapSelectedItems{
                if i == 1{
                    let oi = RequestOrderItem()
                    oi.ServiceId = availableServices![count].Id
                    oi.Price = Double(availableServices![count].DefaultPrice)
                    request.ListItens?.append(oi)
                }
                count = count + 1
            }
            // Preencher preco total
            request.TotalPrice = getTotal()
            
            let api = RestApi()
            api.createOrder(req: request, onSuccessCallback: { (successMessage) -> (Void) in
                let alert = UIAlertController(title: "Sucesso", message: Messages.CREATE_ORDER_SUCCESS, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }) { (errorMessage) -> (Void) in
                let alert = UIAlertController(title: "Erro", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        request = RequestCreateOrder()
        request.Token = UserSession.sharedInstance.resultLogin.Token
        request.ListItens = [RequestOrderItem]()
        request.UserId = UserSession.sharedInstance.resultLogin.Id
        request.WasherId = washerItem.Id
        request.TotalPrice = 0
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.delegate = self
        tableView.dataSource = self
        for _ in availableServices!{
            mapSelectedItems.append(-1)
        }
    }
    

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Serviço"
        }
        else if section == 1{
            return "Total da compra"
        }
        else if section == 2{
            return "Dia do agendamento"
        }
        else if section == 3{
            return "Hora do agendamento"
        }
        return "Dados do cartão de crédito"
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return availableServices!.count
        }
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellService")!
            
            let item = availableServices![indexPath.row]
            
            let imgSelected = cell.viewWithTag(1) as! UIImageView
            let labelDescription = cell.viewWithTag(2) as! UILabel
            let labelPrize = cell.viewWithTag(3) as! UILabel
            
            if mapSelectedItems[indexPath.row] == -1{
                // Unselected
                imgSelected.image = UIImage(named: "circle-outline")
            }
            else{
                // Selected
                imgSelected.image = UIImage(named: "checkbox-marked-circle")
            }
            
            labelDescription.text = ""
            labelPrize.text = ""
            
            if item.Name != nil
            {
                labelDescription.text = item.Name
            }
            
            labelPrize.text = String(format: "R$ %.2f", Double(item.DefaultPrice)).replacingOccurrences(of: ".", with: ",")
            
            return cell
        }
            
        else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellTotal")!
       
            let labelTotal = cell.viewWithTag(1) as! UILabel
            labelTotal.text = "R$ 0,00"
            
            labelTotal.text = String(format: "R$ %.2f", getTotal()).replacingOccurrences(of: ".", with: ",")
            
            return cell
        }
        
        else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellDate")!
            
            let labelDate = cell.viewWithTag(1) as! UILabel
            
            labelDate.text = selectedDate
            return cell
        }
            
        else if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellHour")!
           
            let labelHour = cell.viewWithTag(1) as! UILabel
            
            labelHour.text = selectedHour
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellCard")!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0{
            mapSelectedItems[indexPath.row] = -1 * mapSelectedItems[indexPath.row]
            tableView.reloadData()
        }
        else if indexPath.section == 2{
            // call picker date
            
            let datePicker = ActionSheetDatePicker(title: "Data:", datePickerMode: .date, selectedDate: Date(), doneBlock: {
                picker, value, index in
                
                let d = (value as! NSDate)
                let formatter = DateFormatter()
                // initially set the format based on your datepicker date / server String
                formatter.dateFormat = "dd/MM/yyyy"
            
                let dateFormatted = formatter.string(from: d as Date)
            
                self.selectedDate = dateFormatted
                tableView.reloadData()
                return
            }, cancel: { ActionStringCancelBlock in return }, origin: self.view)
            let secondsInWeek: TimeInterval = 7 * 24 * 60 * 60;
            //datePicker?.minimumDate = Date(timeInterval: -secondsInWeek, since: Date())
            datePicker?.maximumDate = Date(timeInterval: secondsInWeek, since: Date())
            //datePicker?.minuteInterval = 20
            
            datePicker?.show()
        }
        else if indexPath.section == 3{
            // call picker hour
            let datePicker = ActionSheetDatePicker(title: "Hora:", datePickerMode: .time, selectedDate: Date(), doneBlock: {
                picker, value, index in
                
                let d = (value as! NSDate)
                let formatter = DateFormatter()
                // initially set the format based on your datepicker date / server String
                formatter.dateFormat = "HH:mm"
                let dateFormatted = formatter.string(from: d as Date)
                self.selectedHour = dateFormatted
                tableView.reloadData()
                return
            }, cancel: { ActionStringCancelBlock in return }, origin: self.view)
            //let secondsInWeek: TimeInterval = 7 * 24 * 60 * 60;
            //datePicker?.minimumDate = Date(timeInterval: -secondsInWeek, since: Date())
            //datePicker?.maximumDate = Date(timeInterval: secondsInWeek, since: Date())
            //datePicker?.minuteInterval = 20
            
            datePicker?.show()
        }
    }
    
    func hasSelectedOneMoreServices() -> Bool{
        
        for i:Int in mapSelectedItems{
            if i == 1{
                return true
            }
        }
        return false
    }
    func getTotal() -> Double{
        
        var count = 0
        var total:Int = 0
        for i:Int in mapSelectedItems{
            if i == 1{
                total = total + availableServices![count].DefaultPrice
            }
            count = count + 1
        }
        return Double(total)
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
