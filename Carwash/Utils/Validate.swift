//
//  Validate.swift
//  Carwash
//
//  Created by Bluecore on 10/09/18.
//

import UIKit


/// Classe de validação de dados
class Validate: NSObject {

    
    /// Método para validar e-mail
    ///
    /// - Parameter email: e-mail a ser validadod
    /// - Returns: retorna true se e-mail está no formato correto ou false se estiver incorreto.
    static func validateEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}
