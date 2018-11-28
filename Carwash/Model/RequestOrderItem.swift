//
//  RequestOrderItem.swift
//  Carwash
//
//  Created by Bluecore on 18/10/18.
//

import UIKit
import ObjectMapper

/// Mappable Model RequestOrderItem da API
class RequestOrderItem: Mappable {

    var ServiceId:Int!
    var Price:Double!
    
    required init?(map: Map) {
        ServiceId = try! map.value("ServiceId")
        Price = try! map.value("Price")
    }
    
    func mapping(map: Map) {
        ServiceId <- map["ServiceId"]
        Price <- map["Price"]
    }
    init(){
        
    }
    
}
