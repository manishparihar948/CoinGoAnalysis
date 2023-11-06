//
//  CoinGoApp.swift
//  CoinGo
//
//  Created by Manish Parihar on 03.11.23.
//

import SwiftUI

@main
struct CoinGoApp: App {
    
    @StateObject var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .navigationBarBackButtonHidden()
            }
            .environmentObject(vm)
        }
    }
}
