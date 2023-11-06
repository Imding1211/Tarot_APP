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
        .font(.title3)
        .foregroundColor(Color.black)
        .fontWeight(.heavy)
        .frame(maxWidth: 220, maxHeight: 40)
        .background(Color.white.opacity(0.6))
        .cornerRadius(20)
        .shadow(color: .white, radius: 5)
    }
}

struct DailyCardButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        DailyCardButtonLabel(message: "Draw", iconName: "arrow.triangle.2.circlepath")
    }
}
