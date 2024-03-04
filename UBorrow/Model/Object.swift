//
//  Object.swift
//  UBorrow
//
//  Created by Lucas Barros on 09/01/18.
//  Copyright © 2018 Lucas C Barros. All rights reserved.
//

import Foundation
import UIKit

class Object: NSObject {

    /// Dados iniciais para teste
    // Numero de Objetos
    var objectCounter:Int = 6

    // Nome Objeto
    var objectNameList:[String] = ["MacBook","HeadPhones","5 Dollars","GameOfThrones DVD","XBox360","iPad"]

    // Nome Pessoa
    var peopleNameList:[String] = ["Jhon","Rick","Erika","Jessica","Bob","Steve"]

    // Imagem Objeto
    var objectImageList:[String] = ["Computer.png","Headphone.png","Money.png","Disc.png","Portable.png","iPad.png"]

    // Cor da celula (De acordo com prazo)
    var textColorList:[String] = [appColor.Blue1,appColor.Blue2,appColor.Blue3,appColor.Blue4,appColor.Red,appColor.Green]

    // Comentarios do emprestimo
    var objectObsList:[String] = [" "," "," "," "," "," "]

    // Data inicial do emprestimo
    var objectLoanDateList:[Date] = [Date(),Date()-500778,Date()-811111,Date()-1254321,Date(),Date()]

    // Data final do emprestimo
    var objectLoanReturnList:[Date] = [Date()+123456,Date()+1111111,Date()+654321,Date()+400000,Date()-9999,Date()]

    // Data final do emprestimo
    var objectNotificationDateList:[Int] = [123456,1111111,654321,400000,9999,1098765]

    // notificationIdentifier
    var objectnotificationIdentifier:[String] = ["Timer1","Timer2","Timer3","Timer4","Timer5","Timer6"]
    
    // first notification on/off, second appColor white/black
    var personalStatusArray:[Int] = [1, 1] // 0=off,1=on // 1=black, 0=white
    
    

//    /// Variaveis Finais para uso
//    // Numero de Objetos
//    var objectCounter:Int = 0 // 6
//
//    // Nome Objeto
//    var objectNameList:[String] = [] // ["iPod","Caderno Fisica","XBox360","CD da Xuxa","Wii-U","English Books"]
//
//    // Nome Pessoa
//    var peopleNameList:[String] = [] // ["Rhullian","Rick","Ellen","Carlos","Criveli","Steve"]
//
//    // Imagem Objeto
//    var objectImageList:[String] = [] // ["Soccer Shoe.png","Socks.png","Mouse.png","Pencil Case.png","Headphone.png","iPhone Charger.png"]
//
//    // Cor da celula (De acordo com prazo)
//    var textColorList:[String] = [] // ["#66CCFF","#6699FF","#6666FF","#6633FF","#F62E2E","#7ED321"]
//
//    // Comentarios do emprestimo
//    var objectObsList:[String] = [] // [" "," "," "," "," "," "]
//
//    // Data inicial do emprestimo
//    var objectLoanDateList:[Date] = [] // [Date(),Date(),Date(),Date(),Date(),Date()]
//
//    // Data final do emprestimo
//    var objectLoanReturnList:[Date] = [] // [Date()+123456,Date()+1111111,Date()+654321,Date()+400000,Date()+9999,Date()+1098765]
//
//    // Data final do emprestimo
//    var objectNotificationDateList:[Int] = [] // [123456,1111111,654321,400000,9999,1098765]
//
//    // notificationIdentifier
//    var objectnotificationIdentifier:[String] = [] // ["Timer1","Timer2","Timer3","Timer4","Timer5","Timer6"]
    
}
