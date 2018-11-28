//
//  UserSession.swift
//  Carwash
//
//  Created by Bluecore on 12/09/18.
//

import UIKit

/// Model Sessão Usuario conectado
class UserSession {

    static let sharedInstance: UserSession = { UserSession() }()
    
    var resultLogin:ResultLogin!
}
