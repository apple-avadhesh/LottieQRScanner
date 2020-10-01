//
//  QRView.swift
//  LottieQRSanner
//
//  Created by PC Gamer on 02/10/20.
//

import SwiftUI
import CarBode

struct QRView: View {
    
    //MARK: Properties
    @State private var isShowingScanner = false


    var body: some View {
        VStack{

               CBScanner(
                       supportBarcode: .constant([.qr]), //Set type of barcode you want to scan
                       scanInterval: .constant(5.0) //Event will trigger every 5 seconds
                   ){
                       //When the scanner found a barcode
                       print($0.value)
                       print("Barcode Type is", $0.type.rawValue)
                   }
            
        }
    }
}

struct QRView_Previews: PreviewProvider {
    static var previews: some View {
        QRView()
    }
}
