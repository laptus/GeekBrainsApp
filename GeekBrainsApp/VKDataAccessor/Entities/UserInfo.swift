//
//  UserInfo.swift
//  GeekBrainsApp
//
//  Created by Laptev Sasha on 11/12/2017.
//  Copyright © 2017 Laptev Sasha. All rights reserved.
//

import Foundation

class UserInfo{
    var id: Int
    var name: String
    var avatarInfo: PhotoInfo
    
    init(id: Int, name: String, avatarUrl: URL){
        self.id = id
        self.name = name
        self.avatarInfo = PhotoInfo(avatarUrl)
    }
}
