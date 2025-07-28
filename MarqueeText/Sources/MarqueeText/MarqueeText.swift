// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI

public struct MarqueeText: View {
    
    let text: String
    
    @State private var textWidth: CGFloat = 0
    @State private var containerWidth: CGFloat = 0
    @State private var animate: Bool = false
    
    @Environment(\.marqueeSpacing) private var spacing
    @Environment(\.marqueePausingTime) private var pausingTime
    
    public init(text: String) {
        self.text = text
    }
    
    private var internalText: some View {
        Text(text)
            .lineLimit(1)
    }
    
    public var body: some View {
        
        let animation = Animation
            .linear(duration: animationDuration)
            .delay(pausingTime)
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
                .offset(x: animate ? 0 : textWidth + spacing)
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

#Preview {
    VStack(alignment: .leading, spacing: 18) {
        MarqueeText(
            text: "Everybody Wants To Rule the World - Lorde",
        )
        
        MarqueeText(
            text: "Safe & Sound (from \"the Hunger Games\" Soundtrack) [feat. The Civil Wars] - Taylor Swift",
        )
        .foregroundColor(.blue)
        .font(.system(size: 18, weight: .light))
        
        MarqueeText(
            text: "Leave Out All the Rest - LINKIN PARK",
        )
        .marqueeSpacing(2)
        .marqueeSpacing(0)
        
        MarqueeText(
            text: "A Bar Song (Tipsy)",
        )
    }
    .font(.system(size: 22, weight: .bold))
    .frame(width: 220)
    .padding(22)
    .background(Color.secondary.opacity(0.5))
    .clipShape(.rect(cornerRadius: 8))
}

