//
//  HomeView.swift
//  CoinGo
//
//  Created by Manish Parihar on 03.11.23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    @State private var showPortfolioView: Bool = false // new sheet
    
    var body: some View {
        
        ZStack {
            // Background Layer
            backGround
            
            // Content Layer
            VStack {
                // first view
                navigationHeader
                // second Button
                
                Spacer(minLength: 0)
                
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
            .navigationBarBackButtonHidden()
    }
}

// Color Theme
private extension HomeView {
    var backGround: some View {
        Color.theme.background
            .ignoresSafeArea()
    }
}

private extension HomeView {
    // Navigation Header
    var navigationHeader: some View {
        HStack {
            // left button
            CircularButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: 0)
                .onTapGesture {
                    if showPortfolio {
                        showPortfolioView.toggle()
                    }
                }
                .background(
                    CircularButtonAnimationView(animate:$showPortfolio)
                )
            
            Spacer()
            
            // center title
            Text(showPortfolio ? "Portfolio": "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none)
            
            Spacer()
            
            // right button
            CircularButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}

