//
//  NewLendViewController.swift
//  UBorrow
//
//  Created by Lucas Barros on 09/01/18.
//  Copyright © 2018 Lucas C Barros. All rights reserved.
//

import UIKit

var selectedIcon:String!

class NewLendViewController: UIViewController {

    @IBOutlet weak var personNameInput: UITextField!
    @IBOutlet weak var objectNameInput: UITextField!
    @IBOutlet weak var noteTextInput: UITextField!
    @IBOutlet weak var datePicker: UITextField!
    @IBOutlet weak var iconHolderBtn: UIButton!

    let picker = UIDatePicker()
    var returnDate:Date!
    
    override func viewWillAppear(_ animated: Bool) {
        viewDidLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Atualiza o icone escolhido pelo usuario
        if(selectedIcon == nil){
             iconHolderBtn.setImage(#imageLiteral(resourceName: "IconPlaceHolder"), for: .normal)
        } else {
            iconHolderBtn.setImage(UIImage(named: _editIcon), for: .normal)
        }
        
        //View backgrounds
        view.backgroundColor = appColor.UIBlack
        navigationItem.backBarButtonItem?.tintColor = appColor.UIGreen
        
        // Cria o picker de data
        createDatePicker()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        selectedIcon = nil
    }
    
    @IBAction func click_DoneBtn(segue: UIStoryboardSegue) {
        var personNameOk:Bool = false
        var objectNameOk:Bool = false
        var datePickerOk:Bool = false
        
        /// Confere campo vazio e avisa que é obrigatorio
        if (personNameInput.text != ""){
            personNameOk = true
        } else {
            callWarning(popupTitle: "Warning!", popupMessage: "Can't lend object without name")
        }
        if (objectNameInput.text != ""){
            objectNameOk = true
        } else {
            callWarning(popupTitle: "Warning!", popupMessage: "Can't lend object for someone without name")
        }
        if (datePicker.text != ""){
           datePickerOk = true
        } else {
            callWarning(popupTitle: "Warning!", popupMessage: "If you wish to lend an object without return date, use the quick add button on the home screen")
        }
        
        /// Adiciona todos parametros do objeto
        if (personNameOk && objectNameOk && datePickerOk){
            
            // Calcula data de notificacao
            let endDate = returnDate.timeIntervalSince1970
            let startDate = Date().timeIntervalSince1970
            let numberOfDays = (endDate-startDate)
            let notificationDate = Int(round(numberOfDays))
            
            // Soma contador de objetos emprestados
            object.objectCounter+=1
            // Cor inicial da celula
            object.textColorList.insert(appColor.Blue1, at: 0)
            // Salva icone do objecto escolhido /// TODO: Se pessoa nao escolhe, fica icone padrao
            if (selectedIcon != nil) {
                object.objectImageList.insert( selectedIcon, at: 0 )
                selectedIcon = nil
            } else {
                object.objectImageList.insert( "IconPlaceHolder", at: 0 )
            }
            // Salva data de inicio, sendo no momento de criacao
            object.objectLoanDateList.insert(Date(), at: 0)
            // Cria um identificador para criar notificacao do objeto
            object.objectnotificationIdentifier.insert(("Timer"+String(object.objectCounter)), at: 0)
            
            // Adciona nome da pessoa na lista
            object.peopleNameList.insert(personNameInput.text!, at: 0)
            // Adciona nome do objeto na lista
            object.objectNameList.insert(objectNameInput.text!, at: 0)
        
            // Adciona DataFinal e DataDeNotificacao na lista
            object.objectLoanReturnList.insert(returnDate, at: 0)
            object.objectNotificationDateList.insert(notificationDate, at: 0)
            
            // Adciona comentario na lista
            if (noteTextInput.text != ""){
                object.objectObsList.insert(noteTextInput.text!, at: 0)
            } else {
                object.objectObsList.insert(" ", at: 0)
            }
        }
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // Funcao que alerta usuario sobre erro
    func callWarning(popupTitle:String, popupMessage:String){
        // create the alert
        let alert = UIAlertController(title: popupTitle, message: popupMessage, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension NewLendViewController {
    
    func createDatePicker(){
        // Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.barTintColor = appColor.UIBlack
        toolbar.tintColor = appColor.UIGreen
        
        // Done button for toolbar
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: false)
        
        // insert Toolbar is picker
        datePicker.inputAccessoryView = toolbar
        datePicker.inputView = picker
        picker.backgroundColor = appColor.UIBlack
        picker.setValue(appColor.UIBlue1, forKey: "textColor")
        
        // Format picker
        picker.datePickerMode = .date
    }
    
    @objc func donePressed(){
        // Format date
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let dateString = formatter.string(from: picker.date)
        
        datePicker.text = "\(dateString)"
        returnDate = picker.date
        self.view.endEditing(true)
    }
}
