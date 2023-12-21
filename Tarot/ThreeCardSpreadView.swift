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
    
    @State var pastallowShowCardSheet: Bool = false
    @State var presentallowShowCardSheet: Bool = false
    @State var futureallowShowCardSheet: Bool = false
    
    @State var isTimeOn: Bool = true
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("TopColor"), Color("BottomColor")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Button {
                            withAnimation {
                                isTimeOn.toggle()
                            }
                        } label: {
                            Image(systemName: "repeat")
                                .foregroundColor(Color.black)
                                .padding()
                        }
                    }
                    
                    HStack {
                        ThreeCardShowView(cardID: drawCardsNum[0], imageName: pastCardName, message: "Past", isReversed: pastPosition, isTimeOn: isTimeOn, allowShowCardSheet: pastallowShowCardSheet)
                            .dropDestination(for: String.self) { items, location in
                                withAnimation {
                                    for item in items {
                                        drawCardsName.removeAll { $0 == item }
                                    }
                                }
                                pastCardName = cardDatas[drawCardsNum[0]].imageName
                                pastPosition = Bool.random()
                                pastallowShowCardSheet.toggle()
                                return true
                            }
                        
                        ThreeCardShowView(cardID: drawCardsNum[1], imageName: presentCardName, message: "Present", isReversed: presentPosition, isTimeOn: isTimeOn, allowShowCardSheet: presentallowShowCardSheet)
                            .dropDestination(for: String.self) { items, location in
                                withAnimation {
                                    for item in items {
                                        drawCardsName.removeAll { $0 == item }
                                    }
                                }
                                presentCardName = cardDatas[drawCardsNum[1]].imageName
                                presentPosition = Bool.random()
                                presentallowShowCardSheet.toggle()
                                return true
                            }
                        
                        ThreeCardShowView(cardID: drawCardsNum[2], imageName: futureCardName, message: "Future",  isReversed: futurePosition, isTimeOn: isTimeOn, allowShowCardSheet: futureallowShowCardSheet)
                            .dropDestination(for: String.self) { items, location in
                                withAnimation {
                                    for item in items {
                                        drawCardsName.removeAll { $0 == item }
                                    }
                                }
                                futureCardName = cardDatas[drawCardsNum[2]].imageName
                                futurePosition = Bool.random()
                                futureallowShowCardSheet.toggle()
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
                            
                            pastallowShowCardSheet = false
                            presentallowShowCardSheet = false
                            futureallowShowCardSheet = false
                        }
                    } label: {
                        ThreeCardButtonLabel(message: "Shuffle", iconName: "repeat")
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("3 Card Spread")
        }
        .accentColor(Color("MainColor"))
    } 
}

struct ThreeCardDrawView: View {
    
    let tasks: [String]
    
    @State var cardDatas: [CardInfo] = CardData().getData()
    
    var body: some View {
     
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(tasks, id: \.self) { task in
                    GeometryReader { geometry in
                        Image("CardBacks")
                            .resizable()
                            .opacity(0.8)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(5)
                            .shadow(color: .white, radius: 5)
                            .scaleEffect(0.9)
                            .draggable(task)
                            .rotation3DEffect(Angle(degrees: getPercentage(geo: geometry) * 30), axis: (x: 0.0, y: 1.0, z: 0.0))
                    }
                    .frame(width: 100, height: 180)
                }
            }
        }
    }
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
}

struct ThreeCardButtonLabel: View {
    
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

struct ThreeCardShowView: View {
    
    let cardID: Int
    let imageName: String
    let message: String
    let isReversed: Bool
    let isTimeOn: Bool
    let allowShowCardSheet: Bool
    
    @State var showCardSheet: Bool = false
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 100, height: 230)
                .shadow(color: .white, radius: 5)
                .foregroundColor(Color.gray)
                .opacity(0.6)
            
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5)
                    .shadow(color: .white, radius: 5)
                    .frame(width: 90, height: 150)
                    .rotationEffect(isReversed ? .degrees(180) : .degrees(0))
                    .draggable(imageName)
                    .onTapGesture {
                        if allowShowCardSheet {
                            showCardSheet.toggle()
                        }
                    }
                
                Text(isTimeOn ? message : "")
                    .font(.title3)
                    .frame(maxWidth: 120, maxHeight: 10)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .padding()
                    .cornerRadius(20)
                    .shadow(color: .white, radius: 5)
            }
        }
        .sheet(isPresented: $showCardSheet) {
            ShowCardView(cardState: cardID, isReversed: isReversed)
        }
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
