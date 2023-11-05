//
//  CircularButtonView.swift
//  CoinGo
//
//  Created by Manish Parihar on 05.11.23.
//

import SwiftUI

struct CircularButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundStyle(Color.theme.background)
            )
            .shadow(
                color:Color.theme.accent.opacity(0.25),
                radius: 10, x: 0, y: 0
            )
            .padding()
    }
}

#Preview {
    Group {
        CircularButtonView(iconName: "info")
            .previewLayout(.sizeThatFits)

        CircularButtonView(iconName: "plus")
            .previewLayout(.sizeThatFits)
            //.preferredColorScheme(.dark)
    }
}
