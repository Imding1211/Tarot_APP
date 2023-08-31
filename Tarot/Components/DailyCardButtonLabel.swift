//
//  DailyCardButton.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/10.
//

import SwiftUI

struct DailyCardButtonLabel: View {
    
    let message: String
    let iconName: String
    
    var body: some View {
        HStack {
            Text(message)
            Image(systemName: iconName)
        }
        .padding()
        .font(.title)
        .foregroundColor(Color.black)
        .fontWeight(.heavy)
        .background(Color.white.opacity(0.6))
        .cornerRadius(20)
        .shadow(color: .white, radius: 5)
    }
}

struct DailyCardButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        DailyCardButtonLabel(message: "翻牌", iconName: "arrow.triangle.2.circlepath")
    }
}
