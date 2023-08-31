//
//  ThreeCardSpreadImage.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/24.
//

import SwiftUI

struct ThreeCardSpreadImage: View {
    
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 125, height: 125)
    }
}

struct ThreeCardSpreadImage_Previews: PreviewProvider {
    static var previews: some View {
        ThreeCardSpreadImage(imageName: "00-TheFool")
    }
}
