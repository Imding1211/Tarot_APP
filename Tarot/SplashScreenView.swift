//
//  SplashScreenView.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/20.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        if isActive {
            MenuView()
        }
        else {
            ZStack {
                
                Color(.white)
                
                VStack {
                    VStack {
                        Spacer()
                        
                        DailyCardTitle(message: "Tarot")
                            .offset(y: -120)
                            .background(
                                Image("Icon")
                                    .resizable()
                                    .frame(width: 300, height: 300)
                                    .aspectRatio(contentMode: .fill)
                            )
                        
                        
                        
                        
                        Spacer()
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration:  1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline:  .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        
        SplashScreenView()
            .preferredColorScheme(.light)
        
        SplashScreenView()
            .preferredColorScheme(.dark)
        
    }
}
