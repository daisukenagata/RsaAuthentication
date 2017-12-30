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
    
    var result : String? = nil
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EnterField.delegate = self
        self.tryField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool 
    {
        
        textField.resignFirstResponder()
        _ = self.postMethod(txt:self.EnterField.text!)
        
        Thread.sleep(forTimeInterval: 1.5)
            
            if result  == "password" {
                
                let vc = self.storyboard!.instantiateViewController( withIdentifier: "segue" )
                self.present(vc, animated: true, completion: nil)
                
            }else{
                
                self.tryField.text = "try"
            }
        
        return true
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        return string.isEmpty || string.range(of: "[a-zA-Z0-9]+", options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    func postMethod(txt:String)->String?
    {
        
        let urlString = "https://localhost:8000/?\(txt.replacingOccurrences(of: " ", with: "+"))"
        
        
        var request = URLRequest(url: URL(string:urlString)!)

        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard (data != nil) else{ return }
            
            self.result = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String
            
        })
        
        task.resume()
        return self.result
        
    }

}
