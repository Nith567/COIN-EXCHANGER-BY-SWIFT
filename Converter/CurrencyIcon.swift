//
//  CurrencyIcon.swift
//  Converter
//
//  Created by NITHIN REDDY on 12/01/23.
//

import SwiftUI

struct CurrencyIcon: View {
    @State var currencyImg:String
    @State var currencyText:String
    
    var body: some View {
        ZStack{
           Image(currencyImg)
                .resizable()
                .scaledToFit()
            
            VStack {
              //  Spacer()
                Text(currencyText)
                    .font(.caption) 
                    .padding(1.0)
                .background(.brown.opacity(0.8))
            }
        }.padding(4)
            .frame(width:100,height: 99)
            .background(.brown)
            .cornerRadius(21)
            }
}

struct CurrencyIcon_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyIcon(currencyImg:"goldpenny", currencyText: "GOLD PENNY")
            .previewLayout(.sizeThatFits)
    }
}
