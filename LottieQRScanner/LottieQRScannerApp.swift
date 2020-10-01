//
//  LottieQRScannerApp.swift
//  LottieQRScanner
//
//  Created by PC Gamer on 01/10/20.
//

import SwiftUI

@main
struct LottieQRScannerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
