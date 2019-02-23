//
//  GiphyEndPoint.swift
//  GiphyDemo
//
//  Created by Ratnadeep Govande on 20/02/19.
//  Copyright © 2019 Ratnadeep Govande. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case producation
}

public enum MostPopularAPI{
    case mostpopular(section: String, period: Int)
}

extension MostPopularAPI: EndPointType {    
    var environmentsBaseURL: String {
        switch NetworkManager.environment {
        case .producation: return "http://api.nytimes.com/svc/mostpopular"
            
        }
    }
    var baseURL: URL {
        guard let url = URL(string: environmentsBaseURL) else {fatalError("baseURL could not be be configured")}
        return url
    }
    
    var path: String {
        switch self {
        case .mostpopular(let section, let period):
            return "v2/mostviewed/\(section)/\(period).json?"
            
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .mostpopular( _, _):
            return .get
        }
    }
    
    
    var task: HTTPTask {
        switch self {
        case .mostpopular(_, _):
            return .requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: nil)
        }
    }
    
    var httpHeader: HTTPHeaders? {
       return nil
    }
    
    
}
