//
//  ThreeCardSpreadView.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/17.
//

import SwiftUI

struct ThreeCardSpreadView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var pastCardArray: [Int] = [Int](0...156)
    @State var presentCardArray: [Int] = [Int](0...156)
    @State var futureCardArray: [Int] = [Int](0...156)
    @State var pastCardIndex: Int = 0
    @State var presentCardIndex: Int = 0
    @State var futureCardIndex: Int = 0
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
                                VStack {
                                    if pastCardIndex <= 78 {
                                        ThreeCardDrawImage(imageName: cardDatas[pastCardArray[pastCardIndex]].imageName)
                                    }
                                    else if pastCardIndex > 78 {
                                        ThreeCardDrawImage(imageName: cardDatas[pastCardArray[pastCardIndex-78]].imageName)
                                            .rotationEffect(.degrees(180))
                                    }
                                    
                                    ThreeCardSpreadText(message: "Past")
                                }
                                
                            }
                            
                            if isDrawedPresent {
                                VStack {
                                    if presentCardIndex <= 78 {
                                        ThreeCardDrawImage(imageName: cardDatas[presentCardArray[presentCardIndex]].imageName)
                                    }
                                    else if presentCardIndex > 78 {
                                        ThreeCardDrawImage(imageName: cardDatas[presentCardArray[presentCardIndex-78]].imageName)
                                            .rotationEffect(.degrees(180))
                                    }
                                    
                                    ThreeCardSpreadText(message: "Present")
                                }
                            }
                            
                            if isDrawedFuture {
                                VStack {
                                    if futureCardIndex <= 78 {
                                        ThreeCardDrawImage(imageName: cardDatas[futureCardArray[futureCardIndex]].imageName)
                                    }
                                    else if futureCardIndex > 78 {
                                        ThreeCardDrawImage(imageName: cardDatas[futureCardArray[futureCardIndex-78]].imageName)
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
                                
                                if pastCardIndex <= 78 {
                                    ThreeCardSpreadImage(imageName: cardDatas[pastCardArray[pastCardIndex]].imageName)
                                }
                                else if pastCardIndex > 78 {
                                    ThreeCardSpreadImage(imageName: cardDatas[pastCardArray[pastCardIndex-78]].imageName)
                                        .rotationEffect(.degrees(180))
                                }
                            }
                            
                            HStack {
                                ThreeCardSpreadText(message: "Present")
                                
                                if presentCardIndex <= 78 {
                                    ThreeCardSpreadImage(imageName: cardDatas[presentCardArray[presentCardIndex]].imageName)
                                }
                                else if presentCardIndex > 78 {
                                    ThreeCardSpreadImage(imageName: cardDatas[presentCardArray[presentCardIndex-78]].imageName)
                                        .rotationEffect(.degrees(180))
                                }
                            }
                            
                            HStack {
                                ThreeCardSpreadText(message: "Future")
                                
                                if futureCardIndex <= 78 {
                                    ThreeCardSpreadImage(imageName: cardDatas[futureCardArray[futureCardIndex]].imageName)
                                }
                                else if futureCardIndex > 78 {
                                    ThreeCardSpreadImage(imageName: cardDatas[futureCardArray[futureCardIndex-78]].imageName)
                                        .rotationEffect(.degrees(180))
                                }
                            }
                            
                            Spacer()
                            
                            Button {
                                isDrawedPast.toggle()
                                isDrawedPresent.toggle()
                                isDrawedFuture.toggle()
                                isAllDrawed.toggle()
                                shuffleCard()
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
                                        futureCardIndex = Int.random(in: 1...154)
                                        isDrawedFuture.toggle()
                                        DispatchQueue.main.asyncAfter(deadline:  .now() + 0.5) {
                                            isAllDrawed.toggle()
                                        }
                                    }
                                }
                        }
                        
                        if !isDrawedPresent {
                            ThreeCardBackImage(imageName: "CardBacks", offSet: -20, isShow: isDrawedPast)
                                .onTapGesture {
                                    withAnimation {
                                        presentCardIndex = Int.random(in: 1...155)
                                        futureCardArray = presentCardArray.filter { $0 != presentCardIndex }
                                        isDrawedPresent.toggle()
                                    }
                                }
                        }
                        
                        if !isDrawedPast {
                            ThreeCardBackImage(imageName: "CardBacks", offSet: -30, isShow: true)
                                .onTapGesture {
                                    withAnimation {
                                        pastCardIndex = Int.random(in: 1...156)
                                        presentCardArray = pastCardArray.filter { $0 != pastCardIndex }
                                        isDrawedPast.toggle()
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
    
    func shuffleCard() {
        
        pastCardArray    = [Int](0...156)
        presentCardArray = [Int](0...156)
        futureCardArray  = [Int](0...156)
        
        pastCardIndex    = 0
        presentCardIndex = 0
        futureCardIndex  = 0
        
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
