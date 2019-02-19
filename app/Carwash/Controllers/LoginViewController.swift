//
//  LoginViewController.swift
//  Carwash
//
//  Created by Bluecore on 29/08/18.
//

import UIKit
import SkyFloatingLabelTextField
import LGButton

/*
 Controller Login: Responsável pelo gerenciamento de Login
 */
class LoginViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var editEmail:SkyFloatingLabelTextField!
    @IBOutlet weak var editPassword:SkyFloatingLabelTextField!
    @IBOutlet weak var loadingView:UIActivityIndicatorView!
    @IBOutlet weak var buttonEnter:LGButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        editPassword.isSecureTextEntry = true
        editEmail.delegate = self
        editPassword.delegate = self
        editEmail.keyboardType = UIKeyboardType.emailAddress
        //editEmail.text = "jorge.brunetto@hotmail.com"
        //editPassword.text = "123456c@"
        
        loadingView.isHidden = true
    }

    @IBAction func didSuccessLogin(){
        editPassword.resignFirstResponder()
        
        if (editEmail.text?.isEmpty)!{
            let alert = UIAlertController(title: "Erro", message: Messages.EMPTY_EMAIL, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if(editPassword.text?.isEmpty)!{
            let alert = UIAlertController(title: "Erro", message: Messages.EMPTY_PASSWORD, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if !Validate.validateEmail(email: editEmail.text!){
            let alert = UIAlertController(title: "Erro", message: Messages.INVALID_EMAIL, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
        
            loadingView.isHidden = false
            loadingView.startAnimating()
            buttonEnter.titleString = ""
            
            let api = RestApi()
            let request = RequestLogin()
            request.Email = editEmail.text
            request.Password = editPassword.text
            
            if !Connectivity.isConnectedToInternet() {
                self.loadingView.isHidden = true
                self.loadingView.stopAnimating()
                self.buttonEnter.titleString = "ENTRAR"
                let alert = UIAlertController(title: "Erro", message: Messages.NO_INTERNET_CONNECTION, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else{
                api.apiLogin(req: request, onSuccessCallback: { (resultSuccess) -> (Void) in
                    self.loadingView.isHidden = true
                    self.loadingView.stopAnimating()
                    self.buttonEnter.titleString = "ENTRAR"
                    
                    // salvar dados de retorno
                    UserSession.sharedInstance.resultLogin = resultSuccess.resultOk!
                    self.performSegue(withIdentifier: "segueTab", sender: nil)
                }) { (resultFailure) -> (Void) in
                    
                    self.loadingView.isHidden = true
                    self.loadingView.stopAnimating()
                    self.buttonEnter.titleString = "ENTRAR"
                    
                    let alert = UIAlertController(title: "Erro", message: resultFailure, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    @IBAction func forgotPassword(){
        performSegue(withIdentifier: "segueForgotPasswordViewController", sender: nil)
    }
    @IBAction func registerScreen(){
        performSegue(withIdentifier: "segueRegister", sender: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func back(){
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    private func textFieldShouldClear(textField: UITextField) -> Bool // called when 'return' key pressed. return false to ignore.
    {
        textField.resignFirstResponder()
        return true
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
