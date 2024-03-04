//
//  LendDetailViewController.swift
//  UBorrow
//
//  Created by Lucas Barros on 11/01/18.
//  Copyright © 2018 Lucas C Barros. All rights reserved.
//

import UIKit

class LendDetailViewController: UIViewController {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var observationLabel: UILabel!
    @IBOutlet weak var loanLabel: UILabel!
    
    @IBOutlet weak var initialDateLabel: UILabel!
    @IBOutlet weak var ObsLabel: UILabel!
    @IBOutlet weak var devolutionLabel: UILabel!
    
    @IBOutlet weak var topLine: UIView!
    @IBOutlet weak var topMidLine: UIView!
    @IBOutlet weak var lowMidLine: UIView!
    @IBOutlet weak var lowLine: UIView!
    
    var selectedCell:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _editIcon = object.objectImageList[selectedCell]
        iconImage.image = UIImage(named: object.objectImageList[selectedCell])
        personLabel.text = object.peopleNameList[selectedCell]
        observationLabel.text = object.objectObsList[selectedCell]
        
        // Format date
        dateLabel.text =  businessControll.formatDate(refDate: object.objectLoanReturnList[selectedCell])
        initialDateLabel.text = businessControll.formatDate(refDate: object.objectLoanDateList[selectedCell])
        
        personLabel.textColor = businessControll.hexToUIColor(hex: object.textColorList[selectedCell])
        observationLabel.textColor = businessControll.hexToUIColor(hex: object.textColorList[selectedCell])
        dateLabel.textColor = businessControll.hexToUIColor(hex: object.textColorList[selectedCell])
        loanLabel.textColor = businessControll.hexToUIColor(hex: object.textColorList[selectedCell])
        
        initialDateLabel.textColor = businessControll.hexToUIColor(hex: object.textColorList[selectedCell])
        ObsLabel.textColor = businessControll.hexToUIColor(hex: object.textColorList[selectedCell])
        devolutionLabel.textColor = businessControll.hexToUIColor(hex: object.textColorList[selectedCell])
        
        topLine.backgroundColor = businessControll.hexToUIColor(hex: object.textColorList[selectedCell])
        topMidLine.backgroundColor = businessControll.hexToUIColor(hex: object.textColorList[selectedCell])
        lowMidLine.backgroundColor = businessControll.hexToUIColor(hex: object.textColorList[selectedCell])
        lowLine.backgroundColor = businessControll.hexToUIColor(hex: object.textColorList[selectedCell])
        
        navigationItem.backBarButtonItem?.tintColor = appColor.UIGreen
        navigationItem.title = object.objectNameList[selectedCell]
        
        // Cor da imagem de acordo com cor da celula
        iconImage.image = UIImage(named: object.objectImageList[selectedCell])?.withRenderingMode(.alwaysTemplate)
        iconImage.tintColor = businessControll.hexToUIColor(hex: object.textColorList[selectedCell])
        
        //View backgrounds
        view.backgroundColor = appColor.UIBlack
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Envia informacoes para tela de edicao
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? EditLendViewController
        destination?.selectedCell = selectedCell
    }
}
