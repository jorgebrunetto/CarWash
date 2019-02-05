//
//  ResponseItemOrder.swift
//  Carwash
//
//  Created by Bluecore on 18/10/18.
//

import UIKit
import ObjectMapper

/// Mappable Model ResponseItemOrder da API
class ResponseItemOrder: Mappable {

    var OrderId:Int
    var Created:String?
    var ScheduledDateTime:String?
    var TotalPrice:Int
    var Status:Int
    var UserId:Int
    var UserName:String?
    var WasherId:Int
    var WasherName:String?
    var Items: [ResponseItemOrderItem]?
    var WasherScoreAverage:Double?
    var UserScoreAverage:Double?
    var Evaluation:Int?
    
    required init?(map: Map) {
        
        OrderId = try! map.value("OrderId")
        Created = try? map.value("Created")
        ScheduledDateTime = try? map.value("ScheduledDateTime")
        TotalPrice = try! map.value("TotalPrice")
        Status = try! map.value("Status")
        UserId = try! map.value("UserId")
        UserName = try? map.value("UserName")
        WasherId = try! map.value("WasherId")
        Items = try? map.value("Items")
        WasherName = try? map.value("WasherName")
        WasherScoreAverage = try? map.value("WasherScoreAverage")
        UserScoreAverage = try? map.value("UserScoreAverage")
        Evaluation = try? map.value("Evaluation")
    }
    
    func mapping(map: Map) {
        OrderId <- map["OrderId"]
        Created <- map["Created"]
        ScheduledDateTime <- map["ScheduledDateTime"]
        Status <- map["Status"]
        UserId <- map["UserId"]
        UserName <- map["UserName"]
        WasherId <- map["WasherId"]
        Items <- map["Items"]
        WasherName <- map["WasherName"]
        WasherScoreAverage <- map["WasherScoreAverage"]
        UserScoreAverage <- map["UserScoreAverage"]
        Evaluation <- map["Evaluation"]
    }
}
