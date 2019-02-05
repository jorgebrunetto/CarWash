//
//  AddSpecificPrizeViewController.swift
//  Carwash
//
//  Created by Bluecore on 04/02/19.
//

import UIKit
import SkyFloatingLabelTextField

class AddSpecificPrizeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var editSpecificPrize:SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        editSpecificPrize.delegate = self
        
        editSpecificPrize.keyboardType = UIKeyboardType.numberPad
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
