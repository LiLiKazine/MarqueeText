//
//  ContentView.swift
//  Demo
//
//  Created by LiLi on 2025/7/24.
//

import SwiftUI
import MarqueeText

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 22) {
            MarqueeText(
                text: "Old Town Road (feat. Billy Ray Cyrus) [Remix] - Lil Nas X"
            )
            .border(.red)
            
            MarqueeText(
                text: "A Bar Song (Tipsy)",
            )
            .border(.green)
        }
        .frame(width: 300)
        .padding()
        .font(.system(size: 22, weight: .bold))
    }
}

#Preview {
    ContentView()
}
