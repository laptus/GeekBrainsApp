//
//  VKDataAccessor.swift
//  GeekBrainsApp
//
//  Created by Laptev Sasha on 10/12/2017.
//  Copyright © 2017 Laptev Sasha. All rights reserved.
//
import Foundation
import Alamofire
import VK_ios_sdk

struct Enviroment{
    var vkEnv: VKEnviromentUrl
}

struct VKEnviromentUrl{
    let authBaseUrl = URL(string: "https://oauth.vk.com")!
    let baseUrl = URL(string: "https://api.vk.com")!
    var clientId = "6292833"
    var apiVersion = "5.68"
}

class VKAuth{
    var enviroment: VKEnviromentUrl
    
    init(enviroment: VKEnviromentUrl){
        self.enviroment = enviroment
    }
    
    
    
}

class VKDataAccessor{
    
}
