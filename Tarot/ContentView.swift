//
//  ContentView.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/5.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
            SplashScreenView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        
        ContentView()
            .preferredColorScheme(.dark)
    }
}
