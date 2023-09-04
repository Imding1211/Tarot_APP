//
//  ThreeCardDrawView.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/9/4.
//

import SwiftUI

struct ThreeCardDrawView: View {
    
    let tasks: [String]
    
    @State var cardDatas: [CardInfo] = CardData().getData()
    
    var body: some View {
     
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(tasks, id: \.self) { task in
                    GeometryReader { geometry in
                        Image("CardBacks")
                            .resizable()
                            .opacity(0.8)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(5)
                            .shadow(color: .white, radius: 5)
                            .frame(width: 100)
                            .scaleEffect(0.9)
                            .draggable(task)
                            .rotation3DEffect(Angle(degrees: getPercentage(geo: geometry) * 30), axis: (x: 0.0, y: 1.0, z: 0.0))
                    }
                    .frame(width: 100, height: 200)
                }
            }
        }
    }
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
}

struct ThreeCardDrawView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeCardDrawView(tasks: ["", "", "", "", "", "", "", ""])
    }
}
