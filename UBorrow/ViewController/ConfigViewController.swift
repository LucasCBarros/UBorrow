//
//  ConfigViewController.swift
//  UBorrow
//
//  Created by Lucas Barros on 15/01/18.
//  Copyright © 2018 Lucas C Barros. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {

    // Outlets do FrontEnd
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var cleanLoansButton: UIButton!
    @IBOutlet weak var notificationSwitch: UISwitch!
    @IBOutlet weak var tutorialButton: UIButton!
    @IBOutlet weak var appColorLabel: UILabel!
    @IBOutlet weak var appColorSwitch: UISwitch!
    @IBOutlet weak var rateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadVisualColors()
        
        // Muda status do notificationSwitch
        if(object.personalStatusArray[0] == 0){
            notificationSwitch.isOn = false
        } else {
            notificationSwitch.isOn = true
        }

        // Muda status do appColorSwitch
        if(object.personalStatusArray[1] == 0){
            appColorSwitch.isOn = false
        } else {
            appColorSwitch.isOn = true
        }
        
    }
    
    func loadVisualColors(){
        
        // Personaliza botao de apagar todos objetos
        cleanLoansButton.layer.cornerRadius = cleanLoansButton.layer.frame.height/2
        cleanLoansButton.layer.borderColor = appColor.UIRed.cgColor
        cleanLoansButton.layer.borderWidth = 2
        
        // Personaliza botao de tutorial
        tutorialButton.layer.cornerRadius = tutorialButton.layer.frame.height/2
        tutorialButton.layer.borderColor = appColor.UIGreen.cgColor
        tutorialButton.layer.borderWidth = 2
        tutorialButton.setTitleColor(appColor.UIGreen, for: .normal)
        
        // Personaliza botao de notification
        notificationLabel.layer.cornerRadius = (notificationLabel.layer.frame.height/2)
        notificationLabel.layer.borderColor = appColor.UIBlue1.cgColor
        notificationLabel.layer.borderWidth = 2
        notificationLabel.textColor = appColor.UIBlue1
        
        // Personaliza botao de AppColor
        appColorLabel.layer.cornerRadius = (notificationLabel.layer.frame.height/2)
        appColorLabel.layer.borderColor = appColor.UIBlue2.cgColor
        appColorLabel.layer.borderWidth = 2
        appColorLabel.textColor = appColor.UIBlue2
        
        // Personaliza botao de RateApp
        rateButton.layer.cornerRadius = (notificationLabel.layer.frame.height/2)
        rateButton.layer.borderColor = appColor.UIBlue4.cgColor
        rateButton.layer.borderWidth = 2
        rateButton.setTitleColor(appColor.UIBlue4, for: .normal)
        
        // Muda cor do switch para azul do app
        notificationSwitch.onTintColor = appColor.UIBlue1
        appColorSwitch.onTintColor = appColor.UIBlue2
        
        
        // NavBar visivel
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = appColor.UIBlack
        
        //View backgrounds
        view.backgroundColor = appColor.UIBlack
        
        cleanLoansButton.setTitleColor(appColor.UIRed, for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Remove todos objetos existentes na lista
    @IBAction func removeAllObjects(_ sender: Any) {
        callWarning(popupTitle: "Atention!", popupMessage: "This will delete all your loans! Are you sure?")
    }
    
    // Funcao de ativa ou desativar notificacoes
    @IBAction func notificationOnOff(_ sender: Any) {
        if(notificationSwitch.isOn == true){
            _isNotificationActive = false // Variavel Global de Notifications
            // Funcao que remove todas notificacoes da central
            notificationControll.removeNotificationToCentral()
            object.personalStatusArray[0] = 1 // Salva estado OFF
            businessControll.saveObjectData()
        } else {
            _isNotificationActive = true // Variavel Global de Notifications
            // Funcao que adciona notificacoes da central para cada objeto
            notificationControll.loopAddNotification()
            object.personalStatusArray[0] = 0 // Salva estado ON
            businessControll.saveObjectData()
        }
    }
    
    @IBAction func appColorWhiteBlack(_ sender: Any) {
        if(appColorSwitch.isOn == true){
//            businessControll.retrieveObjectData()
            appColor.switchColors(willSwitch: appColorSwitch.isOn)
            object.personalStatusArray[1] = 1 // Salva estado ON
            loadVisualColors()
            businessControll.saveObjectData()
        } else {
//            businessControll.retrieveObjectData()
            appColor.switchColors(willSwitch: appColorSwitch.isOn)
            object.personalStatusArray[1] = 0 // Salva estado OFF
            loadVisualColors()
            businessControll.saveObjectData()
        }
    }
    
    
    // Funcao que alerta usuario sobre erro
    func callWarning(popupTitle:String, popupMessage:String){
        // create the alert
        let alert = UIAlertController(title: popupTitle, message: popupMessage, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
            businessControll.removeAllObjects()
        } ))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func click_RateButton(_ sender: Any) {
        let appDelegate = AppDelegate()
        appDelegate.requestReview()
    }
    
}
