//
//  ParameterEncoding.swift
//  GiphyDemo
//
//  Created by Ratnadeep Govande on 20/02/19.
//  Copyright © 2019 Ratnadeep Govande. All rights reserved.
//

import Foundation
public typealias Parameters = [String: Any]

public protocol ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
public enum ParameterEncoding {
    case urlEncoding
    case jsonEncoding
    case urlAndJsonEncoding
    
    
    public func encod(urlRequest: inout URLRequest , bodyParameters: Parameters?, urlParameters: Parameters?)  throws{
        
        do {
            switch self {
            case .urlEncoding:
                guard let urlParameters = urlParameters else { return }
                try URLParameterEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
            case .jsonEncoding:
                guard let bodyParameters = bodyParameters else { return }
                try JSONParameterEncoder().encode(urlRequest: &urlRequest, with: bodyParameters)
            case .urlAndJsonEncoding:
                guard let bodyParameters = bodyParameters, let urlParameters = urlParameters else {
                    return
                }
                try URLParameterEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
                try JSONParameterEncoder().encode(urlRequest: &urlRequest, with: bodyParameters)
                
                break
            }
        
        }catch{
            throw error
        }
    }
}


public enum NetworkError : String, Error {
    case parametersNil = "Parametres were nil"
    case encodingFailed = "Parameter encoding failed"
    case missingURL = "URL is nil"
}
