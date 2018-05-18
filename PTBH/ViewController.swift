//
//  ViewController.swift
//  PTBH
//
//  Created by Nguyen Huu Phuoc on 4/14/18.
//  Copyright © 2018 Nguyen Huu Phuoc. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
    
    @IBOutlet weak var lb_TextA: UITextField!
    @IBOutlet weak var lb_TextB: UITextField!
    @IBOutlet weak var lb_TextC: UITextField!
    @IBOutlet weak var lb_ThongBao: UILabel!
    @IBOutlet weak var lb_X1: UILabel!
    @IBOutlet weak var lb_X: UILabel!
    @IBOutlet weak var lb_X2: UILabel!
    @IBOutlet weak var TextIn_X1: UITextField!
    @IBOutlet weak var TextIn_X: UITextField!
    @IBOutlet weak var TextIn_X2: UITextField!
    var numbers:String="0123456789.-"
    override func viewDidLoad() {
        super.viewDidLoad()
        // hiện thị bàn phím số khi nhấn vào text input
        lb_TextA.keyboardType = UIKeyboardType.numberPad
        lb_TextB.keyboardType = UIKeyboardType.numberPad
        lb_TextC.keyboardType = UIKeyboardType.numberPad
        
        
        // Ẩn kết quả
        lb_ThongBao.isHidden = true
        lb_X1.isHidden = true
        lb_X.isHidden = true
        lb_X2.isHidden = true
        TextIn_X1.isHidden = true
        TextIn_X.isHidden = true
        TextIn_X2.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //action 
    
    @IBAction func btn_NhapLai(_ sender: Any) {
        lb_TextA.text = ""
        lb_TextB.text = ""
        lb_TextC.text = ""
        lb_ThongBao.isHidden = true
        lb_X1.isHidden = true
        lb_X.isHidden = true
        lb_X2.isHidden = true
        TextIn_X1.isHidden = true
        TextIn_X.isHidden = true
        TextIn_X2.isHidden = true
        
        lb_TextA.isEnabled = true
        lb_TextB.isEnabled = true
        lb_TextC.isEnabled = true
        
    }
    @IBAction func btn_KetQua(_ sender: Any) {
        TinhToan()
    }
    
    func checkTextABC() -> Bool
    {
        for ch in lb_TextA.text!.characters
        {
            if(!numbers.contains(String(ch)))
            {
                return false
            }
        }
        
        for ch in lb_TextB.text!.characters
        {
              if(!numbers.contains(String(ch)))
            {
                return false
            }
        }
        
        for ch in lb_TextC.text!.characters
        {
              if(!numbers.contains(String(ch)))
            {
                return false
            }
        }
        
        return true
    }
    
//    func KiemTraNhapVao () ->Bool
//    {
//      
//        
//        if (checkTextABC())
//        {
//            return true
//        }
//        return false
//    }
    
    
    func TinhToan (){

        if(checkTextABC())
        {
            
            if (lb_TextA.text == "" || lb_TextB.text == "" || lb_TextC.text == "")
            {
                lb_ThongBao.isHidden = false
                lb_ThongBao.text = "Bạn chưa nhập các số."
                lb_TextA.isEnabled = false
                lb_TextB.isEnabled = false
                lb_TextC.isEnabled = false
            }
            else
            {
                let Bien_A: Double = Double(lb_TextA.text!)!
                let Bien_B: Double = Double(lb_TextB.text!)!
                let Bien_C: Double = Double(lb_TextC.text!)!
                let Bien_DelTa = (Bien_B * Bien_B) - (4 * Bien_A * Bien_C)
                if (Bien_A == 0)
                {
                    if (Bien_B == 0)
                    {
                        if (Bien_C == 0)
                        {
                            lb_ThongBao.isHidden = false
                            lb_ThongBao.text = "Phương trình vô số nghiệm."
                            lb_TextA.isEnabled = false
                            lb_TextB.isEnabled = false
                            lb_TextC.isEnabled = false
                            
                        }
                        else
                        {
                            lb_ThongBao.isHidden = false
                            lb_ThongBao.text = "Phương trình vô nghiệm."
                            lb_TextA.isEnabled = false
                            lb_TextB.isEnabled = false
                            lb_TextC.isEnabled = false
                            
                        }
                        
                    }
                    else
                    {
                        lb_ThongBao.isHidden = false
                        lb_X.isHidden = false
                        TextIn_X.isHidden = false
                        lb_ThongBao.text = "Phương trình có 1 nghiệm."
                        TextIn_X.text = String((-1 * Bien_C) / Bien_B)
                        lb_TextA.isEnabled = false
                        lb_TextB.isEnabled = false
                        lb_TextC.isEnabled = false
                        TextIn_X.isEnabled = false
                        
                        
                    }
                }
                else
                {
                    if (Bien_DelTa < 0 )
                    {
                        lb_ThongBao.isHidden = false
                        lb_ThongBao.text = "Phương trình vô nghiệm."
                        lb_TextA.isEnabled = false
                        lb_TextB.isEnabled = false
                        lb_TextC.isEnabled = false
                        
                    }
                    else
                    {
                        if(Bien_DelTa == 0)
                        {
                            lb_ThongBao.isHidden = false
                            lb_X.isHidden = false
                            TextIn_X.isHidden = false
                            lb_ThongBao.text = "Phương trình có nghiệm kép."
                            TextIn_X.text = String((-1 * Bien_C) / Bien_B)
                            TextIn_X.isEnabled = false
                            lb_TextA.isEnabled = false
                            lb_TextB.isEnabled = false
                            lb_TextC.isEnabled = false
                            
                        }
                        else
                        {
                            lb_ThongBao.isHidden = false
                            lb_X1.isHidden = false
                            lb_X2.isHidden = false
                            TextIn_X1.isHidden = false
                            TextIn_X2.isHidden = false
                            lb_ThongBao.text = "Phương trình có 2 nghiệm."
                            TextIn_X1.text = String(((-1 * Bien_B) + sqrt(Bien_DelTa))/(2 * Bien_A))
                            TextIn_X2.text = String(((-1 * Bien_B) - sqrt(Bien_DelTa))/(2 * Bien_A))
                            
                            lb_TextA.isEnabled = false
                            lb_TextB.isEnabled = false
                            lb_TextC.isEnabled = false
                            
                            TextIn_X1.isEnabled = false
                            TextIn_X2.isEnabled = false
                            
                        }
                    }
                }
            }
        }
        else
        {
            lb_ThongBao.isHidden=false
            lb_ThongBao.text = "Sai định dạng nhập vào!"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

