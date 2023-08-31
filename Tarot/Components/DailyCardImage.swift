//
//  DailyCardImage.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/11.
//

import SwiftUI

struct DailyCardImage: View {
    
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .opacity(0.8)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
            .shadow(color: .white, radius: 5)
            .padding()
    }
}

struct DailyCardImage_Previews: PreviewProvider {
    static var previews: some View {
        DailyCardImage(imageName: "00-TheFool")
    }
}
