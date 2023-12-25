//
//  MenuView.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/7.
//

import SwiftUI

struct MenuView: View {

    var body: some View {
        
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("TopColor"), Color("BottomColor")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                VStack(spacing: 30) {
                    NavigationLink {
                        DailyCardView()
                    } label: {
                        MenuLinkLabel(message: "每日運勢占卜")
                    }
                    
                    NavigationLink {
                        ThreeCardSpreadView()
                    } label: {
                        MenuLinkLabel(message: "時間之流占卜")
                    }
                    
                    NavigationLink {
                        StarSpreadView()
                    } label: {
                        MenuLinkLabel(message: "六芒星占卜")
                    }
                    
                    NavigationLink {
                        SearchCardView()
                    } label: {
                        MenuLinkLabel(message: "塔羅牌搜尋")
                    }
                }
                .padding()
            }
        }
        .accentColor(Color("MainColor"))
    }
}

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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        
        MenuView()
            .preferredColorScheme(.light)
        
        MenuView()
            .preferredColorScheme(.dark)
        
    }
}
