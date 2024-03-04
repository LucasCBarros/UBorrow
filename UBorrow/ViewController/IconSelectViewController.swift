//
//  IconSelectViewController.swift
//  UBorrow
//
//  Created by Lucas Barros on 11/01/18.
//  Copyright © 2018 Lucas C Barros. All rights reserved.
//

import UIKit

class IconSelectViewController: UIViewController {
    
    // Variavel para remover border da ultima celular selecionada na collection
    var lastItem:IndexPath? = IndexPath()
    
    // Todos icones da collection
    let iconList = ["Soccer Shoe.png", "Socks.png", "Mouse.png", "Pencil Case.png", "Headphone.png", "Disc.png",
                    "Tie.png", "Wallet.png", "iPhone Charger.png", "Medicine.png", "iPad.png", "Key.png",
                    "Portable.png", "Watch.png", "Toothbrush and Toothpaste.png", "Cat.png", "Hat.png" ,"ID Card.png",
                    "Notebook.png", "Calculator.png", "Power Adapter.png", "Bank Card.png", "Belt.png", "Pendrive.png",
                    "Computer.png", "Lighter.png", "Umbrella.png", "Cap.png", "Book.png", "Badge.png",
                    "Backpack.png", "Money.png", "Sunglasses.png", "Car Key.png", "Suitcase.png", "Feeding Bottle.png",
                    "Eyeglasses.png", "Purses.png", "Camera.png", "Towel.png", "Pacifier.png", "Water Bottle.png", "Snack.png"]
    
    // Imagem selecionada pelo usuario
    var selectedImage:String!
    
    @IBAction func click_DoneBtnIcon(_ sender: Any) {
        
        selectedIcon = selectedImage
        _editIcon = selectedImage
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //View backgrounds
        view.backgroundColor = appColor.UIBlack
    }
}

// Extensao para as funcoes da CollectionView
extension IconSelectViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Cria e popula collection com imagens
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "iconCollectionViewCell", for: indexPath) as! IconCollectionViewCell
        
        cell.iconImage.image = UIImage(named: iconList[indexPath.row])
        
        return cell
    }
    
    // Numero de elementos na collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconList.count
    }

    // Funcao para colocar borda na selecao do item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Remove border do item anterior
        let lastCell = collectionView.cellForItem(at: lastItem!)
        lastCell?.layer.borderWidth = 0
        
        // Coloca border no item selecionado
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 2.0
        cell?.layer.borderColor = UIColor.green.cgColor
        // Salva icone selecionado
        selectedImage = iconList[indexPath.row]
        
        // Salva indice do ultimo item selecionado
        lastItem = indexPath
    }

}

