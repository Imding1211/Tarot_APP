//
//  ThreeCardImage.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/24.
//

import SwiftUI

struct ThreeCardBackImage: View {
    
    let imageName: String
    var offSet: CGFloat
    var isShow: Bool
    
    var body: some View {
        Image(imageName)
            .resizable()
            .cornerRadius(10)
            .aspectRatio(contentMode: .fit)
            .frame(width: 250, height: 250)
            .opacity(isShow ? 0.9 : 0.6)
            .shadow(color: .white, radius: 5)
            .offset(y:offSet)
    }
}

struct ThreeCardBackImage_Previews: PreviewProvider {
    static var previews: some View {
        ThreeCardBackImage(imageName: "CardBacks", offSet: 0, isShow: true)
        
        ThreeCardBackImage(imageName: "CardBacks", offSet: 0, isShow: false)
    }
}
