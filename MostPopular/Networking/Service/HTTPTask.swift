//
//  HTTPTask.swift
//  GiphyDemo
//
//  Created by Ratnadeep Govande on 20/02/19.
//  Copyright © 2019 Ratnadeep Govande. All rights reserved.
//

import Foundation
public typealias HTTPHeaders =  [String:String]

public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Parameters?, bodyEncoding:ParameterEncoding, urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?, bodyEncoding: ParameterEncoding, urlParameters: Parameters?, additionaHenders: HTTPHeaders)
    
}
