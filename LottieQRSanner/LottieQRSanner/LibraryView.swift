//
//  LibraryView.swift
//  LottieQRSanner
//
//  Created by PC Gamer on 02/10/20.
//

import SwiftUI

struct LibraryView: View {
    
    var lotties: [Lottie] = CoreDataStack.shared.getAllLotties()

    // Columns for Grid
    let gridItems : [GridItem] = [GridItem()]
    @State var isActive = false
    @State var selectedURL:String = ""


    var body: some View {
        NavigationView {
            ScrollView {
                
                LazyVGrid(columns: gridItems, alignment: .center, spacing: 0) {
                    ForEach(lotties, id: \.self) { lottie in
                        NavigationLink(destination: LottiePreviewView(strLottieURL: selectedURL, isActive: $isActive), isActive: $isActive) {
                            EmptyView()
                        }
                            LottieRepresentableView(strLottieURL: lottie.url!)
                                .frame(width: UIScreen.main.bounds.width - 20)
                                .frame(height: 180)
                                .cornerRadius(12)
                                .border(Color.purple, width: 4)
                                .shadow(radius: 5)
                                .scaledToFit()
                                .onTapGesture {
                                    isActive = true
                                    selectedURL = lottie.url!
                                }
                    }
                    .padding(.all, 10)
                }
            }
            .navigationTitle("Lottie Collection")
        }
    }
}
