//
//  ExchangeRate.swift
//  Converter
//
//  Created by NITHIN REDDY on 12/01/23.
//

import SwiftUI

struct ExchangeRate: View {
    @State var leftImg:String
    @State var text:String
    @State var rightImg:String
    var body: some View {
        HStack{
            
            Image(leftImg)
                .resizable()
                .scaledToFit()
                .frame(height:29)
            //img
            Text(text)
            //conte
            
            Image(rightImg)
                .resizable()
                .scaledToFit()
                .frame(height:29)
            //=
            //conte
            //img
            
            
            
        }

    }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(leftImg: "goldpiece", text: "1 Gold piece =4 Gold pennies", rightImg:"silverpiece")
            .previewLayout(.sizeThatFits)
    }
}
