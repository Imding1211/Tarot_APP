//
//  SearchCardView.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/8.
//

import SwiftUI

struct SearchCardView: View {
    
    @State var cardDatas: [CardInfo] = CardData().getData()
    @State var searchCard: String = ""
    @State var selection: String = "ALL"
    
    let options: [String] = ["ALL", "大牌", "權杖", "聖杯", "寶劍", "錢幣"]
    
    var searchCards: [CardInfo] {
        if selection == "ALL"  && searchCard.isEmpty {
            return cardDatas
        }
        else if selection == "大牌" && searchCard.isEmpty {
            return cardDatas.filter { $0.cardType.localizedStandardContains("Major") }
        }
        else if selection == "權杖" && searchCard.isEmpty {
            return cardDatas.filter { $0.cardType.localizedStandardContains("Wands") }
        }
        else if selection == "聖杯" && searchCard.isEmpty {
            return cardDatas.filter { $0.cardType.localizedStandardContains("Cups") }
        }
        else if selection == "寶劍" && searchCard.isEmpty {
            return cardDatas.filter { $0.cardType.localizedStandardContains("Swords") }
        }
        else if selection == "錢幣" && searchCard.isEmpty {
            return cardDatas.filter { $0.cardType.localizedStandardContains("Pentacles") }
        }
        else if !searchCard.isEmpty {
            if selection == "ALL" {
                return cardDatas.filter { $0.chineseName.localizedStandardContains(searchCard) || $0.englishName.localizedStandardContains(searchCard) }
            }
            if selection == "大牌" {
                return cardDatas.filter { ($0.chineseName.localizedStandardContains(searchCard) || $0.englishName.localizedStandardContains(searchCard)) && $0.cardType.localizedStandardContains("Major") }
            }
            else if selection == "權杖" {
                return cardDatas.filter { ($0.chineseName.localizedStandardContains(searchCard) || $0.englishName.localizedStandardContains(searchCard)) && $0.cardType.localizedStandardContains("Wands") }
            }
            else if selection == "聖杯" {
                return cardDatas.filter { ($0.chineseName.localizedStandardContains(searchCard) || $0.englishName.localizedStandardContains(searchCard)) && $0.cardType.localizedStandardContains("Cups") }
            }
            else if selection == "寶劍" {
                return cardDatas.filter { ($0.chineseName.localizedStandardContains(searchCard) || $0.englishName.localizedStandardContains(searchCard)) && $0.cardType.localizedStandardContains("Swords") }
            }
            else if selection == "錢幣" {
                return cardDatas.filter { ($0.chineseName.localizedStandardContains(searchCard) || $0.englishName.localizedStandardContains(searchCard)) && $0.cardType.localizedStandardContains("Pentacles") }
            }
            else {
                return cardDatas
            }
        }
        else {
            return cardDatas
        }
    }
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                VStack {
                    Picker(selection: $selection) {
                        ForEach(options, id: \.self) { option in
                            Text(option)
                                .tag(option)
                        }
                    } label: {
                        Text("Picker")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 5)

                    if searchCards.isEmpty {
                        Spacer()
                        
                        Text("沒有這張牌喔")
                            .font(.title3)
                            .foregroundColor(Color("MainColor"))

                        Spacer()
                    }
                    else {
                        List(searchCards, id: \.id) { card in
                            
                            if card.cardID != 0 {
                                NavigationLink {
                                    ShowCardView(cardState: card.cardID, isReversed: false)
                                } label: {
                                    HStack {
                                        VStack (alignment: .leading, spacing: 15) {
                                            Text(card.englishName)
                                            
                                            Text(card.chineseName)
                                        }
                                        .foregroundColor(Color("MainColor"))
                                        
                                        Spacer()
                                        
                                        Image(card.imageName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 95, height: 95)
                                        
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                }
                .searchable(text: $searchCard)
            }
            .navigationTitle("塔羅牌搜尋")
        }
        .accentColor(Color("MainColor"))
    }
}

struct SearchCardView_Previews: PreviewProvider {
    static var previews: some View {

        SearchCardView()
            .preferredColorScheme(.light)
        
        SearchCardView()
            .preferredColorScheme(.dark)

    }
}
