//
//  ViewController.swift
//  PTBH
//
//  Created by Nguyen Huu Phuoc on 4/14/18.
//  Copyright © 2018 Nguyen Huu Phuoc. All rights reserved.
//

import UIKit

@IBDesignable

class roundbutton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWith: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWith
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }


    }
}

