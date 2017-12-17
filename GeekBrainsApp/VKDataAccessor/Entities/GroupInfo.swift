//
//  PhotoInfo.swift
//  GeekBrainsApp
//
//  Created by Laptev Sasha on 11/12/2017.
//  Copyright © 2017 Laptev Sasha. All rights reserved.
//

import Foundation

class GroupInfo{
    let id: Int
    let name: String
    let avatarInfo: PhotoInfo
    
    init (id: Int, name: String,url: URL){
        self.id = id
        self.name = name
        self.avatarInfo = PhotoInfo(url)
    }
}
