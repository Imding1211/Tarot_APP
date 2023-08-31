//
//  ShowCardKeyword.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/12.
//

import SwiftUI

struct ShowCardKeyword: View {
    
    let position: String
    let message: String
    
    var body: some View {
        
        VStack {
            Text(position)
                .font(.title3)
                .fontWeight(.bold)
                .padding(.vertical, 5)
            
            Text(message)
                .font(.body)
                .fontWeight(.light)
                .padding(.vertical, 5)
        }
        .foregroundColor(Color("MainColor"))
    }
}

struct ShowCardKeyword_Previews: PreviewProvider {
    static var previews: some View {
        ShowCardKeyword(position: "逆位關鍵字", message: "開端，純真，自發性，自由的精神")
    }
}
