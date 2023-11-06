//
//  CircularButtonAnimationView.swift
//  CoinGo
//
//  Created by Manish Parihar on 05.11.23.
//

import SwiftUI

struct CircularButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0): .none, value: 0)
            .onAppear {
                animate.toggle()
            }
    }
}

#Preview {
    CircularButtonAnimationView(animate: .constant(false))
        .foregroundStyle(.red)
        .frame(width:100, height: 100)
}
