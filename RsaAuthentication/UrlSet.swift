//
//  UrlSet.swift
//  RsaAuthentication
//
//  Created by 永田大祐 on 2017/12/31.
//  Copyright © 2017年 永田大祐. All rights reserved.
//

import UIKit

protocol PostMethod:class
{
    func postMethod(txt:String)->String?
}

protocol CheckSt:class
{
    func checkSt(textField:UITextField,vc:UIViewController?,tryField:UILabel)
    var result:String{get set}
}

class UrlSet:PostMethod,CheckSt {
    var result: String = ""
    
    
    func postMethod(txt:String)->String?
    {
        
        let urlString = "https://localhost:8000/?\(txt.replacingOccurrences(of: " ", with: "+"))"
        var request = URLRequest(url: URL(string:urlString)!)
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard (data != nil) else{ return }
            
            self.result = String(data: data!,
                                           encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
            
        })
        
        task.resume()
        return result
        
    }
    
     func checkSt(textField:UITextField,vc:UIViewController?,tryField:UILabel)
    {
        
        _ = postMethod(txt:textField.text!)
        
        Thread.sleep(forTimeInterval: 1.7)
        guard result != "password" else {
            
            let vcset = vc?.storyboard!.instantiateViewController( withIdentifier: "segue" )
            vc?.present(vcset!, animated: true, completion: nil)
            return
            
        }
        
        tryField.text = "try"
        
    }
}

