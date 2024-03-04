//
//  ViewController.swift
//  UBorrow
//
//  Created by Lucas Barros on 08/01/18.
//  Copyright © 2018 Lucas C Barros. All rights reserved.
//

import UIKit

/// Variaveis globais
// Instancia objeto com as lista de objetos
var object:Object = Object()
var businessControll = BusinessControll()
var notificationControll = NotificationControll()
let appColor = AppColors()

class ViewController: UIViewController {
    
    //Outlets PopUpView
    @IBOutlet var _quickAddPopUpView: UIView!
    @IBOutlet weak var _objectTableView: UITableView!
    @IBOutlet weak var _objectNameInput: UITextField!
    @IBOutlet weak var _personNameInput: UITextField!
    @IBOutlet weak var popUpMessageLabel: UILabel!
    @IBOutlet weak var popUpDoneButton: UIButton!
    @IBOutlet weak var popUpCancelButton: UIButton!
    
    //Outlets MainView
    @IBOutlet weak var navBarView: UINavigationItem!
    @IBOutlet weak var lineView: UIView!
    
    
    // Efeito de Blur do PopUp
    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
    
    // Indice da celula selecionada
    var cellIndex:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //View backgrounds
        view.backgroundColor = appColor.UIBlack
        navigationController?.navigationBar.backgroundColor = appColor.UIBlack
        navigationController?.view.backgroundColor = appColor.UIBlack
        navigationController?.navigationBar.barTintColor = appColor.UIBlack
        _objectTableView.backgroundColor = appColor.UIBlack
        
        // Corrige aparencia PopUpView
        _quickAddPopUpView.layer.cornerRadius = 10
        _quickAddPopUpView.layer.borderWidth = 5
        _quickAddPopUpView.layer.borderColor = appColor.UIGreen.cgColor
        _quickAddPopUpView.backgroundColor = appColor.UIBlack
        popUpDoneButton.setTitleColor(appColor.UIBlue3, for: .normal)
        popUpCancelButton.setTitleColor(appColor.UIBlue3, for: .normal)
        popUpMessageLabel.textColor = appColor.UIBlue1
        _objectNameInput.textColor = appColor.UIBlue1
        _objectNameInput.alpha = 0.65
        _personNameInput.textColor = appColor.UIBlue1
        _personNameInput.alpha = 0.65
        
