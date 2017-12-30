//
//  ExtensionString.swift
//  RsaAuthentication
//
//  Created by 永田大祐 on 2017/12/31.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

extension String {
    
    static func postMethod(txt:String)->String?
    {
        
        let urlString = "https://localhost:8000/?\(txt.replacingOccurrences(of: " ", with: "+"))"
        var request = URLRequest(url: URL(string:urlString)!)
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard (data != nil) else{ return }
            
            ViewController.result = String(data: data!,
                                           encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
            
        })
        
        task.resume()
        return ViewController.result
        
    }
    
    static func checkSt(textField:UITextField,vc:UIViewController?,tryField:UILabel)
    {
        
        _ = String.postMethod(txt:textField.text!)
        Thread.sleep(forTimeInterval: 1.5)
        guard ViewController.result != "password" else {
            
            let vcset = vc?.storyboard!.instantiateViewController( withIdentifier: "segue" )
            vc?.present(vcset!, animated: true, completion: nil)
            return
            
        }
        
        tryField.text = "try"
        
    }
}

