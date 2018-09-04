//
//  USURL.swift
//  FirstProject
//
//  Created by Muhammad Usman on 04/09/2018.
//  Copyright © 2018 Muhammad Usman. All rights reserved.
//

import UIKit

class USURL: NSObject {
    
    static let baseApi = "https://api.myjson.com/bins/lqfp0"
    
    class func header() -> [String:String] {
        return [:]
    }
    
    class func googleURL() -> URL {
        return URL(string: baseApi)!
    }

}
