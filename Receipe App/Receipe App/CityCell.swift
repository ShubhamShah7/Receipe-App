//
//  CityCell.swift
//  Receipe App
//
//  Created by DCS on 25/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {
    
    private let myImageView:UIImageView = {
       let img = UIImageView()
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 5
        return img
    }()
    
    private let myLabel:UILabel = {
       let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.backgroundColor = .white
        lbl.font = .boldSystemFont(ofSize:20)
        return lbl
    }()
    
    private let textview1:UITextView = {
        let txt = UITextView()
        txt.isEditable = false
        txt.backgroundColor = .white
        txt.textAlignment = .left
        return txt
    }()
    
    private let textview2:UITextView = {
        let txt = UITextView()
        txt.isEditable = false
        txt.backgroundColor = .white
        txt.textAlignment = .left
        txt.textColor = .green
        txt.text = "Added 4 Days Ago"
        return txt
    }()
    
    public let button:UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(contentsOfFile: "chevron.right.2"), for: .normal)
        btn.tintColor = .blue
        return btn
    }()
    
    func setup(title name:String, and index:Int)
    {
        myImageView.image = UIImage(named: name)
        myLabel.text = name
        button.tag = index
        setupUI(at: index)
    }
    
    private func setupUI(at index:Int)
    {
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        contentView.addSubview(button)
        contentView.addSubview(textview1)
        contentView.addSubview(textview2)
        myImageView.frame = CGRect(x:20,y:5,width: 120, height: 100)
        myLabel.frame = CGRect(x:myImageView.right + 20, y:-10,width: 140,height: 60)
        textview1.frame = CGRect(x:myImageView.right+20, y:30, width: 140, height: 40)
        textview2.frame = CGRect(x:myImageView.right+20, y:70, width: 140, height: 40)
        button.frame = CGRect(x:contentView.width-50,y:10,width: 40,height: 80)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
