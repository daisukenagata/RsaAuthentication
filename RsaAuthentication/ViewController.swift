//
//  ViewController.swift
//  RsaAuthentication
//
//  Created by 永田大祐 on 2017/12/23.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var EnterField: UITextField!
    @IBOutlet weak var tryField: UILabel!
    
    static var result : String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EnterField.delegate = self
        self.tryField.text = ""
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool 
    {
        
        textField.resignFirstResponder()
        _ = String.postMethod(txt:self.EnterField.text!)
        
        Thread.sleep(forTimeInterval: 1.5)
        
        guard ViewController.result != "password" else {
            
            let vc = self.storyboard!.instantiateViewController( withIdentifier: "segue" )
            self.present(vc, animated: true, completion: nil)
            return true
            
        }
        
        self.tryField.text = "try"
        
        return true
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        return string.isEmpty || string.range(of: "[a-zA-Z0-9]+",
                                              options: .regularExpression,
                                              range: nil,
                                              locale: nil) != nil
    }
}
