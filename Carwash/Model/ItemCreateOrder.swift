//
//  ItemCreateOrder.swift
//  Carwash
//
//  Created by Bluecore on 18/10/18.
//

import UIKit
import ObjectMapper

/// Mappable Model ItemCreateOrder da API
class ItemCreateOrder: Mappable {

    var OrderId:Int
    var Message:String?
    
    required init?(map: Map) {
        OrderId = try! map.value("OrderId")
        Message = try? map.value("Message")
    }
    
    func mapping(map: Map) {
        OrderId <- map["OrderId"]
        Message <- map["Message"]
    }
}
