//
//  MarqueeText+Preference.swift
//  MarqueeText
//
//  Created by 盛立 on 2025/7/28.
//

import SwiftUI

struct ContainerWidthPreferenceKey: PreferenceKey {
    nonisolated(unsafe) static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct TextWidthPreferenceKey: PreferenceKey {
    nonisolated(unsafe) static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    func readContainerWidth() -> some View {
        self.overlay(
            GeometryReader { geometry in
                Color.clear
                    .preference(key: ContainerWidthPreferenceKey.self, value: geometry.size.width)
            }
        )
    }
    
    func readTextWidth() -> some View {
        self.overlay(
            GeometryReader { geometry in
                Color.clear
                    .preference(key: TextWidthPreferenceKey.self, value: geometry.size.width)
            }
        )
    }
}
