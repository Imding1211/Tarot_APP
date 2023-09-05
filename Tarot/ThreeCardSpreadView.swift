//
//  ThreeCardSpreadView.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/17.
//

import SwiftUI

struct ThreeCardSpreadView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var drawCardsName: [String] = CardData().getData().map({ $0.imageName }).shuffled()
    @State var drawCardsNum: [Int] = [Int](1...78).shuffled()
    @State var cardDatas: [CardInfo] = CardData().getData()
    
    @State var pastCardName: String = ""
    @State var presentCardName: String = ""
    @State var futureCardName: String = ""
    
    @State var pastPosition: Bool = false
    @State var presentPosition: Bool = false
    @State var futurePosition: Bool = false
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Image(colorScheme == .light ? "background-light" : "background-dark")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        ThreeCardShowView(cardID: drawCardsNum[0], imageName: pastCardName, message: "Past", isReversed: pastPosition)
                            .dropDestination(for: String.self) { items, location in
                                withAnimation {
                                    for item in items {
                                        drawCardsName.removeAll { $0 == item }
                                    }
                                }
                                pastCardName = cardDatas[drawCardsNum[0]].imageName
                                pastPosition = Bool.random()
                                return true
                            }
                        
                        ThreeCardShowView(cardID: drawCardsNum[1], imageName: presentCardName, message: "Present", isReversed: presentPosition)
                            .dropDestination(for: String.self) { items, location in
                                withAnimation {
                                    for item in items {
                                        drawCardsName.removeAll { $0 == item }
                                    }
                                }
                                presentCardName = cardDatas[drawCardsNum[1]].imageName
                                presentPosition = Bool.random()
                                return true
                            }
                        
                        ThreeCardShowView(cardID: drawCardsNum[2], imageName: futureCardName, message: "Future",  isReversed: futurePosition)
                            .dropDestination(for: String.self) { items, location in
                                withAnimation {
                                    for item in items {
                                        drawCardsName.removeAll { $0 == item }
                                    }
                                }
                                futureCardName = cardDatas[drawCardsNum[2]].imageName
                                futurePosition = Bool.random()
                                return true
                            }
                    }
                    
                    ThreeCardDrawView(tasks: drawCardsName)
                    
                    Button {
                        withAnimation {
                            pastCardName = ""
                            presentCardName = ""
                            futureCardName = ""
                            drawCardsNum = [Int](1...78).shuffled()
                            drawCardsName = CardData().getData().map({ $0.imageName }).shuffled()
                        }
                    } label: {
                        DailyCardButtonLabel(message: "洗牌", iconName: "repeat")
                    }
                    
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
