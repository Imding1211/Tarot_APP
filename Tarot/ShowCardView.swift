//
//  ShowCardView.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/6.
//

import SwiftUI

struct ShowCardView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    @State var cardState: Int
    @State var cardDatas: [CardInfo] = CardData().getData()
    @State var isReversed: Bool
    
    var body: some View {
        
        ZStack {
            Image(colorScheme == .light ? "background-light" : "background-dark")
                .resizable()
                .ignoresSafeArea()
                    
            VStack {
                Text(cardDatas[cardState].englishName)
                    .foregroundColor(Color("MainColor"))
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding()
                
                HStack {
                    
                    VStack {
                        
                        Text(cardDatas[cardState].chineseName)
                            .foregroundColor(Color("MainColor"))
                            .font(.title)
                            .fontWeight(.medium)
                            .padding()
                                            
                        Divider()
                            .foregroundColor(Color("MainColor"))
                        
                        if !isReversed {
                            ShowCardKeyword(position: "正位關鍵字", message: cardDatas[cardState].keyWordUpright)
                        }
                        else {
                            ShowCardKeyword(position: "逆位關鍵字", message: cardDatas[cardState].keyWordReversed)
                        }
                    }
                    .padding(.leading, 15)
                    
                    Button {
                        withAnimation(.default) {
                            isReversed.toggle()
                        }
                    } label: {
                        Image(cardDatas[cardState].imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .rotationEffect(isReversed ? .degrees(180) : .degrees(0))
                            .padding(.trailing, 10)
                    }
                }
                .padding(.trailing, 20)
                
                ScrollView {
                    Text(cardDatas[cardState].describe)
                        .foregroundColor(Color("MainColor"))
                        .lineSpacing(15)
                        .padding()
                }
                
                Spacer()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "x.circle")
                        .font(.largeTitle)
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(20)
                        .shadow(color: .white, radius: 5)
                }
            }
            .foregroundColor(Color.black)
            .padding()
        }
    }
}

struct ShowCardView_Previews: PreviewProvider {
    static var previews: some View {

        ShowCardView(cardState: 3, isReversed: false)
            .preferredColorScheme(.light)
        
        ShowCardView(cardState: 3, isReversed: false)
            .preferredColorScheme(.dark)

    }
}
