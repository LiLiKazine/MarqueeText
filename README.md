# MarqueeText

A SwiftUI component for creating smooth, continuous scrolling text animations - perfect for displaying long text that doesn't fit in the available space.

## Features

- 📱 **iOS 13+ Support**: Compatible with modern iOS versions
- 🎨 **Highly Customizable**: Support for custom fonts, colors, and styling
- 🔄 **Auto-sizing**: Automatically detects when scrolling is needed
- ⚡ **Environment Support**: Configurable spacing and pausing time via SwiftUI environment
- 🛠 **SwiftUI Native**: Built specifically for SwiftUI with modern Swift 6 concurrency
- 🎯 **Smart Animation**: Only animates when text overflows the container
- 📏 **Adaptive Speed**: Animation speed adjusts based on text length

## Installation

### Swift Package Manager

Add MarqueeText to your project using Xcode:

1. In Xcode, go to **File** → **Add Package Dependencies**
2. Enter the repository URL:
```
https://github.com/LiLiKazine/MarqueeText.git
```
3. Click **Add Package**

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/LiLiKazine/MarqueeText.git", from: "0.0.2")
]
```

## Usage

### Basic Usage

```swift
import SwiftUI
import MarqueeText

struct ContentView: View {
    var body: some View {
        MarqueeText(text: "This is a very long text that will scroll smoothly across the screen")
            .frame(width: 200)
    }
}
```

### With Custom Styling

```swift
MarqueeText(text: "Custom styled scrolling text with bold font")
    .font(.system(size: 22, weight: .bold))
    .foregroundColor(.blue)
    .frame(width: 300)
```

### Environment Configuration

You can customize the marquee behavior using SwiftUI environment values:

```swift
VStack {
    MarqueeText(text: "Custom spacing between text repetitions")
        .marqueeSpacing(20) // Custom spacing between repeated text
        
    MarqueeText(text: "Custom pause duration before animation starts")
        .marqueePausingTime(2.0) // 2 second pause before scrolling
}
```

### Multiple Marquee Texts

```swift
VStack(alignment: .leading, spacing: 18) {
    MarqueeText(text: "Everybody Wants To Rule the World - Lorde")
    
    MarqueeText(text: "Safe & Sound (from \"the Hunger Games\" Soundtrack) [feat. The Civil Wars] - Taylor Swift")
        .foregroundColor(.blue)
        .font(.system(size: 18, weight: .light))
    
    MarqueeText(text: "Leave Out All the Rest - LINKIN PARK")
        .marqueeSpacing(2)
    
    MarqueeText(text: "A Bar Song (Tipsy)")
}
.font(.system(size: 22, weight: .bold))
.frame(width: 220)
```

## How It Works

MarqueeText automatically:
- Measures the text width and container width using SwiftUI's preference system
- Only animates when text is longer than the container
- Provides smooth, continuous scrolling animation with customizable timing
- Adjusts animation speed based on text length (minimum 2 seconds, scales with content)
- Uses multiple text views to create seamless looping effect
- Supports SwiftUI environment values for global configuration

## Environment Values

MarqueeText supports the following environment values:

- `marqueeSpacing(_:)`: Sets the spacing between repeated text instances (default: 80)
- `marqueePausingTime(_:)`: Sets the pause duration before animation starts (default: 1 second)

## Requirements

- iOS 13.0+

## Example App

The repository includes a demo app showing various use cases:

```swift
struct DemoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            MarqueeText(text: "Everybody Wants To Rule the World - Lorde")
            
            MarqueeText(text: "Safe & Sound (from \"the Hunger Games\" Soundtrack) [feat. The Civil Wars] - Taylor Swift")
                .foregroundColor(.blue)
                .font(.system(size: 18, weight: .light))
            
            MarqueeText(text: "Leave Out All the Rest - LINKIN PARK")
                .marqueeSpacing(2)
            
            MarqueeText(text: "A Bar Song (Tipsy)")
        }
        .font(.system(size: 22, weight: .bold))
        .frame(width: 220)
        .padding(22)
        .background(Color.secondary.opacity(0.5))
        .clipShape(.rect(cornerRadius: 8))
    }
}
```

## Performance Notes

- The component uses SwiftUI's preference system for efficient size calculations
- Animation only runs when necessary (when text overflows)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is available under the MIT License. 

## Author

LiLi - [@LiLiKazine](https://github.com/LiLiKazine)

---

**MarqueeText** - Making long text beautiful in SwiftUI 📱✨
