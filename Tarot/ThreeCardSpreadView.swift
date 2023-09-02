//
//  ThreeCardSpreadView.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/17.
//

import SwiftUI

struct ThreeCardSpreadView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var CardIDArray: [Int] = [Int](1...156).shuffled()
    @State var cardDatas: [CardInfo] = CardData().getData()
    @State var isDrawedPast: Bool = false
    @State var isDrawedPresent: Bool = false
    @State var isDrawedFuture: Bool = false
    @State var isAllDrawed: Bool = false
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Image(colorScheme == .light ? "background-light" : "background-dark")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                    
                    if !isAllDrawed {
                        HStack {
                            if isDrawedPast {
                                VStack (spacing: 20) {
                                    if CardIDArray[0] <= 78 {
                                        ThreeCardDrawImage(imageName: cardDatas[CardIDArray[0]].imageName)
                                    }
                                    else if CardIDArray[0] > 78 {
                                        ThreeCardDrawImage(imageName: cardDatas[CardIDArray[0]-78].imageName)
                                            .rotationEffect(.degrees(180))
                                    }
                                    
                                    ThreeCardSpreadText(message: "Past")
                                }
                                
                            }
                            
                            if isDrawedPresent {
                                VStack (spacing: 20) {
                                    if CardIDArray[1] <= 78 {
                                        ThreeCardDrawImage(imageName: cardDatas[CardIDArray[1]].imageName)
                                    }
                                    else if CardIDArray[1] > 78 {
                                        ThreeCardDrawImage(imageName: cardDatas[CardIDArray[1]-78].imageName)
                                            .rotationEffect(.degrees(180))
                                    }
                                    
                                    ThreeCardSpreadText(message: "Present")
                                }
                            }
                            
                            if isDrawedFuture {
                                VStack (spacing: 20) {
                                    if CardIDArray[2] <= 78 {
                                        ThreeCardDrawImage(imageName: cardDatas[CardIDArray[2]].imageName)
                                    }
                                    else if CardIDArray[2] > 78 {
                                        ThreeCardDrawImage(imageName: cardDatas[CardIDArray[2]-78].imageName)
                                            .rotationEffect(.degrees(180))
                                    }
                                    
                                    ThreeCardSpreadText(message: "Future")
                                }
                            }
                        }
                        .padding()
                    }
                    else {
                        VStack {
                            Spacer()
                            
                            HStack {
                                ThreeCardSpreadText(message: "Past")
                                
                                if CardIDArray[0] <= 78 {
                                    ThreeCardSpreadImage(imageName: cardDatas[CardIDArray[0]].imageName)
                                }
                                else if CardIDArray[0] > 78 {
                                    ThreeCardSpreadImage(imageName: cardDatas[CardIDArray[0]-78].imageName)
                                        .rotationEffect(.degrees(180))
                                }
                            }
                            
                            HStack {
                                ThreeCardSpreadText(message: "Present")
                                
                                if CardIDArray[1] <= 78 {
                                    ThreeCardSpreadImage(imageName: cardDatas[CardIDArray[1]].imageName)
                                }
                                else if CardIDArray[1] > 78 {
                                    ThreeCardSpreadImage(imageName: cardDatas[CardIDArray[1]-78].imageName)
                                        .rotationEffect(.degrees(180))
                                }
                            }
                            
                            HStack {
                                ThreeCardSpreadText(message: "Future")
                                
                                if CardIDArray[2] <= 78 {
                                    ThreeCardSpreadImage(imageName: cardDatas[CardIDArray[2]].imageName)
                                }
                                else if CardIDArray[2] > 78 {
                                    ThreeCardSpreadImage(imageName: cardDatas[CardIDArray[2]-78].imageName)
                                        .rotationEffect(.degrees(180))
                                }
                            }
                            
                            Spacer()
                            
                            Button {
                                withAnimation {
                                    isDrawedPast = false
                                    isDrawedPresent = false
                                    isDrawedFuture = false
                                    isAllDrawed = false
                                    CardIDArray.shuffle()                               
                                }
                            } label: {
                                DailyCardButtonLabel(message: "洗牌", iconName: "repeat")
                            }

                        }
                    }
                    
                    
                    Spacer()
                    
                    ZStack {
                        if !isAllDrawed {
                            ThreeCardBackImage(imageName: "CardBacks", offSet: 0, isShow: isAllDrawed)
                        }
                        
                        if !isDrawedFuture {
                            ThreeCardBackImage(imageName: "CardBacks", offSet: -10, isShow: isDrawedPresent)
                                .onTapGesture {
                                    withAnimation {
                                        isDrawedFuture = true
                                        DispatchQueue.main.asyncAfter(deadline:  .now() + 0.5) {
                                            withAnimation {
                                                isAllDrawed = true
                                            }
                                        }
                                    }
                                }
                        }
                        
                        if !isDrawedPresent {
                            ThreeCardBackImage(imageName: "CardBacks", offSet: -20, isShow: isDrawedPast)
                                .onTapGesture {
                                    withAnimation {
                                        isDrawedPresent = true
                                    }
                                }
                        }
                        
                        if !isDrawedPast {
                            ThreeCardBackImage(imageName: "CardBacks", offSet: -30, isShow: true)
                                .onTapGesture {
                                    withAnimation {
                                        isDrawedPast = true
                                    }
                                }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("3 Card Spread")
        }
        .accentColor(Color("MainColor"))
    }
}

struct ThreeCardSpreadView_Previews: PreviewProvider {
    static var previews: some View {
        
        ThreeCardSpreadView()
            .preferredColorScheme(.light)
        
        ThreeCardSpreadView()
            .preferredColorScheme(.dark)
        
    }
}
