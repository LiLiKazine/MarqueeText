// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI

public struct MarqueeText: View {
    
    let text: String
    
    @State private var textWidth: CGFloat = 0
    @State private var containerWidth: CGFloat = 0
    @State private var animate: Bool = false
    
    private let marqueeSpacing: CGFloat

    public init(text: String, marqueeSpacing: CGFloat = 60) {
        self.text = text
        self.marqueeSpacing = marqueeSpacing
    }
    
    private var internalText: some View {
        Text(text)
            .lineLimit(1)
    }
    
    public var body: some View {
        
        let animation = Animation
            .linear(duration: animationDuration)
            .repeatForever(autoreverses: false)
        
        ZStack(alignment: .leading) {
            internalText
                .fixedSize(horizontal: true, vertical: false)
                .offset(x: animate ? -textWidth - marqueeSpacing : 0)
                .animation(
                    animation,
                    value: animate
                )
                .readTextWidth()
            
            internalText
                .fixedSize(horizontal: true, vertical: false)
                .offset(x: animate ? 0 : textWidth + marqueeSpacing)
                .animation(
                    animation,
                    value: animate
                )
            
            internalText
                .hidden()
                .layoutPriority(1)
        }
        .readContainerWidth()
        .clipped()
        .onPreferenceChange(ContainerWidthPreferenceKey.self) { width in
            containerWidth = width
            updateAnimation()
        }
        .onPreferenceChange(TextWidthPreferenceKey.self) { width in
            textWidth = width
            updateAnimation()
        }
    }
    
    private var animationDuration: Double {
        max(Double(textWidth / 50), 2.0) // 调整滚动速度
    }
    
    private func updateAnimation() {
        animate = false
        Task {
            //HACK: Had to reset animation this way when text width changed
            animate = containerWidth < textWidth
        }
    }
}

private struct ContainerWidthPreferenceKey: PreferenceKey {
    nonisolated(unsafe) static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

private struct TextWidthPreferenceKey: PreferenceKey {
    nonisolated(unsafe) static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

private extension View {
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


#Preview {
    VStack(alignment: .leading, spacing: 10) {
        MarqueeText(
            text: "测试加长名称+滚动效果测试+赶紧滚动",
        )
        
        MarqueeText(
            text: "测试普通名称",
        )
    }
    .frame(width: 300)
    .font(.system(size: 22, weight: .bold))
}

