//
//  ContentView.swift
//  Converter
//
//  Created by NITHIN REDDY on 11/01/23.
//

import SwiftUI

struct ContentView: View {
    @State var leftAmount=""
    @State var leftTemp=""
    @State var rightAmount=""

    @State var rightTemp=""
    @State var leftTyping=false
    @State var rightTyping=false
    @State var leftCurrency:Currency = .silverPiece
    @State var rightCurrency:Currency = .goldPiece
    @State var showSelectCurrency=false
    @State var showinfoExchange=false
   
    
    var body: some View {
        
        ZStack{
            Image("background").resizable().ignoresSafeArea()
            VStack{
                
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height:210)
                
                
                Text("Exchange Currency")
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
                HStack{
                    
                    
                    VStack{
                        HStack{
                            
                            Image(CurrencyImg.allCases [Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height:34)
                            
                            Text(CurrencyText.allCases [Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom,-7)
                        
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
    .sheet(isPresented: $showSelectCurrency){
       // _SelectCurrency
        _SelectCurrency(leftCurrency: $leftCurrency,rightCurrency:$rightCurrency)
                            
                        }
                        TextField("Amount",text:$leftAmount,onEditingChanged: {
                            typing in
                            leftTyping=typing
                            leftTemp=leftAmount
                        })
                            .padding(8.0)
                            .background(Color(UIColor.systemMint))
                            .cornerRadius(12)
                            .keyboardType(.decimalPad )
                            .onChange(of:leftTyping ? leftAmount : leftTemp)
                        {_ in
                            rightAmount=leftCurrency.convert(amountString:leftAmount, to: rightCurrency)
                        }
                        .onChange(of:leftCurrency){
                            _ in
                            leftAmount=rightCurrency.convert(amountString:rightAmount,to: leftCurrency )
                        }
                    }
                    Image(systemName: "equal")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    
                    VStack{
                        
                        HStack{
                            Text(CurrencyText.allCases [Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Image(CurrencyImg.allCases [Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height:34) 
                            
                        }
                        .padding(.bottom,-7)
                        
                        
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
    .sheet(isPresented: $showSelectCurrency){
       // _SelectCurrency
        _SelectCurrency(leftCurrency: $leftCurrency,rightCurrency:$rightCurrency)
                            
                        }
                        
                        TextField("Amount",text:$rightAmount,onEditingChanged:{
                            typing in
                            rightTyping=typing
                            rightTemp=rightAmount
                             
                        } )
                            .padding(8.0)
                            .background(Color(UIColor.systemMint))
                            .cornerRadius(11)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad )
                           .onChange(of:rightTyping ?  rightAmount: rightTemp){
                                _ in
                                leftAmount=rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                           .onChange(of:rightCurrency){
                               _ in
                               rightAmount=leftCurrency.convert(
                                amountString:leftAmount,to: rightCurrency )} 
                        
                    }
                }
                .padding()
                .background(.black.opacity(0.6))
                .cornerRadius(48)
                
                Spacer()
                HStack{
                    Spacer()
                    Button{
                        
                        showinfoExchange.toggle()
                        //WHEN we return we do these one
                    } label:{
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .sheet(isPresented: $showinfoExchange){
                        Exchangeinfo()
                    }
                    
                }
            }
        }
        
    }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
