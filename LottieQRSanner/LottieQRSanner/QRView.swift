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
    @State var scannedURL: String?
    @State var isActive = false

    var body: some View {
        NavigationView {
            VStack {
                if self.scannedURL != nil {
                    NavigationLink(destination: LottiePreviewView(strLottieURL: scannedURL!, isActive: $isActive), isActive: $isActive) {
                        EmptyView()
                    }
                }
                self.startScanner
            }
            .navigationBarTitle("Scan Lottie QR Code")
        }
    }
    
     var startScanner: some View {
        CBScanner(
            supportBarcode: .constant([.qr]),
            scanInterval: .constant(5.0)
        ){
            //When the scanner found a barcode
            print($0.value)
//            print("Barcode Type is", $0.type.rawValue)
//            isActive = true
//            self.scannedURL = $0.value
//            
//            //Save lottie to CoreData
//            let newLottie = Lottie(context: CoreDataStack.shared.moc)
//            newLottie.url = $0.value
//            newLottie.name = $0.type.rawValue
//            
//            if CoreDataStack.shared.moc.hasChanges {
//                try? CoreDataStack.shared.moc.save()
//            }
//            
//            print(CoreDataStack.shared.getAllLotties().count)
        }
    }
}

struct QRView_Previews: PreviewProvider {
    static var previews: some View {
        QRView()
    }
}
