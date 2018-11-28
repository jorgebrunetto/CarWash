var entities =
 [{
  "id": 1,
  "typeString": "class",
  "properties": [
    {
  "name": "let CANT_COMPLETE_REQUEST",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let EMPTY_EMAIL",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let EMPTY_PASSWORD",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let INVALID_EMAIL",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let NOT_FOUND_DATA",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let NOT_AVAILABLE_SERVICES",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let SELECT_ONE_ITEM",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let SELECT_ONE_DATE",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let SELECT_ONE_HOUR",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "let CREATE_ORDER_SUCCESS",
  "type": "type",
  "accessLevel": "internal"
}
  ],
  "name": "Messages",
  "superClass": 38
},{
  "id": 2,
  "typeString": "class",
  "methods": [
    {
  "name": "validateEmail(email:String) -> Bool",
  "type": "type",
  "accessLevel": "internal"
}
  ],
  "name": "Validate",
  "superClass": 38
},{
  "id": 3,
  "typeString": "class",
  "methods": [
    {
  "name": "calculateDistanceInMeters(lat0:Double, long0:Double, lat1:Double,long1:Double) -> Double",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "formatDate(inputDate:String, inputFormat:String, endFormat:String) -> String",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "scaleImageAspectRatio(oldWidth:CGFloat,oldHeight:CGFloat, spectedWidth: CGFloat) -> CGFloat!",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "scaleImageAspectRatio(source:UIImage, scaledWidth: CGFloat) -> UIImage!",
  "type": "type",
  "accessLevel": "internal"
}
  ],
  "name": "Utils",
  "superClass": 38
},{
  "id": 4,
  "typeString": "class",
  "properties": [
    {
  "name": "var Status:Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var resultOk: ResultLogin?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var resultFailure: String? required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ResponseLogin",
  "superClass": 39
},{
  "id": 5,
  "typeString": "class",
  "properties": [
    {
  "name": "var Token:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var UserId:Int!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var WasherId:Int!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var TotalPrice:Double!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var ScheduledDateTime:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var ListItens:[RequestOrderItem]? required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "RequestCreateOrder",
  "superClass": 39
},{
  "id": 6,
  "typeString": "class",
  "properties": [
    {
  "name": "var Status:Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var listWashers: [ResponseWashers]?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var error: String? required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ResponseListWashers",
  "superClass": 39
},{
  "id": 7,
  "typeString": "class",
  "properties": [
    {
  "name": "var Token:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var ServiceId:Int!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var SpecificPrice:Double! required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "RequestServiceToWasher",
  "superClass": 39
},{
  "id": 8,
  "typeString": "class",
  "properties": [
    {
  "name": "let sharedInstance: UserSession",
  "type": "type",
  "accessLevel": "internal"
},
    {
  "name": "var resultLogin:ResultLogin!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "UserSession"
},{
  "id": 9,
  "typeString": "class",
  "properties": [
    {
  "name": "var Token: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var OrderedId:Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var UserIdFrom: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var UserIdTo: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Score: String? required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "RequestEvaluate",
  "superClass": 39
},{
  "id": 10,
  "typeString": "class",
  "properties": [
    {
  "name": "var RoleId:Int!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Email:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Name:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Password:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Document:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var BirthDate:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Cep:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Address:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var AddressNumber:Int!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Complement:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var District:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var City:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var State:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var PhoneNumber:String? required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "RequestRegisterUser",
  "superClass": 39
},{
  "id": 11,
  "typeString": "class",
  "properties": [
    {
  "name": "var Status:Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Result: [ResponseItemService]? required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ResponseListServices",
  "superClass": 39
},{
  "id": 12,
  "typeString": "class",
  "properties": [
    {
  "name": "var ServiceId:Int!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Price:Double! required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "RequestOrderItem",
  "superClass": 39
},{
  "id": 13,
  "typeString": "class",
  "properties": [
    {
  "name": "var Id:Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var RoleId: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Name: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Email: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Document:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Inserted:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var BirthDate:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Cep:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Address:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var AddressNumber:Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Complement:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var District:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var City:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var State:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var PhoneNumber:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Latitude:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Longitude:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Active:Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Token:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var ScoreAverage:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var MinPrice:Double required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ResponseWashers",
  "superClass": 39
},{
  "id": 14,
  "typeString": "class",
  "properties": [
    {
  "name": "var Status:Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Result: String? required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ResponseDefault",
  "superClass": 39
},{
  "id": 15,
  "typeString": "class",
  "properties": [
    {
  "name": "var itemWasher: ResponseWashers?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "AnnotationWasher",
  "superClass": 40
},{
  "id": 16,
  "typeString": "class",
  "properties": [
    {
  "name": "var Status:Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Result: [ResponseItemOrder]? required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ResponseListOrderByUser",
  "superClass": 39
},{
  "id": 17,
  "typeString": "class",
  "properties": [
    {
  "name": "var OrderId:Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Created:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var ScheduledDateTime:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var TotalPrice:Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Status:Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var UserId:Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var UserName:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var WasherId:Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var WasherName:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Items: [ResponseItemOrderItem]? required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ResponseItemOrder",
  "superClass": 39
},{
  "id": 18,
  "typeString": "class",
  "properties": [
    {
  "name": "var Id:Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var RoleId: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Name: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Email: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Password: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Document:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Inserted:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var BirthDate:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Cep:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Address:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var AddressNumber:Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Complement:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var District:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var City:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var State:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var PhoneNumber:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Latitude:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Longitude:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Active:Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Token:String required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ResultLogin",
  "superClass": 39
},{
  "id": 19,
  "typeString": "class",
  "properties": [
    {
  "name": "var Id:Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var OrderId:Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var ServiceId:Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Price:Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var ServiceName:String? required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ResponseItemOrderItem",
  "superClass": 39
},{
  "id": 20,
  "typeString": "class",
  "properties": [
    {
  "name": "var Id:Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Name: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var DefaultPrice:Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Active:Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var UserId:Int?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var SpecificPrice:Int? required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ResponseItemService",
  "superClass": 39
},{
  "id": 21,
  "typeString": "class",
  "properties": [
    {
  "name": "var OrderId:Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Message:String? required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ItemCreateOrder",
  "superClass": 39
},{
  "id": 22,
  "typeString": "class",
  "properties": [
    {
  "name": "var Email:String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Password:String? required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "RequestLogin",
  "superClass": 39
},{
  "id": 23,
  "typeString": "class",
  "properties": [
    {
  "name": "var Status:Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Result:ItemCreateOrder? required",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "mapping(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(map: Map)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ResponseCreateOrder",
  "superClass": 39
},{
  "id": 24,
  "typeString": "class",
  "properties": [
    {
  "name": "let baseURL",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "let user",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "let pass",
  "type": "instance",
  "accessLevel": "private"
}
  ],
  "methods": [
    {
  "name": "apiLogin(req:RequestLogin, onSuccessCallback: @escaping (ResponseLogin) -> (Void), onFailureCallback: @escaping (String) -> (Void))",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "registerUser(req:RequestRegisterUser, onSuccessCallback: @escaping (ResponseDefault) -> (Void), onFailureCallback: @escaping (String) -> (Void))",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "listAllServices(token:String, onSuccessCallback: @escaping ([ResponseItemService]) -> (Void), onFailureCallback: @escaping (String) -> (Void))",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "addServiceToWasher(req:RequestServiceToWasher, onSuccessCallback: @escaping (ResponseDefault) -> (Void), onFailureCallback: @escaping (String) -> (Void))",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "evaluateUser(req:RequestEvaluate, onSuccessCallback: @escaping (ResponseDefault) -> (Void), onFailureCallback: @escaping (String) -> (Void))",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "listOrderByUser(token:String, onSuccessCallback: @escaping (ResponseListOrderByUser) -> (Void), onFailureCallback: @escaping (String) -> (Void))",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "apiFindWashersArround(token:String, radius:Int, latitude:String, longitude:String, onSuccessCallback: @escaping (ResponseListWashers) -> (Void), onFailureCallback: @escaping (String) -> (Void))",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "listServicesByWasher(token:String, washerID:Int, onSuccessCallback: @escaping (ResponseListServices) -> (Void), onFailureCallback: @escaping (String) -> (Void))",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "createOrder(req:RequestCreateOrder, onSuccessCallback: @escaping (String) -> (Void), onFailureCallback: @escaping (String) -> (Void))",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "acceptOrder(token:String, orderID:Int, onSuccessCallback: @escaping (ResponseDefault) -> (Void), onFailureCallback: @escaping (String) -> (Void))",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "rejectOrder(token:String, orderID:Int, onSuccessCallback: @escaping (ResponseDefault) -> (Void), onFailureCallback: @escaping (String) -> (Void))",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "RestApi",
  "superClass": 38
},{
  "id": 25,
  "typeString": "class",
  "properties": [
    {
  "name": "var window: UIWindow?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillResignActive(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationDidEnterBackground(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillEnterForeground(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationDidBecomeActive(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillTerminate(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    42
  ],
  "name": "AppDelegate",
  "superClass": 41
},{
  "id": 26,
  "typeString": "class",
  "properties": [
    {
  "name": "var tableView:UITableView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var list: [ResponseWashers]!",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var myLatitude:CLLocationDegrees?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var myLongitude:CLLocationDegrees?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "onSuccessGetWashers(list:[ResponseWashers])",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "numberOfSections(in tableView: UITableView) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "setMyLocation(latitude:CLLocationDegrees, longitude:CLLocationDegrees)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "getDistanceInMeters(coordinate0:CLLocation, coordinate1:CLLocation) -> Int",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    44,
    45
  ],
  "name": "ListPeopleViewController",
  "superClass": 43
},{
  "id": 27,
  "typeString": "class",
  "properties": [
    {
  "name": "var washerItem:ResponseWashers!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var availableServices:[ResponseItemService]?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var labelTotalWashs:UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var labelScore:UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tableView:UITableView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var imgView:UIImageView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var viewLoading:UIView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var spinnerLoading:UIActivityIndicatorView!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "back()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "scheduleWash()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "showLoading()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "stopLoading()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "numberOfSections(in tableView: UITableView) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "WasherProfileViewController",
  "superClass": 43
},{
  "id": 28,
  "typeString": "class",
  "properties": [
    {
  "name": "var mapView:MKMapView!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "updateMap(location:CLLocation)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "onSuccessGetWashers(list:[ResponseWashers])",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "MapViewController",
  "superClass": 43
},{
  "id": 29,
  "typeString": "class",
  "properties": [
    {
  "name": "var viewLoading:UIView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var spinnerLoading:UIActivityIndicatorView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tableView:UITableView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var listOrders:[ResponseItemOrder]",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "showLoading()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "stopLoading()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "fillData()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "numberOfSections(in tableView: UITableView) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Tab2MySchedulesViewController",
  "superClass": 43
},{
  "id": 30,
  "typeString": "class",
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "loginScreen()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "createAccount()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "InitialViewController",
  "superClass": 43
},{
  "id": 31,
  "typeString": "class",
  "properties": [
    {
  "name": "var editEmail:SkyFloatingLabelTextField!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "back()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "textFieldDidEndEditing(_ textField: UITextField)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ForgotPasswordViewController",
  "superClass": 43
},{
  "id": 32,
  "typeString": "class",
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Tab5ProfileViewController",
  "superClass": 43
},{
  "id": 33,
  "typeString": "class",
  "properties": [
    {
  "name": "var viewContainer:UIView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var buttonFilter:UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var buttonMap:UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var buttonList:UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var viewLoading:UIView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var spinnerLoading:UIActivityIndicatorView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var labelKm: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var horontalSlider:UISlider!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var isMap:Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var childMapController:MapViewController?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var childListController:ListPeopleViewController?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var locationManager:CLLocationManager!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var location:CLLocation?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "showLoading()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "stopLoading()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "findWashers()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "locationManager(_ manager: CLLocationManager, didFailWithError error: Error)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "filterList()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "sliderValueChanged(sender: UISlider)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "sliderTouchUp(sender:UISlider)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "showListController()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "showMapController()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Tab1MapViewController",
  "superClass": 43
},{
  "id": 34,
  "typeString": "class",
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "EvaluateViewController",
  "superClass": 43
},{
  "id": 35,
  "typeString": "class",
  "properties": [
    {
  "name": "var editEmail:SkyFloatingLabelTextField!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var editPassword:SkyFloatingLabelTextField!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var loadingView:UIActivityIndicatorView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var buttonEnter:LGButton!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didSuccessLogin()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "forgotPassword()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "textFieldShouldReturn(_ textField: UITextField) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "back()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "textFieldDidEndEditing(_ textField: UITextField)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "textFieldShouldClear(textField: UITextField) -> Bool",
  "type": "instance",
  "accessLevel": "private"
}
  ],
  "name": "LoginViewController",
  "superClass": 43
},{
  "id": 36,
  "typeString": "class",
  "properties": [
    {
  "name": "var washerItem:ResponseWashers!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var availableServices:[ResponseItemService]?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var request:RequestCreateOrder!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var selectedDate: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var selectedHour: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var mapSelectedItems:[Int]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var viewLoading:UIView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var spinnerLoading:UIActivityIndicatorView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tableView:UITableView!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "showLoading()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "stopLoading()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "back()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "executeOrder()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "numberOfSections(in tableView: UITableView) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "hasSelectedOneMoreServices() -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "getTotal() -> Double",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ScheduleServiceViewController",
  "superClass": 43
},{
  "id": 37,
  "typeString": "class",
  "properties": [
    {
  "name": "var editUser:SkyFloatingLabelTextField!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var editEmail:SkyFloatingLabelTextField!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var editCel:SkyFloatingLabelTextField!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var editPassword:SkyFloatingLabelTextField!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "back()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "textFieldDidEndEditing(_ textField: UITextField)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "CreateAccountViewController",
  "superClass": 43
},{
  "id": 38,
  "typeString": "class",
  "name": "NSObject"
},{
  "id": 39,
  "typeString": "class",
  "name": "Mappable"
},{
  "id": 40,
  "typeString": "class",
  "name": "MKPointAnnotation"
},{
  "id": 41,
  "typeString": "class",
  "name": "UIResponder"
},{
  "id": 42,
  "typeString": "protocol",
  "name": "UIApplicationDelegate"
},{
  "id": 43,
  "typeString": "class",
  "name": "UIViewController"
},{
  "id": 44,
  "typeString": "protocol",
  "name": "UITableViewDelegate"
},{
  "id": 45,
  "typeString": "protocol",
  "name": "UITableViewDataSource"
}]
;

var renderedEntities = [];

var useCentralNode = true;

var templates = {
  case: undefined,
  property: undefined,
  method: undefined,
  entity: undefined,
  data: undefined,

  setup: function() {
    this.case = document.getElementById("case").innerHTML;
    this.property = document.getElementById("property").innerHTML;
    this.method = document.getElementById("method").innerHTML;
    this.entity = document.getElementById("entity").innerHTML;
    this.data = document.getElementById("data").innerHTML;

    Mustache.parse(this.case)
    Mustache.parse(this.property);
    Mustache.parse(this.method);
    Mustache.parse(this.entity);
    Mustache.parse(this.data);
  }
}

var colorSuperClass = { color: "#848484", highlight: "#848484", hover: "#848484" }
var colorProtocol = { color: "#9a2a9e", highlight: "#9a2a9e", hover: "#9a2a9e" }
var colorExtension = { color: "#2a8e9e", highlight: "#2a8e9e", hover: "#2a8e9e" }
var colorContainedIn = { color: "#99AB22", highlight: "#99AB22", hover: "#99AB22" }
var centralNodeColor = "rgba(0,0,0,0)";
var centralEdgeLengthMultiplier = 1;
var network = undefined;

function bindValues() {
  setSize();
  startCreatingDiagram();
}

function renderTemplate(template, list) {
    if (list != undefined && list.length > 0) {
        var result = "";
        for (var i = 0; i < list.length; i++) {
            var temp = Mustache.render(template, list[i]);
            result += temp;
        }
        return result;
    }
    return undefined;
}

function startCreatingDiagram() {
  createDiagram();
}

function createDiagram() {
  var nodes = [];
  var edges = [];

  var edgesToCentral = [];
  var maxEdgeLength = 0;
  for (var i = 0; i < entities.length; i++) {
    var entity = entities[i];
    var hasDependencies = false;

    maxEdgeLength = Math.max(maxEdgeLength, length);

    nodes.push(
      {
        id: entity.id,
        label: entity.name,
      }
    );
    if (entity.superClass != undefined && entity.superClass > 0) {
      edges.push(
        {
          from: entity.superClass,
          to: entity.id,
          color: colorSuperClass,
          label: "inherits",
          arrows: {from: true}
        }
      );

      hasDependencies = true;
    }

    var extEdges = getEdges(entity.id, entity.extensions, length, "extends", colorExtension, {from: true});
    var proEdges = getEdges(entity.id, entity.protocols, length, "conforms to", colorProtocol, {to: true});
    var conEdges = getEdges(entity.id, entity.containedEntities, length, "contained in", colorContainedIn, {from: true});

    hasDependencies = hasDependencies && extEdges.length > 0 && proEdges.length > 0 && conEdges.length > 0;

    edges = edges.concat(extEdges);
    edges = edges.concat(proEdges);
    edges = edges.concat(conEdges);

    if (!hasDependencies && useCentralNode)
    {
      edgesToCentral.push({from: entity.id, to: -1, length: length * centralEdgeLengthMultiplier, color: centralNodeColor, arrows: {from: true} });
    }
  }

  if (edgesToCentral.length > 1) {
    edges = edges.concat(edgesToCentral);
    nodes.push({id: -1, label: undefined, shape: "circle", color: centralNodeColor });
  }

  var container = document.getElementById("classDiagram");
  var dataToShow = {
      nodes: nodes,
      edges: edges
  };
  var options = {
      "edges": { "smooth": false },
      "physics": {
        "barnesHut": {
          "gravitationalConstant": -7000,
          "springLength": maxEdgeLength,
          "avoidOverlap": 1
        }
      },
      "interaction": {
        "navigationButtons": true,
        "keyboard": true,
      }
  };
  network = new vis.Network(container, dataToShow, options);

  $("#entities").html("");
  $("img").remove();

  setTimeout(disablePhysics, 200);
}

function disablePhysics()
{
  var options = {
      "edges": { "smooth": false },
      "physics": { "enabled": false }
  };
  network.setOptions(options);
  $(".loading-overlay").fadeOut("fast");
}

function getEdges(entityId, arrayToBind, edgeLength, label, color, arrows) {
  var result = [];
  if (arrayToBind != undefined && arrayToBind.length > 0) {
      for (var i = 0; i < arrayToBind.length; i++) {
        result.push({from: entityId, to: arrayToBind[i], length: edgeLength, color: color, label: label, arrows: arrows });
      }
  }
  return result;
}

function setSize() {
  var width = $(window).width();
  var height = $(window).height();

  $("#classDiagram").width(width - 5);
  $("#classDiagram").height(height - 5);
}