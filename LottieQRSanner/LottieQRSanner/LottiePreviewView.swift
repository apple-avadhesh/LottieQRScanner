//
//  LottiePreviewView.swift
//  LottieQRSanner
//
//  Created by PC Gamer on 02/10/20.
//

import SwiftUI

struct LottiePreviewView: View {
    
    var strLottieURL: String
    @Binding var isActive: Bool
    
    var body: some View {
        LottieRepresentableView(strLottieURL: strLottieURL)
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .topLeading)
            .onDisappear {
                self.isActive = false
            }
    }
    
    
    struct CustomNavButton: View {
        let label: String
        let closure: () -> ()

        var body: some View {
            Button(action: { self.closure() }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text(label)
                }
            }
        }
    }
}
