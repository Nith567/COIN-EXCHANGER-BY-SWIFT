//
//  Currency_.swift
//  Converter
//
//  Created by NITHIN REDDY on 12/01/23.
//

enum Currency:Double,CaseIterable{
    
    case copperPenny=640
    case silverPenny=64
    case silverPiece=16
    case goldPenny=4
    case goldPiece=1
    
    func convert (amountString:String ,to currency:Currency)->String{
        guard let startAmount=Double(amountString) else{
            return ""
        }
        let ConvertedAmount=(startAmount/self.rawValue) * currency.rawValue
        
        if(ConvertedAmount>0){
            return String (format: ".%2f",ConvertedAmount)
        }
        else{
            return ""
        }
}
    
    
}

//these two should be in same order its better.

enum CurrencyText:String,CaseIterable{
    
    case coppePenny="Copper Penny"
    case silverPenny="Silver Penny"
    case silverPiece=" Silver piece"
    case goldPenny="Gold Penny "
    case goldPiece="Gold Piece"
}
 

enum CurrencyImg:String,CaseIterable{
    case copperPenny="copperpenny"
  case silverPenny="silverpenny"
    case silverpiece="silverpiece"
    case goldPenny="goldpenny"
    case goldPiece="goldpiece"
}
