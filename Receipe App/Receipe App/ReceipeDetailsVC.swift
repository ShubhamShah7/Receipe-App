//
//  ReceipeDetailsVC.swift
//  Receipe App
//
//  Created by DCS on 01/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ReceipeDetailsVC: UIViewController {

    var food_item:String = ""
    var food_no:Int32 = 0
    
    private let myImage:UIImageView = {
       let img=UIImageView()
        img.clipsToBounds = true
        img.contentMode = .scaleToFill
        img.layer.cornerRadius = 10
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        view.backgroundColor = .white
        view.addSubview(myImage)
        setupUI(title: food_item)
    }	
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myImage.frame = CGRect(x:10,y:view.safeAreaInsets.top+5,width: view.width-20, height: 400)
    }
    func setupUI(title name:String)
    {
        myImage.image = UIImage(named: name)
    }

}
