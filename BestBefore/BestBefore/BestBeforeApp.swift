//
//  GrosApp.swift
//  Gros
//
//  Created by Jude Alatawi on 15/06/1444 AH.
//

import SwiftUI

@main
struct BestBeforeApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
