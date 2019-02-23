//
//  EndPointType.swift
//  GiphyDemo
//
//  Created by Ratnadeep Govande on 20/02/19.
//  Copyright © 2019 Ratnadeep Govande. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var httpHeader: HTTPHeaders? { get }
}
