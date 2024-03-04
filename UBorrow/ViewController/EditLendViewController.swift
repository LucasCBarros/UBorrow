//
//  EditLendViewController.swift
//  UBorrow
//
//  Created by Lucas Barros on 12/01/18.
//  Copyright © 2018 Lucas C Barros. All rights reserved.
//

import UIKit

// Variavel global da imagem do Icone
var _editIcon:String!

class EditLendViewController: UIViewController {

    @IBOutlet weak var iconSelectBtn: UIButton!
    @IBOutlet weak var objectName: UITextField!
    @IBOutlet weak var personName: UITextField!
    @IBOutlet weak var ObsLabel: UITextField!
    @IBOutlet weak var datePickerEdit: UITextField!
    
    var selectedCell:Int!
    
    let picker = UIDatePicker()
    var returnDate:Date!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(_editIcon == nil){
            iconSelectBtn.setImage(UIImage(named: object.objectImageList[selectedCell]), for: .normal)
        } else {
            iconSelectBtn.setImage(UIImage(named: _editIcon), for: .normal)
        }
        
        objectName.text = object.objectNameList[selectedCell]
        personName.text = object.peopleNameList[selectedCell]
        ObsLabel.text = object.objectObsList[selectedCell]
        
        objectName.textColor = businessControll.hexToUIColor(hex: object.textColorList[selectedCell])
        personName.textColor = businessControll.hexToUIColor(hex: object.textColorList[selectedCell])
        ObsLabel.textColor = businessControll.hexToUIColor(hex: object.textColorList[selectedCell])

        // Format date
        let dateString = businessControll.formatDate(refDate: object.objectLoanReturnList[selectedCell])
        
        datePickerEdit.attributedPlaceholder = NSAttributedString(string: dateString, attributes: [NSAttributedString.Key.foregroundColor: businessControll.hexToUIColor(hex: object.textColorList[selectedCell])])
        
        ObsLabel.attributedPlaceholder = NSAttributedString(string:"Enter a note", attributes: [NSAttributedString.Key.foregroundColor: businessControll.hexToUIColor(hex: object.textColorList[selectedCell])])
        
        // Cria o picker de data
        createDatePicker()
        
        //View backgrounds
        view.backgroundColor = appColor.UIBlack
        navigationItem.backBarButtonItem?.tintColor = appColor.UIGreen
        
        // Cor da imagem de acordo com cor da celula
        iconSelectBtn.setImage(UIImage(named: object.objectImageList[selectedCell])?.withRenderingMode(.alwaysTemplate), for: .normal)
        iconSelectBtn.tintColor = businessControll.hexToUIColor(hex: object.textColorList[selectedCell])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func click_DoneEditBtn(_ sender: Any) {
        
        // Adciona nome do objeto na lista
        if (personName.text != ""){
            object.peopleNameList[selectedCell] = personName.text!
        } else {
            // OBRIGATORIO
            callWarning(popupTitle: "Warning!", popupMessage: "Can't lend object for someone without name")
        }
        
        // Adciona nome da pessoa na lista
        if (objectName.text != ""){
            object.objectNameList[selectedCell] = objectName.text!
        } else {
            // OBRIGATORIO
            callWarning(popupTitle: "Warning!", popupMessage: "Can't lend object without name")
        }
        
        // Adciona comentario na lista
        if (ObsLabel.text != ""){
            object.objectObsList[selectedCell] = ObsLabel.text!
        } else {
            object.objectObsList[selectedCell] = " "
        }
        
        object.objectImageList[selectedCell] = _editIcon
        
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
}

extension EditLendViewController {
    
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
        datePickerEdit.inputAccessoryView = toolbar
        datePickerEdit.inputView = picker
        picker.backgroundColor = appColor.UIBlack
        picker.setValue(businessControll.hexToUIColor(hex: object.textColorList[selectedCell]), forKey: "textColor")
        
        // Format picker
        picker.datePickerMode = .date
    }
    
    @objc func donePressed(){
        // Format date
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let dateString = formatter.string(from: picker.date)
        
        datePickerEdit.text = "\(dateString)"
        returnDate = picker.date
        self.view.endEditing(true)
    }
}
