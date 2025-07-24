// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI

public struct MarqueeText: View {
    let text: String
    let font: Font
    
    @State private var textWidth: CGFloat = 0
    @State private var containerWidth: CGFloat = 0
    @State private var animate: Bool = false
    
    private let spacing: CGFloat = 60

    public init(text: String, font: Font = .body) {
        self.text = text
        self.font = font
    }
    
    private var internalText: some View {
        Text(text)
            .font(font)
            .lineLimit(1)
    }
    
    public var body: some View {
        
        let animation = Animation
            .linear(duration: animationDuration)
            .repeatForever(autoreverses: false)
        
        ZStack(alignment: .leading) {
            internalText
                .fixedSize(horizontal: true, vertical: false)
                .offset(x: animate ? -textWidth - spacing : 0)
                .animation(
                    animation,
                    value: animate
                )
                .readTextWidth()
            
            internalText
                .fixedSize(horizontal: true, vertical: false)
                .offset(x: animate ? 0 : textWidth + 60)
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
        self.background(
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
            font: .system(size: 22, weight: .bold)
        )
        
        MarqueeText(
            text: "测试普通名称",
            font: .system(size: 22, weight: .bold)
        )
        Spacer()
    }
    .frame(width: 300)

}

