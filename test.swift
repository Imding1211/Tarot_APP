//
//  test.swift
//  Tarot
//
//  Created by 丁啟恆 on 2023/8/26.
//

import SwiftUI

struct test: View {
    
    @State var offset1: CGSize = .zero
    @State var offset2: CGSize = .zero
    @State var offset3: CGSize = .zero
    
    var body: some View {
        VStack {
            
            HStack {
                VStack {
                    Text("\(offset1.width)")
                    Text("\(offset1.height)")
                }
                VStack {
                    Text("\(offset2.width)")
                    Text("\(offset2.height)")
                }
                VStack {
                    Text("\(offset3.width)")
                    Text("\(offset3.height)")                    
                }
                
            }

            HStack {
                Rectangle()
                    .stroke()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .stroke()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .stroke()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
            }

            Spacer()
            
            HStack {
                Image("CardBacks")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .offset(offset1)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.spring()) {
                                    offset1 = value.translation
                                }
                            }
                            .onEnded { value in
                                if value.translation.width > -50 && value.translation.width < 50 && value.translation.height < -400 && value.translation.height > -600 {
                                    offset1 = CGSize(width: 0, height: -500)
                                }
                                else {
                                    withAnimation (.spring()) {
                                        offset1 = .zero
                                    }
                                }
                            }
                    )
                
                Image("CardBacks")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .offset(offset2)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.spring()) {
                                    offset2 = value.translation
                                }
                            }
                            .onEnded { value in
                                if value.translation.width > -50 && value.translation.width < 50 && value.translation.height < -400 && value.translation.height > -600 {
                                    offset2 = CGSize(width: 0, height: -500)
                                }
                                else {
                                    withAnimation (.spring()) {
                                        offset2 = .zero
                                    }
                                }
                            }
                    )
                
                Image("CardBacks")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .offset(offset3)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.spring()) {
                                    offset3 = value.translation
                                }
                            }
                            .onEnded { value in
                                if value.translation.width > -50 && value.translation.width < 50 && value.translation.height < -400 && value.translation.height > -600 {
                                    offset3 = CGSize(width: 0, height: -500)
                                }
                                else {
                                    withAnimation (.spring()) {
                                        offset3 = .zero
                                    }
                                }
                            }
                    )
            }
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
