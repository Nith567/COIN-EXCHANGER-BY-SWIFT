//
//   SelectCurrency.swift
//  Converter
//
//  Created by NITHIN REDDY on 12/01/23.
//

import SwiftUI

struct _SelectCurrency: View {
 
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency:Currency
    @Binding var rightCurrency:Currency
    
    var body: some View {
        ZStack{
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            VStack{
                //head
                Text("select the currency you are starting with : ")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                IconGrid(currency: $leftCurrency)
           
            
                Text("Select the currency you would like to convert to : ") .fontWeight(.bold).multilineTextAlignment(.center).padding()
                IconGrid(currency: $rightCurrency)
                Button("Done"){
                    dismiss()
                }
                .font(.largeTitle)
                .padding(7)
                .foregroundColor(.secondary)
                .background(.orange.opacity(0.6))
                .cornerRadius(10)
                .shadow(radius:2)
              
            }
        }
    }
}

struct _SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        _SelectCurrency(leftCurrency:.constant(.silverPiece),rightCurrency: (.constant(.goldPiece)))
    }
}
