//
//  MarqueeText+Environent.swift
//  MarqueeText
//
//  Created by 盛立 on 2025/7/28.
//

import SwiftUI

struct MarqueeSpacingKey: EnvironmentKey {
    nonisolated(unsafe) static var defaultValue: CGFloat = 80
}

struct MarqueePausingTimeKey: EnvironmentKey {
    nonisolated(unsafe) static var defaultValue: TimeInterval = 1
}

extension EnvironmentValues {
    var marqueeSpacing: CGFloat {
        get { self[MarqueeSpacingKey.self] }
        set { self[MarqueeSpacingKey.self] = newValue }
    }

    var marqueePausingTime: TimeInterval {
        get { self[MarqueePausingTimeKey.self] }
        set { self[MarqueePausingTimeKey.self] = newValue }
    }
}

public extension View {

    func marqueeSpacing(_ value: CGFloat) -> some View {
        environment(\.marqueeSpacing, value)
    }

    func marqueePausingTime(_ value: TimeInterval) -> some View {
        environment(\.marqueePausingTime, value)
    }
}
