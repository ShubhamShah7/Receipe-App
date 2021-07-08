//
//  ViewController.swift
//  Receipe App
//
//  Created by DCS on 24/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView:UIImageView = {
       let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "2")
        return img
    }()
    
    public let buttton:UIButton = {
       let btn = UIButton()
        btn.setTitle("Enter", for: .normal)
        btn.backgroundColor = .gray
        btn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        return btn
    }()
    
    @objc func nextPage(){
        let vc = Part2()
        navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Receipe App"
//        view.backgroundColor = .brown
        
        view.addSubview(imageView)
        view.addSubview(buttton)
    }
    override func viewDidLayoutSubviews() {
        imageView.frame = CGRect(x:20,y:130, width: view.width-40, height: 180)
        buttton.frame = CGRect(x:20,y:imageView.bottom+20,width: view.width-40, height: 40)
    }

}

