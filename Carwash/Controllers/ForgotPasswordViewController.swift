//
//  ForgotPasswordViewController.swift
//  Carwash
//
//  Created by Bluecore on 29/08/18.
//

import UIKit
import SkyFloatingLabelTextField

/*
 Controller ForgotPassword - Responsável pela recuperação de senha
 */
class ForgotPasswordViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var editEmail:SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        editEmail.delegate = self
        
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
