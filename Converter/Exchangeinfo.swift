//
//  Exchangeinfo.swift
//  Converter
//
//  Created by NITHIN REDDY on 12/01/23.
//

import SwiftUI

struct Exchangeinfo: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
       
        ZStack{
            //Background
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            VStack{
                //Title
                Text("Exchanges Rates")
                    .font(.largeTitle)
                //body
                Text(" Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates: ")
                    .font(.title2)
                    .foregroundColor(.black.opacity(0.9))
                    .padding()
                //images with rates
                ExchangeRate(leftImg: "goldpiece", text: "1 Gold piece =4 Gold Penny", rightImg: "goldpenny")
                
                ExchangeRate(leftImg: "goldpenny", text: "1 Gold penny =4 Silver Pieces", rightImg: "silverpiece")
                //done button
                ExchangeRate(leftImg: "silverpiece", text: "1 Silver Piece = 4 Silver  Penny", rightImg: "silverpenny")
                
                ExchangeRate(leftImg: "silverpenny", text: "1 Silver Penny = 100 Copper Pennies", rightImg: "copperpenny")
                
                Button("Done"){
                    dismiss()
                }
                .font(.largeTitle)
                .padding(9)
                .foregroundColor(.cyan)
                .background(.orange)
                .cornerRadius(9)
                .shadow(radius:3)
                
                
                
                
            }
        }
      .foregroundColor(.black)
        
        
    }
}

struct Exchangeinfo_Previews: PreviewProvider {
    static var previews: some View {
        Exchangeinfo()
            .preferredColorScheme(.dark)
    }
}
