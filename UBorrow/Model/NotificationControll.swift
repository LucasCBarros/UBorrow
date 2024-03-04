//
//  NotificationControll.swift
//  UBorrow
//
//  Created by Lucas Barros on 15/01/18.
//  Copyright © 2018 Lucas C Barros. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

// Variavel Global
var _isNotificationActive = true

class NotificationControll {
    
    //Funcao que pede autorizacao para notificar
    func notificationPermission(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
    }
    
    // Funcao recursiva para adcionar as notificacoes
    func loopAddNotification(){
        for i in 0..<(object.objectCounter) {
            addNotificationToCentral(index: i)
        }
    }
    
    // Funcao que adciona notificacoes na central
    func addNotificationToCentral(index:Int){
        
        // Parametros para notificar
        let notification = UNMutableNotificationContent()
        notification.title = object.objectNameList[index] // Titulo da notificacao
        notification.body = "Lembre de devolver o objeto: "+String(object.objectNameList[index]) // Mensagem da notificacao
        let notificationIdentifier = object.objectnotificationIdentifier[index]
        
        // Pega a data de retorno de cada objeto
        var notificationDate = object.objectLoanReturnList[index]
        
        // Muda padrao de horario de notificacao
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: notificationDate)
        components.hour = 1
        components.minute = 00
        notificationDate = calendar.date(from: components)!
        
        let notificationTime = object.objectNotificationDateList[index]
        
        // Cria as trigger de notificacao
        if (notificationTime>0){
            // Time till notifications are called
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(notificationTime), repeats: false)
            // Requests the notification
            let request = UNNotificationRequest (identifier: notificationIdentifier, content: notification, trigger: trigger)
            //Creates the notification
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }
    
    // Funcao que remove todas notificacoes da central
    func removeNotificationToCentral(){
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers:object.objectnotificationIdentifier)
    }
    
    // Funcao que remove todas notificacoes da central
    func removeNotificationToCentral(notificationIdentifier:String){
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: [notificationIdentifier])
    }
}


