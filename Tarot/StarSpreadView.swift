//
//  StarSpreadView.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/12/20.
//

import SwiftUI

struct StarSpreadView: View {
    
    @State var drawCardsName: [String] = CardData().getData().map({ $0.imageName }).shuffled()
    @State var drawCardsNum: [Int] = [Int](1...78).shuffled()
    @State var cardDatas: [CardInfo] = CardData().getData()
    
    @State var isTimeOn: Bool = true
    
    @State var isTurnPresent: Bool = false
    @State var isTurnObstacles: Bool = false
    @State var isTurnSuggestion: Bool = false
    @State var isTurnConclusion: Bool = false
    @State var isTurnPast: Bool = false
    @State var isTurnFuture: Bool = false
    @State var isTurnenvirnmental: Bool = false
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("TopColor"), Color("BottomColor")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {                    
                    HStack {
                        VStack {
                            StarShowView(cardID: drawCardsNum[0], imageName: cardDatas[drawCardsNum[0]].imageName, message: "現在", isTimeOn: isTimeOn, isTurn: $isTurnPresent)
                            
                            StarShowView(cardID: drawCardsNum[1], imageName: cardDatas[drawCardsNum[1]].imageName, message: "主要障礙", isTimeOn: isTimeOn, isTurn: $isTurnObstacles)
                        }
                        
                        VStack {
                            StarShowView(cardID: drawCardsNum[2], imageName: cardDatas[drawCardsNum[2]].imageName, message: "建議", isTimeOn: isTimeOn, isTurn: $isTurnSuggestion)
                            
                            StarShowView(cardID: drawCardsNum[3], imageName: cardDatas[drawCardsNum[3]].imageName, message: "結論", isTimeOn: isTimeOn, isTurn: $isTurnConclusion)
                            
                            StarShowView(cardID: drawCardsNum[4], imageName: cardDatas[drawCardsNum[4]].imageName, message: "過去", isTimeOn: isTimeOn, isTurn: $isTurnPast)
                        }
                        
                        VStack {
                            StarShowView(cardID: drawCardsNum[5], imageName: cardDatas[drawCardsNum[5]].imageName, message: "未來", isTimeOn: isTimeOn, isTurn: $isTurnFuture)
                            
                            StarShowView(cardID: drawCardsNum[6], imageName: cardDatas[drawCardsNum[6]].imageName, message: "環境因素", isTimeOn: isTimeOn, isTurn: $isTurnenvirnmental)
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            isTurnPresent = false
                            isTurnObstacles = false
                            isTurnSuggestion = false
                            isTurnConclusion = false
                            isTurnPast = false
                            isTurnFuture = false
                            isTurnenvirnmental = false
                            
                            drawCardsNum = [Int](1...78).shuffled()
                            drawCardsName = CardData().getData().map({ $0.imageName }).shuffled()
                        }
                    } label: {
                        ThreeCardButtonLabel(message: "Shuffle", iconName: "repeat")
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("Star Spread")
            .toolbar {
                ToolbarItem (placement: .topBarTrailing) {
                    Image(systemName: "repeat")
                        .foregroundColor(Color("MainColor"))
                        .padding()
                        .onTapGesture {withAnimation {isTimeOn.toggle()}}
                }
            }
        }
        .accentColor(Color("MainColor"))
    }
}

struct StarShowView: View {
    
    let cardID: Int
    let imageName: String
    let message: String
    let isTimeOn: Bool
    
    @Binding var isTurn: Bool
    
    @State var isReversed: Bool = false
    @State var showCardSheet: Bool = false
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 90, height: 150)
                .shadow(color: .white, radius: 5)
                .foregroundColor(Color.gray)
                .opacity(0.6)
            
            VStack {
                Image(isTurn ? imageName : "CardBacks")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5)
                    .shadow(color: .white, radius: 5)
                    .frame(width: 90, height: 100)
                    .rotationEffect(isReversed ? .degrees(180) : .degrees(0))
                    .onTapGesture {
                        if isTurn {
                            showCardSheet.toggle()
                        }
                        else {
                            withAnimation {isTurn = true}
                            
                            isReversed = Bool.random()
                        }
                    }
                
                Text(isTimeOn ? message : "")
                    .font(.body)
                    .frame(maxWidth: 120, maxHeight: 10)
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                    .padding(.vertical, 5)
                    .cornerRadius(20)
                    .shadow(color: .white, radius: 5)
            }
        }
        .sheet(isPresented: $showCardSheet) {
            ShowCardView(cardState: cardID, isReversed: isReversed)
        }
    }
}

struct StarSpreadButtonLabel: View {
    
    let message: String
    let iconName: String
    
    var body: some View {
        HStack {
            Text(message)
            Image(systemName: iconName)
        }
        .font(.title3)
        .fontWeight(.heavy)
        .frame(maxWidth: 220, maxHeight: 40)
        .foregroundColor(Color.black)
        .padding(.vertical, 5)
        .background(Color.white.opacity(0.6))
        .cornerRadius(20)
        .shadow(color: .white, radius: 5)
    }
}

struct StarSpreadView_Previews: PreviewProvider {
    static var previews: some View {
        
        StarSpreadView()
            .preferredColorScheme(.light)
        
        StarSpreadView()
            .preferredColorScheme(.dark)
        
    }
}
