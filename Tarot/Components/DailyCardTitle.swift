//
//  DailyCardTitle.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/11.
//

import SwiftUI

struct DailyCardTitle: View {
    
    let message: String
    
    var body: some View {
        Text(message)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(Color.black)
            .padding()
            .background(Color.white.opacity(0.6))
            .cornerRadius(20)
            .shadow(color: .white, radius: 5)
    }
}

struct DailyCardTitle_Previews: PreviewProvider {
    static var previews: some View {
        DailyCardTitle(message: "The Fool")
    }
}
