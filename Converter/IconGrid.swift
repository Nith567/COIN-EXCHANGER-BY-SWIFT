//
//  IconGrid.swift
//  Converter
//
//  Created by NITHIN REDDY on 13/01/23.
//

import SwiftUI

struct IconGrid: View {
    @State var gridLayout=[GridItem(),GridItem(),GridItem()]
    @Binding var currency:Currency
    var body: some View {
        LazyVGrid(columns:gridLayout){
            ForEach(0..<5){ i in
                
                if Currency.allCases[i] == currency {
                        CurrencyIcon(currencyImg: CurrencyImg.allCases[i].rawValue, currencyText:CurrencyText.allCases[i].rawValue).overlay(RoundedRectangle(cornerRadius: 33)
                             .stroke(lineWidth:6)
                            .opacity(0.48))
                        
                        .shadow(color:.black,radius: 2)
                }
                
                else{
                    
                    CurrencyIcon(currencyImg: CurrencyImg.allCases[i].rawValue, currencyText:CurrencyText.allCases[i].rawValue)
                        .onTapGesture {
                            currency = Currency.allCases[i]
                        }
                    
                }
            }
        }.padding([.bottom,.trailing,.leading])
    }
}

struct IconGrid_Previews: PreviewProvider {
    static var previews: some View {
        IconGrid(currency: .constant(.copperPenny))
    }
}
