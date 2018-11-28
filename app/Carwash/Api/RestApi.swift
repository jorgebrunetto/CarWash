//
//  RestApi.swift
//  Carwash
//
//  Created by Bluecore on 10/09/18.
//

import UIKit
import Alamofire
import ObjectMapper

///  Classe Responsável pelas chamadas Rest.
class RestApi: NSObject {

    private let baseURL = "http://api.carwash.ml"
    private let user = "admin"
    private let pass = "CirioSete"
    
    /// O usuário fará o login usando um e-mail e senha.
    /// Retorna dados usuário, além de informações úteis para utilização dos demais métodos expostos para o consumo.
    /// Validação de e-mail (regex)
    /// O usuário não é obrigado a estar conectado para a utilização mínima do app. Apenas para alguns métodos será necessário a sua autenticação
    ///
    /// - Parameters:
    ///   - req: Model Request Login API
    ///   - onSuccessCallback: Função de Callback sucesso
    ///   - onFailureCallback: Função de Callback falha
    func apiLogin(req:RequestLogin, onSuccessCallback: @escaping (ResponseLogin) -> (Void), onFailureCallback: @escaping (String) -> (Void)){
        
        let params = req.toJSON()
        let credentialData = "\(user):\(pass)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = [
            "Content-Type": "application/json",
            "Authorization":"Basic \(base64Credentials)"
        ]
        Alamofire
            .request(baseURL + "/Api/ApiUser/Login", method: .post, parameters: params  , encoding: JSONEncoding.default, headers: headers)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                
                if let data = response.data, let jsonUtf8Text = String(data: data, encoding: .utf8) {
                    // original server data as UTF8 string
                    //debugPrint(jsonUtf8Text)
                    let result =  (ResponseLogin)(JSONString: jsonUtf8Text)
                    
                    if(result == nil){
                        onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                    }
                    else{
                        if(result?.Status)!{
                            onSuccessCallback(result!)
                        }
                        else{
                            if result?.resultFailure != nil{
                                onFailureCallback((result?.resultFailure)!)
                            }
                            else{
                                onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                            }
                        }
                    }
                }
                else{
                    onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                }
        }
    }
    
    /*
     O usuário fará o cadastro fornecendo dados pessoais e o endereço. Existirão três perfis de usuário:
     lavador: Usuário que recebe para lavar veículos em sua residência.
     lava-rápido: Empresa especializada em lavar veículos.
     cliente: Usuário que contrata o serviço de lavagem veicular.
     */
    func registerUser(req:RequestRegisterUser, onSuccessCallback: @escaping (ResponseDefault) -> (Void), onFailureCallback: @escaping (String) -> (Void)){
     
        let params = req.toJSON()
        let credentialData = "\(user):\(pass)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = [
            "Content-Type": "application/json",
            "Authorization":"Basic \(base64Credentials)"
        ]
        
        Alamofire
            .request(baseURL + "/Api/ApiUser/Register", method: .post, parameters: params  , encoding: JSONEncoding.default, headers: headers)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                
                if let data = response.data, let jsonUtf8Text = String(data: data, encoding: .utf8) {
                    // original server data as UTF8 string
                    //debugPrint(jsonUtf8Text)
                    let result =  (ResponseDefault)(JSONString: jsonUtf8Text)
                    
                    if(result == nil){
                        onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                    }
                    else{
                        onSuccessCallback(result!)
                    }
                }
                else{
                    onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                }
        }
    }
    
    /*
     Este método deverá ser usado antes do método 6(Cadastrar serviço). Sua função é listar os serviços disponíveis para cadastro.
     */
    func listAllServices(token:String, onSuccessCallback: @escaping ([ResponseItemService]) -> (Void), onFailureCallback: @escaping (String) -> (Void)){
        
        let params = ["Token":token]
        let credentialData = "\(user):\(pass)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = [
            "Content-Type": "application/json",
            "Authorization":"Basic \(base64Credentials)"
        ]
        
        Alamofire
            .request(baseURL + "/Api/ApiUser/ListAllServices", method: .post, parameters: params  , encoding: JSONEncoding.default, headers: headers)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                
                if let data = response.data, let jsonUtf8Text = String(data: data, encoding: .utf8) {
                    // original server data as UTF8 string
                    //debugPrint(jsonUtf8Text)
                    let result =  (ResponseListServices)(JSONString: jsonUtf8Text)
                    
                    if(result == nil){
                        onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                    }
                    else{
                        if(result?.Status == true){
                            onSuccessCallback(result?.Result! ?? [ResponseItemService]())
                        }
                        else{
                            onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                        }
                    }
                }
                else{
                    onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                }
        }
    }
    
    /*
     O lavador ou lava-rápido poderá cadastrar diferentes tipos de serviços, como lavagem simples, completa, pretinho, cera, entre outros. Para buscar os serviços disponíveis para cadastro, deverá ser usado o método 7 “Listar serviços disponíveis para cadastro”.
     */
    func addServiceToWasher(req:RequestServiceToWasher, onSuccessCallback: @escaping (ResponseDefault) -> (Void), onFailureCallback: @escaping (String) -> (Void)){
        
        let params = req.toJSON()
        let credentialData = "\(user):\(pass)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = [
            "Content-Type": "application/json",
            "Authorization":"Basic \(base64Credentials)"
        ]
        
        Alamofire
            .request(baseURL + "/Api/ApiUser/ListAllServices", method: .post, parameters: params  , encoding: JSONEncoding.default, headers: headers)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                
                if let data = response.data, let jsonUtf8Text = String(data: data, encoding: .utf8) {
                    // original server data as UTF8 string
                    //debugPrint(jsonUtf8Text)
                    let result =  (ResponseDefault)(JSONString: jsonUtf8Text)
                    
                    if(result == nil){
                        onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                    }
                    else{
                        onSuccessCallback(result!)
                    }
                }
                else{
                    onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                }
        }
    }
    
    /*
     Lavadores e lava-rápidos deverão avaliar os clientes após o serviço.
     */
    func evaluateUser(req:RequestEvaluate, onSuccessCallback: @escaping (ResponseDefault) -> (Void), onFailureCallback: @escaping (String) -> (Void)){
        
        let params = req.toJSON()
        let credentialData = "\(user):\(pass)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = [
            "Content-Type": "application/json",
            "Authorization":"Basic \(base64Credentials)"
        ]
        
        Alamofire
            .request(baseURL + "/Api/ApiUser/EvaluateUser", method: .post, parameters: params  , encoding: JSONEncoding.default, headers: headers)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                
                if let data = response.data, let jsonUtf8Text = String(data: data, encoding: .utf8) {
                    // original server data as UTF8 string
                    //debugPrint(jsonUtf8Text)
                    let result =  (ResponseDefault)(JSONString: jsonUtf8Text)
                    
                    if(result == nil){
                        onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                    }
                    else{
                        onSuccessCallback(result!)
                    }
                }
                else{
                    onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                }
        }
    }
    
    /*
     Listagem de pedidos por usuário
     */
    func listOrderByUser(token:String, onSuccessCallback: @escaping (ResponseListOrderByUser) -> (Void), onFailureCallback: @escaping (String) -> (Void)){
        
        let params = ["Token":token] as [String : Any]
        let credentialData = "\(user):\(pass)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = [
            "Content-Type": "application/json",
            "Authorization":"Basic \(base64Credentials)"
        ]
        
        Alamofire
            .request(baseURL + "/Api/ApiUser/ListOrderByUser", method: .post, parameters: params  , encoding: JSONEncoding.default, headers: headers)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                
                if let data = response.data, let jsonUtf8Text = String(data: data, encoding: .utf8) {
                    // original server data as UTF8 string
                    //debugPrint(jsonUtf8Text)
                    let result =  (ResponseListOrderByUser)(JSONString: jsonUtf8Text)
                    
                    if(result == nil){
                        onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                    }
                    else{
                        if(result?.Status == true){
                            if result?.Result == nil{
                                onFailureCallback(Messages.NOT_FOUND_DATA)
                            }
                            else if result?.Result?.count==0{
                                onFailureCallback(Messages.NOT_FOUND_DATA)
                            }
                            else{
                                onSuccessCallback(result!)
                            }
             
                        }
                        else{
                            onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                        }
                    }
                }
                else{
                    onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                }
        }
    }
    
    /*
     O cliente poderá visualizar no mapa os lavadores e lava-rápidos mais próximos de sua residência ou de uma região específica.
     */
    func apiFindWashersArround(token:String, radius:Int, latitude:String, longitude:String, onSuccessCallback: @escaping (ResponseListWashers) -> (Void), onFailureCallback: @escaping (String) -> (Void)) {
        let params = ["Token":token, "MaxRadius":radius, "Latitude":latitude, "Longitude":longitude] as [String : Any]
        
        let credentialData = "\(user):\(pass)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = [
            "Content-Type": "application/json",
            "Authorization":"Basic \(base64Credentials)"
        ]
        Alamofire
            .request(baseURL + "/Api/ApiUser/ListWashers", method: .post, parameters: params  , encoding: JSONEncoding.default, headers: headers)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                
                if let data = response.data, let jsonUtf8Text = String(data: data, encoding: .utf8) {
                    // original server data as UTF8 string
                    //debugPrint(jsonUtf8Text)
                    let result =  (ResponseListWashers)(JSONString: jsonUtf8Text)
                    
                    if(result == nil){
                        onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                    }
                    else{
                        if(result?.Status)!{
                            if(result?.listWashers == nil){
                                onFailureCallback(Messages.NOT_FOUND_DATA)
                            }
                            else if(result?.listWashers?.count == 0){
                                onFailureCallback(Messages.NOT_FOUND_DATA)
                            }
                            else{
                                onSuccessCallback(result!)
                            }
                        }
                        else{
                            if result?.error != nil{
                                onFailureCallback((result?.error)!)
                            }
                            else{
                                onFailureCallback(Messages.NOT_FOUND_DATA)
                            }
                        }
                    }
                }
                else{
                    onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                }
        }
    }
    
    /*
     O cliente poderá listar os serviços de um lavador específico.
     */
    func listServicesByWasher(token:String, washerID:Int, onSuccessCallback: @escaping (ResponseListServices) -> (Void), onFailureCallback: @escaping (String) -> (Void)){
        
        let params = ["Token":token, "WasherId":washerID] as [String : Any]
        
        let credentialData = "\(user):\(pass)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = [
            "Content-Type": "application/json",
            "Authorization":"Basic \(base64Credentials)"
        ]
        
        Alamofire
            .request(baseURL + "/Api/ApiUser/ListServicesByWasher", method: .post, parameters: params  , encoding: JSONEncoding.default, headers: headers)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                
                if let data = response.data, let jsonUtf8Text = String(data: data, encoding: .utf8) {
                    // original server data as UTF8 string
                    //debugPrint(jsonUtf8Text)
                    let result =  (ResponseListServices)(JSONString: jsonUtf8Text)
                    
                    if(result == nil){
                        onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                    }
                    else{
                        if(result?.Status == true){
                            onSuccessCallback(result!)
                        }
                        else{
                            onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                        }
                    }
                }
                else{
                    onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                }
        }
    }
    
    /*
     O cliente envia uma solicitação de lavagem para o lavador ou lava-rápido de sua preferência.
     */
    func createOrder(req:RequestCreateOrder, onSuccessCallback: @escaping (String) -> (Void), onFailureCallback: @escaping (String) -> (Void)){
        
        let params = req.toJSON()
        
        let credentialData = "\(user):\(pass)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = [
            "Content-Type": "application/json",
            "Authorization":"Basic \(base64Credentials)"
        ]
        
        Alamofire
            .request(baseURL + "/Api/ApiUser/CreateOrder", method: .post, parameters: params  , encoding: JSONEncoding.default, headers: headers)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                
                if let data = response.data, let jsonUtf8Text = String(data: data, encoding: .utf8) {
                    // original server data as UTF8 string
                    //debugPrint(jsonUtf8Text)
                    let result =  (ResponseCreateOrder)(JSONString: jsonUtf8Text)
                    
                    if(result == nil){
                        onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                    }
                    else{
                        if(result?.Status == true){
                            onSuccessCallback(Messages.CREATE_ORDER_SUCCESS)
                        }
                        else{
                            onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                        }
                    }
                }
                else{
                    onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                }
        }
    }
    
    /*
     Após o pedido ter sido gerado pelo cliente, o lavador ou lava-rápido pode aceitar o pedido.
     */
    func acceptOrder(token:String, orderID:Int, onSuccessCallback: @escaping (ResponseDefault) -> (Void), onFailureCallback: @escaping (String) -> (Void)){
        
        let params = ["Token":token, "OrderId":orderID] as [String : Any]
        
        let credentialData = "\(user):\(pass)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = [
            "Content-Type": "application/json",
            "Authorization":"Basic \(base64Credentials)"
        ]
        
        Alamofire
            .request(baseURL + "/Api/ApiUser/AcceptOrder", method: .post, parameters: params  , encoding: JSONEncoding.default, headers: headers)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                
                if let data = response.data, let jsonUtf8Text = String(data: data, encoding: .utf8) {
                    // original server data as UTF8 string
                    //debugPrint(jsonUtf8Text)
                    let result =  (ResponseDefault)(JSONString: jsonUtf8Text)
                    
                    if(result == nil){
                        onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                    }
                    else{
                        if(result?.Status == true){
                            onSuccessCallback(result!)
                        }
                        else{
                            onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                        }
                    }
                }
                else{
                    onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                }
        }
    }
    
    /*
     Após o pedido ter sido gerado pelo cliente, o lavador ou lava-rápido pode rejeitar o pedido.
     */
    func rejectOrder(token:String, orderID:Int, onSuccessCallback: @escaping (ResponseDefault) -> (Void), onFailureCallback: @escaping (String) -> (Void)){
        
        let params = ["Token":token, "OrderId":orderID] as [String : Any]
        
        let credentialData = "\(user):\(pass)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = [
            "Content-Type": "application/json",
            "Authorization":"Basic \(base64Credentials)"
        ]
        
        Alamofire
            .request(baseURL + "/Api/ApiUser/RejectOrder", method: .post, parameters: params  , encoding: JSONEncoding.default, headers: headers)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                
                if let data = response.data, let jsonUtf8Text = String(data: data, encoding: .utf8) {
                    // original server data as UTF8 string
                    //debugPrint(jsonUtf8Text)
                    let result =  (ResponseDefault)(JSONString: jsonUtf8Text)
                    
                    if(result == nil){
                        onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                    }
                    else{
                        if(result?.Status == true){
                            onSuccessCallback(result!)
                        }
                        else{
                            onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                        }
                    }
                }
                else{
                    onFailureCallback(Messages.CANT_COMPLETE_REQUEST)
                }
        }
    }
}
