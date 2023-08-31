//
//  CardInfo.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/5.
//

import Foundation

struct CardInfo : Identifiable {
    var id              : UUID   = UUID()
    var cardID          : Int
    var cardType        : String
    var englishName     : String
    var chineseName     : String
    var imageName       : String
    var keyWordUpright  : String
    var keyWordReversed : String
    var describe        : String
}
