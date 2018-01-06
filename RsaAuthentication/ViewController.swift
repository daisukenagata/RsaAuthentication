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
    var urlSet = UrlSet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EnterField.delegate = self
        self.tryField.text = ""
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        
        textField.resignFirstResponder()
        urlSet.postMethod(tex:EnterField.text!,vc:self,tryField:tryField)
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
