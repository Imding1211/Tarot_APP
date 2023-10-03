//
//  ThreeCardShowView.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/9/4.
//

import SwiftUI

struct ThreeCardShowView: View {
    
    let cardID: Int
    let imageName: String
    let message: String
    let isReversed: Bool
    let isTimeOn: Bool
    
    @State var showCardSheet: Bool = false
    
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
                    .rotationEffect(isReversed ? .degrees(180) : .degrees(0))
                    .draggable(imageName)
                    .onTapGesture {
                        showCardSheet.toggle()
                    }
                
                Text(isTimeOn ? message : "")
                    .font(.title3)
                    .frame(maxWidth: 120, maxHeight: 10)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .padding()
                    .cornerRadius(20)
                    .shadow(color: .white, radius: 5)
            }
        }
        .sheet(isPresented: $showCardSheet) {
            ShowCardView(cardState: cardID, isReversed: isReversed)
        }
    }
}

struct ThreeCardShowView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeCardShowView(cardID: 12, imageName: "11-Justice", message: "Past", isReversed: true, isTimeOn: true)
    }
}
