//
//  Utils.swift
//  Carwash
//
//  Created by Bluecore on 10/09/18.
//

import UIKit
import CoreLocation


/// Classe responsável por gerenciar os métodos úteis para o aplicativo
class Utils: NSObject {

    
    /// Método para calcular a distância entre dois pontos de coordenadas
    ///
    /// - Parameters:
    ///   - lat0: latitude inicial
    ///   - long0: longitude inicial
    ///   - lat1: latitude final
    ///   - long1: longitude final
    /// - Returns: Retorna a distância entre os pontos em metros
    static func calculateDistanceInMeters(lat0:Double, long0:Double, lat1:Double,long1:Double) -> Double{
        
        let coordinate₀ = CLLocation(latitude: lat0, longitude: long0)
        let coordinate₁ = CLLocation(latitude: lat1, longitude: long1)
        
        let distanceInMeters = coordinate₀.distance(from: coordinate₁) // result is in meters
        return distanceInMeters
    }
    
    
    /// Método responsável por formatação de datas
    ///
    /// - Parameters:
    ///   - inputDate: Data a ser formatada
    ///   - inputFormat: Formato da inputDate
    ///   - endFormat: Formato final desejado da data
    /// - Returns: Retorna o formato da date em String no formato desejado
    static func formatDate(inputDate:String, inputFormat:String, endFormat:String) -> String{
        
        if inputDate == ""{
            return ""
        }
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = inputFormat
        
        let dateFormatterEnd = DateFormatter()
        dateFormatterEnd.dateFormat = endFormat
        
        let date:Date = dateFormatterGet.date(from: inputDate)!
        return dateFormatterEnd.string(from: date)
    }
    
    static func dateToString(inputDate:Date, endFormat:String) -> String{
    
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = endFormat
    
        
        return formatter.string(from: inputDate) // string purpose I add here
    }
    
    /// Método para escalar uma imagem mantendo seu ratio
    ///
    /// - Parameters:
    ///   - oldWidth: largura da imagem
    ///   - oldHeight: altura da imagem
    ///   - spectedWidth: largura esperada
    /// - Returns: Retorna um valor em escala da altura da imagem
    static func scaleImageAspectRatio(oldWidth:CGFloat,oldHeight:CGFloat, spectedWidth: CGFloat) -> CGFloat!{
        
        let scaleFactor = spectedWidth / oldWidth
        
        let newHeight = oldHeight * scaleFactor
        
        return newHeight
    }
    
    /// Método para escalar uma imagem mantendo seu ratio
    ///
    /// - Parameters:
    ///   - oldWidth: largura da imagem
    ///   - oldHeight: altura da imagem
    ///   - spectedWidth: largura esperada
    /// - Returns: Retorna uma imagem com a escala desejada
    static func scaleImageAspectRatio(source:UIImage, scaledWidth: CGFloat) -> UIImage!{
        
        let oldWidth = source.size.width
        let scaleFactor = scaledWidth / oldWidth
        
        let newHeight = source.size.height * scaleFactor
        let newWidth = oldWidth * scaleFactor
        
        // Store to image
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        source.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
    
    static func formatDate(intputDate:String, inputFormat:String, endFormat:String) -> String{
       
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = inputFormat
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = endFormat
        
        let date: NSDate? = dateFormatterGet.date(from: intputDate)! as NSDate
        if date == nil{
            return ""
        }
        return dateFormatterPrint.string(from: date! as Date)
    }
    
    static func validateEmail(inputEmail:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: inputEmail)
    }
}
