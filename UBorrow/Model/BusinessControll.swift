//
//  BusinessControll.swift
//  UBorrow
//
//  Created by Lucas Barros on 10/01/18.
//  Copyright © 2018 Lucas C Barros. All rights reserved.
//

import Foundation
import UIKit

class BusinessControll: NSObject {
    
    // remove referencias de objetos no index desejado
    func removeObjectAtIndex(index:Int){
        notificationControll.removeNotificationToCentral(notificationIdentifier: object.objectnotificationIdentifier[index])
        object.objectNameList.remove(at: index)
        object.peopleNameList.remove(at: index)
        object.objectImageList.remove(at: index)
        object.textColorList.remove(at: index)
        object.objectObsList.remove(at: index)
        object.objectLoanDateList.remove(at: index)
        object.objectLoanReturnList.remove(at: index)
        object.objectNotificationDateList.remove(at: index)
        object.objectnotificationIdentifier.remove(at: index)
        object.objectCounter-=1
    }
    
    // remove referencias de objetos no index desejado
    func removeAllObjects(){
        object.objectNameList.removeAll()
        object.peopleNameList.removeAll()
        object.objectImageList.removeAll()
        object.textColorList.removeAll()
        object.objectObsList.removeAll()
        object.objectLoanDateList.removeAll()
        object.objectLoanReturnList.removeAll()
        object.objectNotificationDateList.removeAll()
        object.objectCounter=0
    }
    
    func formatDate(refDate:Date)-> String{
        // Format date
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let dateString = formatter.string(from: refDate)
        return dateString
    }
    
    // Função assistente para converter cores de Hexa para UIColor
    public func hexToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    //// Save & Retrieve data from UserDefaults
    // quando alterar essas funcoes, desinstalar App antes de rodar
    
    // setting a value for a key
    func saveObjectData(){
        
//        UserDefaults.standard.set(object.objectCounter, forKey: "objectCounter")
//        UserDefaults.standard.set(object.objectNameList, forKey: "ObjectNameList")
//        UserDefaults.standard.set(object.peopleNameList, forKey: "peopleNameList")
//        UserDefaults.standard.set(object.objectImageList, forKey: "objectImageList")
//        UserDefaults.standard.set(object.textColorList, forKey: "textColorList")
//        UserDefaults.standard.set(object.objectObsList, forKey: "objectObsList")
//        UserDefaults.standard.set(object.objectLoanDateList, forKey: "objectLoanDateList")
//        UserDefaults.standard.set(object.objectLoanReturnList, forKey: "objectLoanReturnList")
//        UserDefaults.standard.set(object.objectNotificationDateList, forKey: "objectNotificationDateList")
//        UserDefaults.standard.set(object.objectnotificationIdentifier, forKey: "objectnotificationIdentifier")
//        UserDefaults.standard.set(object.personalStatusArray, forKey: "personalStatusArray")
        
        defaultDB(.set(label: "objectCounter", local: object.objectCounter))
        defaultDB(.set(label: "ObjectNameList", local: object.objectNameList))
        defaultDB(.set(label: "peopleNameList", local: object.peopleNameList))
        defaultDB(.set(label: "objectImageList", local: object.objectImageList))
        defaultDB(.set(label: "textColorList", local: object.textColorList))
        defaultDB(.set(label: "objectObsList", local: object.objectObsList))
        defaultDB(.set(label: "objectLoanDateList", local: object.objectLoanDateList))
        defaultDB(.set(label: "objectLoanReturnList", local: object.objectLoanReturnList))
        defaultDB(.set(label: "objectNotificationDateList", local: object.objectNotificationDateList))
        defaultDB(.set(label: "objectnotificationIdentifier", local: object.objectnotificationIdentifier))
        defaultDB(.set(label: "personalStatusArray", local: object.personalStatusArray))
        
        
        UserDefaults.standard.synchronize()
        
    }
    
    enum DefaultFunctions {
        case getInt(label: String)
        case getStringArray(label: String)
        case getArray(label: String)
        
        case set(label: String, local: Any)
    }
    
