//
//  ThreeCardSpreadText.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/18.
//

import SwiftUI

struct ThreeCardSpreadText: View {
    
    let message: String
    
    var body: some View {
        Text(message)
            .font(.title3)
            .frame(maxWidth: 120)
            .fontWeight(.heavy)
            .foregroundColor(Color.black)
            .padding()
            .cornerRadius(20)
            .shadow(color: .white, radius: 5)
    }
}

struct ThreeCardSpreadText_Previews: PreviewProvider {
    static var previews: some View {
        ThreeCardSpreadText(message: "Past")
    }
}
