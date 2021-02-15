//
//  SwiftuiTestApp.swift
//  SwiftuiTest
//
//  Created by 段峰 on 2020/12/15.
//

import SwiftUI

@main
struct SwiftuiTestApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