    func defaultDB(_ function: DefaultFunctions) -> Any? {
        switch (function) {
        case .getInt(let label):
            return UserDefaults.standard.integer(forKey: label)
        case .getStringArray(let label):
            return UserDefaults.standard.stringArray(forKey: label)!
        case .getArray(let label):
            return UserDefaults.standard.array(forKey: label)!
        case .set(let label, let local):
            UserDefaults.standard.set(local, forKey: label)
            return 0
        }
    }

    // retrieving a value for a key
    func retrieveObjectData(){
        
//        object.objectCounter = UserDefaults.standard.integer(forKey: "objectCounter")
//        object.objectNameList = UserDefaults.standard.stringArray(forKey: "ObjectNameList")!
//        object.peopleNameList = UserDefaults.standard.stringArray(forKey: "peopleNameList")!
//        object.objectImageList = UserDefaults.standard.stringArray(forKey: "objectImageList")!
//        object.textColorList = UserDefaults.standard.stringArray(forKey: "textColorList")!
//        object.objectObsList = UserDefaults.standard.stringArray(forKey: "objectObsList")!
//        object.objectLoanDateList = UserDefaults.standard.array(forKey: "objectLoanDateList") as! [Date]
//        object.objectLoanReturnList = UserDefaults.standard.array(forKey: "objectLoanReturnList")as! [Date]
//        object.objectNotificationDateList = UserDefaults.standard.array(forKey: "objectNotificationDateList") as! [Int]
//        object.objectnotificationIdentifier = UserDefaults.standard.stringArray(forKey: "objectnotificationIdentifier")!
//        object.personalStatusArray = UserDefaults.standard.array(forKey: "personalStatusArray") as! [Int]
        
        object.objectCounter = defaultDB(.getInt(label: "objectCounter")) as! Int
        object.objectNameList = defaultDB(.getStringArray(label: "ObjectNameList")) as! [String]
        object.peopleNameList = defaultDB(.getStringArray(label: "peopleNameList")) as! [String]
        object.objectImageList = defaultDB(.getStringArray(label: "objectImageList")) as! [String]
        object.textColorList = defaultDB(.getStringArray(label: "textColorList")) as! [String]
        object.objectObsList = defaultDB(.getStringArray(label: "objectObsList")) as! [String]
        object.objectLoanDateList =  defaultDB(.getArray(label: "objectLoanDateList")) as! [Date]
        object.objectLoanReturnList = defaultDB(.getArray(label: "objectLoanReturnList")) as! [Date]
        object.objectNotificationDateList = defaultDB(.getArray(label: "objectNotificationDateList")) as! [Int]
        object.objectnotificationIdentifier = defaultDB(.getStringArray(label: "objectnotificationIdentifier")) as! [String]
        object.personalStatusArray = defaultDB(.getArray(label: "personalStatusArray")) as! [Int]
        
        // Set appTheme
        if(object.personalStatusArray[1]==1){
            appColor.switchColors(willSwitch: true)
        } else {
            appColor.switchColors(willSwitch: false)
        }
        
        
    }
    
    // Funcao atualiza cores das celulas de acordo com prazo de
    func updateObjectColor(index: Int){
        // ((Data devolucao-data inicio)/4) = cores // Se maior que Data.Devolucao = Vermelho
        let timeInterval = object.objectLoanReturnList[index].timeIntervalSince(object.objectLoanDateList[index])
        let colorInterval = timeInterval/4
        
        if(object.textColorList[index] != appColor.Green){
            if(Date().timeIntervalSince(object.objectLoanDateList[index]) <= colorInterval){
                object.textColorList[index] = appColor.Blue1
            } else if(Date().timeIntervalSince(object.objectLoanDateList[index]) <= (colorInterval*2)){
                object.textColorList[index] = appColor.Blue2
            } else if(Date().timeIntervalSince(object.objectLoanDateList[index]) <= (colorInterval*3)){
                object.textColorList[index] = appColor.Blue3
            } else if(Date().timeIntervalSince(object.objectLoanDateList[index]) <= (colorInterval*4)){
                object.textColorList[index] = appColor.Blue4
            } else if(Date().timeIntervalSince(object.objectLoanDateList[index]) > (Date().timeIntervalSince(object.objectLoanReturnList[index]))){
                object.textColorList[index] = appColor.Red
            }
        }
    }
}
