//
//  test2.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/27.
//

import SwiftUI

struct test2: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var sliderValue: Double = 39
    
    @State var cardDatas: [CardInfo] = CardData().getData()
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Image(colorScheme == .light ? "background-light" : "background-dark")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView(.horizontal) {
                        ScrollViewReader { proxy in
                            HStack {
                                ForEach(1..<79) { index in
                                    Image(cardDatas[index].imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 300)
                                        .id(index)
                                        .onChange(of: index) { Value in
                                            sliderValue = Double(Value)
                                            print(Value)
                                        }
                                }
                                .onAppear {
                                    proxy.scrollTo(39, anchor: .center)
                                }
                                .onChange(of: sliderValue) { value in
                                    proxy.scrollTo(Int(value), anchor: .center)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Slider(value: $sliderValue, in: 1...78, step: 1)
                        .padding()
                }

            }
            .navigationTitle("3 Card Spread")
        }
        .accentColor(Color("MainColor"))
    }
}

struct test2_Previews: PreviewProvider {
    static var previews: some View {
        test2()
    }
}
