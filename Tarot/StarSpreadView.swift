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
    
    @State var pastCardName: String = ""
    
    @State var pastPosition: Bool = false
    
    @State var isTimeOn: Bool = true
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("TopColor"), Color("BottomColor")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        VStack {
                            ThreeCardShowView(cardID: drawCardsNum[0], imageName: pastCardName, message: "Past", isReversed: pastPosition, isTimeOn: isTimeOn)
                            
                            ThreeCardShowView(cardID: drawCardsNum[0], imageName: pastCardName, message: "Past", isReversed: pastPosition, isTimeOn: isTimeOn)
                            
                        }
                        
                        VStack {
                            ThreeCardShowView(cardID: drawCardsNum[0], imageName: pastCardName, message: "Past", isReversed: pastPosition, isTimeOn: isTimeOn)
                            
                            ThreeCardShowView(cardID: drawCardsNum[0], imageName: pastCardName, message: "Past", isReversed: pastPosition, isTimeOn: isTimeOn)
                            
                            ThreeCardShowView(cardID: drawCardsNum[0], imageName: pastCardName, message: "Past", isReversed: pastPosition, isTimeOn: isTimeOn)
                            
                        }
                        
                        VStack {
                            ThreeCardShowView(cardID: drawCardsNum[0], imageName: pastCardName, message: "Past", isReversed: pastPosition, isTimeOn: isTimeOn)
                            
                            ThreeCardShowView(cardID: drawCardsNum[0], imageName: pastCardName, message: "Past", isReversed: pastPosition, isTimeOn: isTimeOn)
                            
                        }
                    }
                }
            }
        }
    }
}

struct StarShowView: View {
    
    let cardID: Int
    let imageName: String
    let message: String
    let isReversed: Bool
    let isTimeOn: Bool
    
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
                        showCardSheet.toggle()
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

struct StarSpreadView_Previews: PreviewProvider {
    static var previews: some View {
        
        StarSpreadView()
            .preferredColorScheme(.light)
        
        StarSpreadView()
            .preferredColorScheme(.dark)
        
    }
}
