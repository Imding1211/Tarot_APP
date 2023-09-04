//
//  ThreeCardShowView.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/9/4.
//

import SwiftUI

struct ThreeCardShowView: View {
    
    let imageName: String
    let message: String
    let position: Bool
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 100, height: 230)
                .shadow(color: .white, radius: 5)
                .foregroundColor(Color.gray)
                .opacity(0.6)
            
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5)
                    .shadow(color: .white, radius: 5)
                    .frame(width: 90, height: 150)
                    .rotationEffect(position ? .degrees(0) : .degrees(180))
                    .draggable(imageName)
                
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
    }
}

struct ThreeCardShowView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeCardShowView(imageName: "11-Justice", message: "Past", position: true)
    }
}
