//
//  Connectivity.swift
//  Carwash
//
//  Created by Bluecore on 29/01/19.
//

import UIKit
import Alamofire

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
