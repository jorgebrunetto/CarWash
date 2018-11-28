//
//  ResponseItemOrderItem.swift
//  Carwash
//
//  Created by Bluecore on 18/10/18.
//

import UIKit
import ObjectMapper

/// Mappable Model ResponseItemOrderItem da API
class ResponseItemOrderItem: Mappable {

    var Id:Int
    var OrderId:Int
    var ServiceId:Int
    var Price:Int
    var ServiceName:String?
    
    required init?(map: Map) {
        Id = try! map.value("Id")
        OrderId = try! map.value("OrderId")
        ServiceId = try! map.value("ServiceId")
        Price = try! map.value("Price")
        ServiceName = try? map.value("ServiceName")
    }
    
    func mapping(map: Map) {
        Id <- map["Id"]
        OrderId <- map["OrderId"]
        ServiceId <- map["ServiceId"]
        Price <- map["Price"]
        ServiceName <- map["ServiceName"]
    }
}
