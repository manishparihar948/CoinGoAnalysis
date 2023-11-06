//
//  HomeView.swift
//  CoinGo
//
//  Created by Manish Parihar on 03.11.23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    @State private var showPortfolioView: Bool = false // new sheet
    
    var body: some View {
        
        ZStack {
            // Background Layer
            backGround
            
            // Content Layer
            VStack {
                // top view
                navigationHeader
                
                columnTitles
                
                if !showPortfolio {
                    // second Button
                    allCoinList
                        .transition(.move(edge: .leading))
                }
                
                if showPortfolio {
                    portfolioCoinList
                        .transition(.move(edge: .trailing))
                }
                
                Spacer(minLength: 0)
            }
        }
    }
}

/*
#Preview {
    NavigationStack {
        HomeView()
            .navigationBarBackButtonHidden()
    }
    .environmentObject(dev.homeVM)
}
*/

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}

// Color Theme
private extension HomeView {
    var backGround: some View {
        Color.theme.background
            .ignoresSafeArea()
    }
}

extension HomeView {
    // Navigation Header
   private var navigationHeader: some View {
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
    
    private var allCoinList: some View {
        List {
            /*
            CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingsColumn:false)
             */
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top:10, leading:0, bottom: 10, trailing: 0))
            }
        }
        .listStyle(PlainListStyle())
    }
    private var portfolioCoinList: some View {
        List {
            /*
            CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingsColumn:false)
             */
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top:10, leading:0, bottom: 10, trailing: 0))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            if showPortfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width/3.5, alignment: .trailing)

        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}

