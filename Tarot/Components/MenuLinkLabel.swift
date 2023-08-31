//
//  MenuLinkLabel.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/12.
//

import SwiftUI

struct MenuLinkLabel: View {
    
    let message: String
    
    var body: some View {
        Text(message)
            .padding()
            .frame(maxWidth: 250)
            .background(Color.white.opacity(0.6))
            .cornerRadius(20)
            .shadow(color: .white, radius: 5)
            .font(.title)
            .foregroundColor(Color.black)

    }
}

struct MenuLinkLabel_Previews: PreviewProvider {
    static var previews: some View {
        MenuLinkLabel(message: "Daily Tarot Draw")
    }
}