        // Corrige a cor do titulo da NavBar
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: appColor.UIGreen]
        
        // Atualiza informacoes da TableView
        _objectTableView.reloadData()
        
        // Pede Permissao para dar notificacoes
        notificationControll.notificationPermission()
        
        //Fix navBar Colors
        navBarView.leftBarButtonItem?.tintColor = appColor.UIGreen
        navBarView.rightBarButtonItems?.last?.tintColor = appColor.UIGreen
        navBarView.rightBarButtonItems?.first?.tintColor = appColor.UIGreen
        lineView.backgroundColor = appColor.UIGreen
        navBarView.backBarButtonItem?.tintColor = appColor.UIGreen
        
        if (object.personalStatusArray[0] == 0){
            notificationControll.loopAddNotification()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: Notification.Name.UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: Notification.Name.UIResponder.keyboardWillShowNotification, object: nil)

    }
    
    @objc func keyboardWillAppear() {
        _quickAddPopUpView.center = CGPoint(x:view.layer.frame.width/2,y: view.layer.frame.height/3)
        view.willRemoveSubview(_quickAddPopUpView)
        view.addSubview(_quickAddPopUpView)
    }
    
    @objc func keyboardWillDisappear() {
        _quickAddPopUpView.center = CGPoint(x:view.layer.frame.width/2,y: view.layer.frame.height/2)
        view.willRemoveSubview(_quickAddPopUpView)
        view.addSubview(_quickAddPopUpView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    // Anima & Cria tela de PopUp
    func animateIn(){
        // Esconde NavBar
        self.navigationController?.isNavigationBarHidden = true
        
        // Cria Blur
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.alpha = 0.85
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        
        // Adciona PopUp na tela
        self.view.addSubview(_quickAddPopUpView)
        _quickAddPopUpView.center = CGPoint(x:view.layer.frame.width/2,y: view.layer.frame.height/2)
        
        _quickAddPopUpView.transform = CGAffineTransform.init(scaleX: 1.3, y:1.3)
        _quickAddPopUpView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self._quickAddPopUpView.alpha = 1
            self._quickAddPopUpView.transform = CGAffineTransform.identity
        }
    }
    
    // Anima & remove tela de PopUp
    func animateOut(){
        UIView.animate(withDuration: 0.3, animations: {
            self._quickAddPopUpView.transform = CGAffineTransform.init(scaleX:1.3, y:1.3)
            self._quickAddPopUpView.alpha = 0
            
        }) { (success:Bool) in
                self._quickAddPopUpView.removeFromSuperview()
            for subview in self.view.subviews {
                if subview is UIVisualEffectView {
                    subview.removeFromSuperview()
                }
            }
        }
        self.navigationController?.isNavigationBarHidden = false
    }

    /// Button Actions
    // Chama janela de adcionar emprestimo simples
    @IBAction func click_AddBtn(_ sender: Any) {
        animateIn()
    }

    // Cancela e fecha janela de emprestimo simples
    @IBAction func click_CancelBtn(_ sender: Any) {
        animateOut()
    }
    
    @IBAction func click_DoneBtn(_ sender: Any) {

        if(_objectNameInput.text!.isEmpty ){
            callWarning(popupTitle: "Atention", popupMessage: "Can't create a loan without an object's name")
        } else if(_personNameInput.text!.isEmpty){
            callWarning(popupTitle: "Atention", popupMessage: "Can't create a loan without a person's name")
        } else {
            // Pega Nome da pessoa e do objeto e cria nova celula
            object.peopleNameList.insert(_personNameInput.text!, at: 0)
            object.objectNameList.insert(_objectNameInput.text!, at: 0)
            // Sempre verde com icone padrão
            object.textColorList.insert(appColor.Green, at: 0)
            
            // Codigo para icone aleatorio em QuickLoan
//            let Icons = IconSelectViewController()
//            object.objectImageList.insert(Icons.iconList[Int(arc4random_uniform(UInt32(Icons.iconList.count)))], at: 0)
            object.objectImageList.insert("Camera" , at: 0)
            
            object.objectCounter+=1
            let newNotificationIdentifier = " "+String(object.objectCounter)
                
            object.objectObsList.insert(" ", at: 0)
            object.objectLoanDateList.insert((Date()-1200), at: 0)
            object.objectLoanReturnList.insert((Date()-1200), at: 0)
            object.objectNotificationDateList.insert(-1, at: 0) // Tempo até notificacao
            object.objectnotificationIdentifier.insert(newNotificationIdentifier, at: 0)
            
            // Recarrega Tabela
            _objectTableView.reloadData()
            animateOut()
            
            // Zera Campos antes de sair
            _personNameInput.text = ""
            _objectNameInput.text = ""
 
            viewDidLoad()
        }
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


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // TableView Functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return object.objectCounter
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ObjectCell", for: indexPath) as! ObjectCell
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = appColor.UIBlack
        cell.selectedBackgroundView = bgColorView
        
        businessControll.updateObjectColor(index: indexPath.section)
        
        let endDate = object.objectLoanReturnList[indexPath.section].timeIntervalSince1970
        let startDate = object.objectLoanDateList[indexPath.section].timeIntervalSince1970
        let numberOfDays = ((((endDate-startDate)/60)/60)/24)
        cell.numberOfDaysLabel.text = ("\(Int(round(numberOfDays))) Days")
        if( object.textColorList[indexPath.section] == appColor.Green){
            cell.numberOfDaysLabel.isHidden = true
        } else {
            cell.numberOfDaysLabel.isHidden = false
        }
        
        cell._objectCellName.text = object.objectNameList[indexPath.section]
        cell._objectCellPersonName.text = object.peopleNameList[indexPath.section]

        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = businessControll.hexToUIColor(hex: object.textColorList[indexPath.section]).cgColor
        cell._objectCellPersonName.textColor = businessControll.hexToUIColor(hex: object.textColorList[indexPath.section])
        cell._objectCellName.textColor = businessControll.hexToUIColor(hex: object.textColorList[indexPath.section])
        cell.numberOfDaysLabel.textColor = businessControll.hexToUIColor(hex: object.textColorList[indexPath.section])
        cell.arrowLabel.setTitleColor(businessControll.hexToUIColor(hex: object.textColorList[indexPath.section]), for: .normal)
        
        // Cor da imagem de acordo com cor da celula
        let tintImage = UIImage(named: object.objectImageList[indexPath.section])?.withRenderingMode(.alwaysTemplate)
        cell._objectCellIcon.image = tintImage
        cell._objectCellIcon.tintColor = businessControll.hexToUIColor(hex: object.textColorList[indexPath.section])
        
        // Cor do circulo da imagem com sombra
        cell.iconHolderImage.backgroundColor = appColor.UIBlack
        cell.iconHolderImage.layer.opacity = 0.5
        cell.iconHolderImage.layer.shadowRadius = 1
        cell.iconHolderImage.layer.shadowColor = businessControll.hexToUIColor(hex: object.textColorList[indexPath.section]).cgColor
        cell.iconHolderImage.layer.shadowOpacity = 1
        cell.iconHolderImage.layer.shadowOffset = CGSize(width: 2, height: 2)
        cell.iconHolderImage.layer.cornerRadius = cell.iconHolderImage.layer.frame.width/2
        cell.iconHolderImage.layer.borderColor = businessControll.hexToUIColor(hex: object.textColorList[indexPath.section]).cgColor
        
        //Change cell BgColor
        cell.backgroundColor = appColor.UIBlack
        cell.contentView.backgroundColor = appColor.UIBlack
        
        return cell
    }
    
    // Função deleta itens da lista
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            
            businessControll.removeObjectAtIndex(index: indexPath.section)
            
            _objectTableView.reloadData()
        }
    }
    
    /// TableView Functions para deixar espaço entre celulas
    // There is just one row in every section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    // Abre o item para ver detalhes
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellIndex = indexPath.section
        
        performSegue(withIdentifier: "lendDetailSegue", sender: self)
    }
    
    // Passa o indice da celular aberta
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? LendDetailViewController
        destination?.selectedCell = cellIndex
    }
}

