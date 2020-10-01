//
//  LottieQRSannerApp.swift
//  LottieQRSanner
//
//  Created by PC Gamer on 02/10/20.
//

import SwiftUI

@main
struct LottieQRSannerApp: App {
    var body: some Scene {
        WindowGroup {
            
            //MARK: Adding TabView
            TabView {
                QRView()
                    .tabItem {
                        Image(systemName: "qrcode.viewfinder")
                        Text("QR Scan")
                    }
                
                LibraryView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("Library")
                    }
            }
        }
    }
}
