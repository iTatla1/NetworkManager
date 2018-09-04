//
//  NetworkManager.swift
//  FirstProject
//
//  Created by Muhammad Usman on 03/09/2018.
//  Copyright © 2018 Muhammad Usman. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class NetworkManager: NSObject {
    
    class func request (url: URL, method: HTTPMethod, parameters :Parameters, encoding: ParameterEncoding = URLEncoding.default, headers : HTTPHeaders = USURL.header(), progressText: String? = nil, showErrorMessage: Bool = false, vc: UIViewController, completion: @escaping (_ success: Bool, _ result: [String:Any]) -> ()) {
        
        if progressText != nil {
            SVProgressHUD.show(withStatus: progressText)
        }
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON { (response) in
            let result = response.result
            
            switch result {
            case .success(let json):
                let rServer = json as? [String: Any] ?? [:]
                if let status = rServer["status"] as? Int, status == 1 {
                    completion(true, rServer)
                }
                else{
                    if showErrorMessage {
                        let message = rServer["message"] as? String ?? "Some server error occured"
                        USUtility.showPopupMessageWithOkBtn(title: "Alert", message: message, vc: vc)
                        completion(false, rServer)
                    }
                }
                break
            case .failure(let error):
                print("Network Error: \(error.localizedDescription)")
                USUtility.showPopupMessageWithOkBtn(title: "Alert", message: "Some server error occured", vc: vc)
                completion(false,[:])
                break
            }
            SVProgressHUD.dismiss()
        }
    }

}
