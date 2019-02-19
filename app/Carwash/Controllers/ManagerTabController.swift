//
//  ManagerTabController.swift
//  Carwash
//
//  Created by Bluecore on 29/01/19.
//

import UIKit

class ManagerTabController: UITabBarController {

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        if appDelegate.addedService{
            self.selectedIndex = 1
            appDelegate.addedService = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let RoleId = UserSession.sharedInstance.resultLogin.RoleId
        if RoleId == 1{
            //Cliente
            let tab1 = self.storyboard?.instantiateViewController(withIdentifier: "Tab1MapViewController") as! Tab1MapViewController
            
            let tab2 = self.storyboard?.instantiateViewController(withIdentifier: "Tab2MySchedulesViewController") as! Tab2MySchedulesViewController
            
            let tab3 = self.storyboard?.instantiateViewController(withIdentifier: "Tab5ProfileViewController") as! Tab5ProfileViewController
            
            viewControllers = [tab1,tab2,tab3]
        }
        else{
            // Lavador ou Lava-rápido
            let tab2 = self.storyboard?.instantiateViewController(withIdentifier: "Tab2MySchedulesViewController") as! Tab2MySchedulesViewController
            
            let tab3 = self.storyboard?.instantiateViewController(withIdentifier: "Tab5ProfileViewController") as! Tab5ProfileViewController
            
            viewControllers = [tab2,tab3]
        }
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
