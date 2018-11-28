//
//  CreateAccountViewController.swift
//  Carwash
//
//  Created by Bluecore on 29/08/18.
//

import UIKit
import SkyFloatingLabelTextField

/*
 Controller CreateAccount - Responsável pela criação de usuários
 */
class CreateAccountViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var editUser:SkyFloatingLabelTextField!
    @IBOutlet weak var editEmail:SkyFloatingLabelTextField!
    @IBOutlet weak var editCel:SkyFloatingLabelTextField!
    @IBOutlet weak var editPassword:SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        editUser.delegate = self
        editEmail.delegate = self
        editCel.delegate = self
        editPassword.delegate = self
        
        editPassword.isSecureTextEntry = true
    }
    
    @IBAction func back(){
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        editEmail.resignFirstResponder()
        editPassword.resignFirstResponder()
        editCel.resignFirstResponder()
        editUser.resignFirstResponder()
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
