//
//  ThreeCardDraw.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/24.
//

import SwiftUI

struct ThreeCardDrawImage: View {
    
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
    }
}

struct ThreeCardDraw_Previews: PreviewProvider {
    static var previews: some View {
        ThreeCardDrawImage(imageName: "00-TheFool")
    }
}
