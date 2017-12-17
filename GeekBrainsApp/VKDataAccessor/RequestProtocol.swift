//
//  RequestProtocol.swift
//  GeekBrainsApp
//
//  Created by Laptev Sasha on 11/12/2017.
//  Copyright © 2017 Laptev Sasha. All rights reserved.
//

import Foundation
import Alamofire

protocol RequestProtocol: URLRequestConvertible {
    var baseURL: URL {get}
    var path: URL {get}
    var method: Method {get}
    var params: Parameters{get}
    var fullUrl: URL{get}
}

extension RequestRouter{
    var fullURL: URL {
        return baseUrl.appendingPathComponent(path)
    }
    
    func asURLRequest() throws -> URLRequest{
        var urlRequest = URLRequest(url: fullURL)
        urlRequest.httpMethod = method.rawValue
        return try URLEncoding.default.encode(urlRequest, with: parameters)
    }
    
    
}
