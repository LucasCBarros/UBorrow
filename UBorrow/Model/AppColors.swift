//
//  AppColors.swift
//  UBorrow
//
//  Created by Lucas Barros on 15/01/18.
//  Copyright © 2018 Lucas C Barros. All rights reserved.


import Foundation
import UIKit

class AppColors: NSObject {

    //App tema inicial: White
    var UIBlue1 = businessControll.hexToUIColor(hex: "#FBD283")
    var UIBlue2 = businessControll.hexToUIColor(hex: "#FE9C53")
    var UIBlue3 = businessControll.hexToUIColor(hex:"#F76242")
    var UIBlue4 = businessControll.hexToUIColor(hex:"#F02D35")
    var UIRed = businessControll.hexToUIColor(hex:"#6633FF")
    var UIGreen = businessControll.hexToUIColor(hex:"#7ED321")
    var UIBlack = businessControll.hexToUIColor(hex:"#F8FEF6")
    
    var Blue1 = "#FBD283"
    var Blue2 = "#FE9C53"
    var Blue3 = "#F76242"
    var Blue4 = "#F02D35"
    var Red = "#6633FF"
    var Green = "#7ED321"
    var Black = "#F8FEF6"
    
    func switchColors(willSwitch: Bool){
        if(willSwitch){
            // AppTheme: Black
            UIBlue1 = businessControll.hexToUIColor(hex: "#66CCFF")
            UIBlue2 = businessControll.hexToUIColor(hex: "#6699FF")
            UIBlue3 = businessControll.hexToUIColor(hex:"#6666FF")
            UIBlue4 = businessControll.hexToUIColor(hex:"#6633FF")
            UIRed = businessControll.hexToUIColor(hex:"#F62E2E")
            UIGreen = businessControll.hexToUIColor(hex:"#7ED321")
            UIBlack = businessControll.hexToUIColor(hex:"#282B35")
        
            Blue1 = "#66CCFF"
            Blue2 = "#6699FF"
            Blue3 = "#6666FF"
            Blue4 = "#6633FF"
            Red = "#F62E2E"
            Green = "#7ED321"
            Black = "#282B35"
        } else {
            // AppTheme: White
             UIBlue1 = businessControll.hexToUIColor(hex: "#FBD283")
             UIBlue2 = businessControll.hexToUIColor(hex: "#FE9C53")
             UIBlue3 = businessControll.hexToUIColor(hex:"#F76242")
             UIBlue4 = businessControll.hexToUIColor(hex:"#F02D35")
             UIRed = businessControll.hexToUIColor(hex:"#6633FF")
             UIGreen = businessControll.hexToUIColor(hex:"#7ED321")
             UIBlack = businessControll.hexToUIColor(hex:"#F8FEF6")
            
             Blue1 = "#FBD283"
             Blue2 = "#FE9C53"
             Blue3 = "#F76242"
             Blue4 = "#F02D35"
             Red = "#6633FF"
             Green = "#7ED321"
             Black = "#F8FEF6"
        }
    }
}
    ///Black theme
//    let UIBlue1 = businessControll.hexToUIColor(hex: "#66CCFF")
//    let UIBlue2 = businessControll.hexToUIColor(hex: "#6699FF")
//    let UIBlue3 = businessControll.hexToUIColor(hex:"#6666FF")
//    let UIBlue4 = businessControll.hexToUIColor(hex:"#6633FF")
//    let UIRed = businessControll.hexToUIColor(hex:"#F62E2E")
//    let UIGreen = businessControll.hexToUIColor(hex:"#7ED321")
//    let UIBlack = businessControll.hexToUIColor(hex:"#282B35")
//
//    let Blue1 = "#66CCFF"
//    let Blue2 = "#6699FF"
//    let Blue3 = "#6666FF"
//    let Blue4 = "#6633FF"
//    let Red = "#F62E2E"
//    let Green = "#7ED321"
//    let Black = "#282B35"

    /// Orange theme
//    var UIBlue1 = businessControll.hexToUIColor(hex: "#FBD283")
//    var UIBlue2 = businessControll.hexToUIColor(hex: "#FE9C53")
//    var UIBlue3 = businessControll.hexToUIColor(hex:"#F76242")
//    var UIBlue4 = businessControll.hexToUIColor(hex:"#F02D35")
//    var UIRed = businessControll.hexToUIColor(hex:"#6633FF")
//    var UIGreen = businessControll.hexToUIColor(hex:"#7ED321")
//    var UIBlack = businessControll.hexToUIColor(hex:"#F8FEF6")
//
//    var Blue1 = "#FBD283"
//    var Blue2 = "#FE9C53"
//    var Blue3 = "#F76242"
//    var Blue4 = "#F02D35"
//    var Red = "#6633FF"
//    var Green = "#7ED321"
//    var Black = "#F8FEF6"

