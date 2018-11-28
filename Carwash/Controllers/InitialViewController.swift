//
//  InitialViewController.swift
//  Carwash
//
//  Created by Bluecore on 29/08/18.
//

import UIKit

/*
 Controller Initial - Responsável pelo gerenciamento do tipo de login que será utilizado pelo usuário.
 */
class InitialViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func loginScreen(){
         performSegue(withIdentifier: "segueLoginViewController", sender: nil)
    }
    
    @IBAction func createAccount(){
        performSegue(withIdentifier: "segueCreateAccountViewController", sender: nil)
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
