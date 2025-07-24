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
        VStack(spacing: 22) {
            MarqueeText(
                text: "测试加长名称+滚动效果测试+赶紧滚动",
                font: .system(size: 22, weight: .bold)
            )
            .border(.red)
            
            MarqueeText(
                text: "测试普通名称",
                font: .system(size: 22, weight: .bold)
            )
            .border(.green)
        }
        .frame(width: 300)
        .padding()
    }
}

#Preview {
    ContentView()
}
