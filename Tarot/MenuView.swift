//
//  MenuView.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/7.
//

import SwiftUI

struct MenuView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Image(colorScheme == .light ? "background-light" : "background-dark")
                    .resizable()
                    .ignoresSafeArea()

                VStack(spacing: 30) {
                    NavigationLink {
                        DailyCardView()
                    } label: {
                        MenuLinkLabel(message: "Daily Tarot Draw")
                    }
                    
                    NavigationLink {
                        ThreeCardSpreadView()
                    } label: {
                        MenuLinkLabel(message: "3 Card Spread")
                    }
                    
                    NavigationLink {
                        SearchCardView()
                    } label: {
                        MenuLinkLabel(message: "Serch Card")
                    }
                }
                .padding()
            }
        }
        .accentColor(Color("MainColor"))
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
