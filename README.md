# MarqueeText

A SwiftUI component for creating smooth, continuous scrolling text animations - perfect for displaying long text that doesn't fit in the available space.

## Features

- 📱 **iOS 13+ Support**: Compatible with modern iOS versions
- 🎨 **Customizable**: Support for custom fonts and styling
- 🔄 **Auto-sizing**: Automatically detects when scrolling is needed
- 🛠 **SwiftUI Native**: Built specifically for SwiftUI with modern Swift concurrency

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
    .package(url: "https://github.com/LiLiKazine/MarqueeText.git", from: "1.0.0")
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

### Custom Font

```swift
MarqueeText(
    text: "Custom styled scrolling text with bold font",
    font: .system(size: 22, weight: .bold)
)
.frame(width: 300)
```

### In a List or VStack

```swift
VStack(alignment: .leading, spacing: 10) {
    MarqueeText(
        text: "First scrolling item with a very long description",
        font: .headline
    )
    .frame(width: 250)
    
    MarqueeText(
        text: "Second item that also scrolls when needed",
        font: .body
    )
    .frame(width: 250)
}
```

## How It Works

MarqueeText automatically:
- Measures the text width and container width
- Only animates when text is longer than the container
- Provides smooth, continuous scrolling animation
- Adjusts animation speed based on text length

## Requirements

- iOS 13.0+

## Example App

The repository includes a demo app showing various use cases:

```swift
struct DemoView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Short text (no scrolling)
            MarqueeText(text: "Short text")
                .frame(width: 300)
                .border(Color.gray)
            
            // Long text (scrolling)
            MarqueeText(
                text: "This is a very long text that will demonstrate the smooth scrolling animation effect",
                font: .system(size: 18, weight: .medium)
            )
            .frame(width: 300)
            .border(Color.gray)
        }
        .padding()
    }
}
```

## Performance Notes

- The component uses SwiftUI's preference system for efficient size calculations
- Animation only runs when necessary (when text overflows)
- Optimized for smooth 60fps animations
- Minimal memory footprint

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is available under the MIT License. See the LICENSE file for more info.

## Author

LiLi - [@LiLiKazine](https://github.com/LiLiKazine)

---

**MarqueeText** - Making long text beautiful in SwiftUI 📱✨
