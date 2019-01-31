//
//  CreateAccountViewController.swift
//  Carwash
//
//  Created by Bluecore on 29/08/18.
//

import UIKit
import SkyFloatingLabelTextField
import ActionSheetPicker_3_0
import LGButton
/*
 Controller CreateAccount - Responsável pela criação de usuários
 */
class CreateAccountViewController: UIViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView:UITableView!
    var requestUser : RequestRegisterUser!
    
    @IBOutlet weak var loadingView:UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        requestUser = RequestRegisterUser()
        requestUser.RoleId = 0
        requestUser.Email = ""
        requestUser.Name = ""
        requestUser.Password = ""
        requestUser.Document = ""
        requestUser.BirthDate = ""
        requestUser.Cep = ""
        requestUser.Address = ""
        requestUser.AddressNumber = 0
        requestUser.Complement = ""
        requestUser.District = ""
        requestUser.City = ""
        requestUser.State = ""
        requestUser.PhoneNumber = ""
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 63
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell!
        
        if indexPath.row == 0{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellCombo")
            
            let imgView = cell?.viewWithTag(1) as! UIImageView
            let editText = cell?.viewWithTag(2) as! SkyFloatingLabelTextField
            
            imgView.image = UIImage(named: "account-arrow-left-outline")
            editText.placeholder = "Perfil"
            editText.selectedTitle = "Perfil"
            editText.title = "Perfil"
            editText.isSecureTextEntry = false
            editText.titleLabel.tag = indexPath.row;
            editText.delegate =  self
            editText.isUserInteractionEnabled = false
            if(requestUser.RoleId == 1){
                editText.text = "Cliente"
            }
            else if(requestUser.RoleId == 2){
                editText.text = "Lavador"
            }
            else if(requestUser.RoleId == 3){
                editText.text = "Lava rápido"
            }
            else{
                editText.text = "Selecione um Perfil"
            }
        }
        else if indexPath.row == 1{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellText")
            let imgView = cell?.viewWithTag(1) as! UIImageView
            let editText = cell?.viewWithTag(2) as! SkyFloatingLabelTextField
            
            imgView.image = UIImage(named: "account-circle-outline")
            editText.placeholder = "Nome"
            editText.selectedTitle = "Nome"
            editText.title = "Nome"

            editText.isSecureTextEntry = false
            editText.keyboardType = UIKeyboardType.namePhonePad
            editText.delegate = self
            editText.titleLabel.tag = indexPath.row;
            editText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            if requestUser.Name != nil{
                editText.text = requestUser.Name
            }
        }
        else if indexPath.row == 2{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellText")
            let imgView = cell?.viewWithTag(1) as! UIImageView
            let editText = cell?.viewWithTag(2) as! SkyFloatingLabelTextField
            
            imgView.image = UIImage(named: "email-outline")
            editText.placeholder = "E-mail"
            editText.selectedTitle = "E-mail"
            editText.title = "E-mail"
    
            editText.isSecureTextEntry = false
            editText.keyboardType = UIKeyboardType.emailAddress
            editText.delegate = self
            editText.titleLabel.tag = indexPath.row;
            editText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            if requestUser.Email != nil{
                editText.text = requestUser.Email
            }
        }
        else if indexPath.row == 3{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellText")
            let imgView = cell?.viewWithTag(1) as! UIImageView
            let editText = cell?.viewWithTag(2) as! SkyFloatingLabelTextField
            
            imgView.image = UIImage(named: "lock")
            editText.placeholder = "Senha"
            editText.selectedTitle = "Senha"
            editText.title = "Senha"
            
            editText.isSecureTextEntry = true
            editText.keyboardType = UIKeyboardType.default
            editText.delegate = self
            editText.titleLabel.tag = indexPath.row;
            editText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            if requestUser.Password != nil{
                editText.text = requestUser.Password
            }
        }
        else if indexPath.row == 4{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellText")
            let imgView = cell?.viewWithTag(1) as! UIImageView
            let editText = cell?.viewWithTag(2) as! SkyFloatingLabelTextField
            
            imgView.image = UIImage(named: "account-card-details")
            editText.placeholder = "Documento"
            editText.selectedTitle = "Documento"
            editText.title = "Documento"

            editText.isSecureTextEntry = false
            editText.keyboardType = UIKeyboardType.namePhonePad
            editText.delegate = self
            editText.titleLabel.tag = indexPath.row;
            editText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            if requestUser.Document != nil{
                editText.text = requestUser.Document
            }
        }
        else if indexPath.row == 5{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellCombo")
            let imgView = cell?.viewWithTag(1) as! UIImageView
            let editText = cell?.viewWithTag(2) as! SkyFloatingLabelTextField
            
            imgView.image = UIImage(named: "cake-variant")
            editText.placeholder = "Data Nascimento"
            editText.selectedTitle = "Data Nascimento"
            editText.title = "Data Nascimento"
            editText.isSecureTextEntry = false
            editText.delegate = self
            editText.isUserInteractionEnabled = false
            editText.titleLabel.tag = indexPath.row;
            editText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            if requestUser.BirthDate != nil{
                if(requestUser.BirthDate != ""){
                    editText.text = Utils.formatDate(inputDate: requestUser.BirthDate ?? "", inputFormat: "yyyy-MM-dd", endFormat: "dd/MM/yyyy")
                }
            }
        }
        else if indexPath.row == 6{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellText")
            let imgView = cell?.viewWithTag(1) as! UIImageView
            let editText = cell?.viewWithTag(2) as! SkyFloatingLabelTextField
            
            imgView.image = UIImage(named: "map-marker")
            editText.placeholder = "Cep"
            editText.selectedTitle = "Cep"
            editText.title = "Cep"

            editText.isSecureTextEntry = false
            editText.keyboardType = UIKeyboardType.numberPad
            editText.delegate = self
            editText.titleLabel.tag = indexPath.row;
            editText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            if requestUser.Cep != nil{
                editText.text = requestUser.Cep
            }
        }
        else if indexPath.row == 7{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellText")
            let imgView = cell?.viewWithTag(1) as! UIImageView
            let editText = cell?.viewWithTag(2) as! SkyFloatingLabelTextField
            
            imgView.image = UIImage(named: "map-marker")
            editText.placeholder = "Endereço"
            editText.selectedTitle = "Endereço"
            editText.title = "Endereço"

            editText.isSecureTextEntry = false
            editText.keyboardType = UIKeyboardType.namePhonePad
            editText.delegate = self
            editText.titleLabel.tag = indexPath.row;
            editText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            if requestUser.Address != nil{
                editText.text = requestUser.Address
            }
        }
        else if indexPath.row == 8{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellText")
            let imgView = cell?.viewWithTag(1) as! UIImageView
            let editText = cell?.viewWithTag(2) as! SkyFloatingLabelTextField
            
            imgView.image = UIImage(named: "map-marker")
            editText.placeholder = "Número"
            editText.selectedTitle = "Número"
            editText.title = "Número"

            editText.isSecureTextEntry = false
            editText.keyboardType = UIKeyboardType.numberPad
            editText.delegate = self
            editText.titleLabel.tag = indexPath.row;
            editText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            if requestUser.AddressNumber != 0{
                editText.text = String(requestUser.AddressNumber)
            }
        }
        else if indexPath.row == 9{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellText")
            let imgView = cell?.viewWithTag(1) as! UIImageView
            let editText = cell?.viewWithTag(2) as! SkyFloatingLabelTextField
            
            imgView.image = UIImage(named: "map-marker")
            editText.placeholder = "Complemento"
            editText.selectedTitle = "Complemento"
            editText.title = "Complemento"

            editText.isSecureTextEntry = false
            editText.keyboardType = UIKeyboardType.namePhonePad
            editText.delegate = self
            editText.titleLabel.tag = indexPath.row;
            editText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            if requestUser.Complement != nil{
                editText.text = requestUser.Complement
            }
        }
        else if indexPath.row == 10{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellText")
            let imgView = cell?.viewWithTag(1) as! UIImageView
            let editText = cell?.viewWithTag(2) as! SkyFloatingLabelTextField
            
            imgView.image = UIImage(named: "map-marker")
            editText.placeholder = "Bairro"
            editText.selectedTitle = "Bairro"
            editText.title = "Bairro"
      
            editText.isSecureTextEntry = false
            editText.keyboardType = UIKeyboardType.namePhonePad
            editText.delegate = self
            editText.titleLabel.tag = indexPath.row;
            editText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            if requestUser.District != nil{
                editText.text = requestUser.District
            }
        }
        else if indexPath.row == 11{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellText")
            let imgView = cell?.viewWithTag(1) as! UIImageView
            let editText = cell?.viewWithTag(2) as! SkyFloatingLabelTextField
            
            imgView.image = UIImage(named: "city")
            editText.placeholder = "Cidade"
            editText.selectedTitle = "Cidade"
            editText.title = "Cidade"
    
            editText.isSecureTextEntry = false
            editText.keyboardType = UIKeyboardType.namePhonePad
            editText.delegate = self
            editText.titleLabel.tag = indexPath.row;
            editText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            if requestUser.City != nil{
                editText.text = requestUser.City
            }
        }
        else if indexPath.row == 12{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellCombo")
            let imgView = cell?.viewWithTag(1) as! UIImageView
            let editText = cell?.viewWithTag(2) as! SkyFloatingLabelTextField
            
            imgView.image = UIImage(named: "map-marker")
            editText.placeholder = "Estado"
            editText.selectedTitle = "Estado"
            editText.title = "Estado"
            editText.isSecureTextEntry = false
            editText.text = "Selecione um Estado"
            editText.delegate =  self
            editText.isUserInteractionEnabled = false
            if requestUser.State != nil{
                if requestUser.State != ""{
                    editText.text = requestUser.State
                }
            }
        }
        else if indexPath.row == 13{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellText")
            let imgView = cell?.viewWithTag(1) as! UIImageView
            let editText = cell?.viewWithTag(2) as! SkyFloatingLabelTextField
            
            imgView.image = UIImage(named: "cellphone-iphone")
            editText.placeholder = "Celular"
            editText.selectedTitle = "Celular"
            editText.title = "Celular"

            editText.isSecureTextEntry = false
            editText.keyboardType = UIKeyboardType.numberPad
            editText.delegate = self
            editText.titleLabel.tag = indexPath.row;
            editText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            if requestUser.PhoneNumber != nil{
                editText.text = requestUser.PhoneNumber
            }
        }
        else if indexPath.row == 14{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellRegister")
            
            let buttonRegister = cell.viewWithTag(1) as! LGButton
            loadingView = (cell.viewWithTag(2) as! UIActivityIndicatorView)
            loadingView.isHidden = true
            buttonRegister.addTarget(self,action:#selector(buttonClicked),
                                     for:.touchUpInside)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
            //role
            ActionSheetStringPicker.show(withTitle: "Perfil:", rows: ["Cliente", "Lavador", "Lava-rápido"], initialSelection: 0, doneBlock: {
                picker, value, index in
                
                self.requestUser.RoleId = value + 1
                let indexPath = NSIndexPath(row: 0, section: 0)
                tableView.reloadRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.top)
                //print("value = \(value)")
                //print("index = \(index)")
                //print("picker = \(picker)")
     
            }, cancel: { ActionStringCancelBlock in return }, origin: tableView)
        }
        else if indexPath.row == 5{
            //birthday
            let datePicker = ActionSheetDatePicker(title: "Data Nascimento:", datePickerMode: UIDatePicker.Mode.date, selectedDate: Date(), doneBlock: {
                picker, value, index in
                
                self.requestUser.BirthDate = Utils.dateToString(inputDate: value as! Date, endFormat: "yyyy-MM-dd")
                let indexPath = NSIndexPath(row: 5, section: 0)
                tableView.reloadRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.top)
                //print("value = \(value)")
                //print("index = \(index)")
                //print("picker = \(picker)")
                
            }, cancel: { ActionStringCancelBlock in return }, origin: tableView)
            let secondsInWeek: TimeInterval = 7 * 24 * 60 * 60;
            datePicker?.minimumDate = Date(timeInterval: -secondsInWeek, since: Date())
            datePicker?.maximumDate = Date(timeInterval: secondsInWeek, since: Date())
            
            datePicker?.show()
        }
        else if indexPath.row == 12{
            //state
            ActionSheetStringPicker.show(withTitle: "Estado:", rows: ["AC", "AL", "AP","AM","BA","CE","DF","ES","GO","MA","MT","MS","MG","PA","PB","PR","PE","PI","RJ","RN","RS","RO","RR","SC","SP","SE","TO"], initialSelection: 0, doneBlock: {
                picker, value, index in
                
                self.requestUser.State = (index as! String)
                let indexPath = NSIndexPath(row: 12, section: 0)
                tableView.reloadRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.top)
                //print("value = \(value)")
                //print("index = \(index)")
                //print("picker = \(picker)")
                
            }, cancel: { ActionStringCancelBlock in return }, origin: tableView)
        }
    }
    
    @IBAction func back(){
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let field = textField as! SkyFloatingLabelTextField
        if field.titleLabel.tag == 0 || field.titleLabel.tag == 5 || field.titleLabel.tag == 12{
            return false
        }
        return true
    }
    @objc func textFieldDidChange(_ textField: UITextField) {

        //your code
        let field = textField as! SkyFloatingLabelTextField
        if field.titleLabel.tag == 1{
            requestUser.Name = field.text
        }
        else if field.titleLabel.tag == 2{
            requestUser.Email = field.text
        }
        else if field.titleLabel.tag == 3{
            requestUser.Password = field.text
        }
        else if field.titleLabel.tag == 4{
            requestUser.Document = field.text
        }
        else if field.titleLabel.tag == 6{
            requestUser.Cep = field.text
        }
        else if field.titleLabel.tag == 7{
            requestUser.Address = field.text
        }
        else if field.titleLabel.tag == 8{
            requestUser.AddressNumber = Int(field.text ?? "0")
        }
        else if field.titleLabel.tag == 9{
            requestUser.Complement = field.text
        }
        else if field.titleLabel.tag == 10{
            requestUser.District = field.text
        }
        else if field.titleLabel.tag == 11{
            requestUser.City = field.text
        }
        else if field.titleLabel.tag == 13{
            requestUser.PhoneNumber = field.text
        }
    }
    
    @objc func buttonClicked(sender:LGButton)
    {
        sender.titleString = ""
        loadingView.isHidden = false
        loadingView.startAnimating()
        // Fazer validacoes
        
        let api = RestApi()
        api.registerUser(req: requestUser, onSuccessCallback: { (response) -> (Void) in
            
            self.loadingView.isHidden = true
            sender.titleString = "REGISTRAR"
            
            let alert = UIAlertController(title: "Sucesso", message: response.Result, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }) { (failureMessage) -> (Void) in
            self.loadingView.isHidden = true
            sender.titleString = "REGISTRAR"
            
            let alert = UIAlertController(title: "Erro", message: failureMessage, preferredStyle: UIAlertController.Style.alert)
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

extension UITextField {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        //let onCancel = onCancel ?? (target: self, action: #selector(doneButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            //UIBarButtonItem(title: "Cancelar", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Feito", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()
        
        self.inputAccessoryView = toolbar
    }
    
    // Default actions:
    @objc func doneButtonTapped() { self.resignFirstResponder() }
    //@objc func cancelButtonTapped() { self.resignFirstResponder() }
}
