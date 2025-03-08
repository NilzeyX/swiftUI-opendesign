# SwiftUI Open Design Library 🎨

![SwiftUI Open Design Library](https://img.shields.io/badge/SwiftUI-Open%20Design-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Swift](https://img.shields.io/badge/Swift-5.9%2B-orange)
![Platform](https://img.shields.io/badge/platform-iOS%20%7C%20macOS-lightgrey)

A collaborative collection of beautiful, reusable SwiftUI designs, animations, and visual effects. This library serves as a showcase and resource for developers looking to enhance their apps with stunning UI components.

## 🌟 Overview

SwiftUI Open Design Library is a growing collection of beautiful UI designs, animations, and visual effects implemented in SwiftUI. The goal is to create a community-driven repository of reusable components that developers can easily incorporate into their own projects.

Each design in this library is:

- **Self-contained** - Can be used independently
- **Customizable** - Designed with parameters that can be adjusted
- **Well-documented** - Includes explanations of how it works
- **Beginner-friendly** - Includes comments to help new SwiftUI developers understand the implementation

## 🚀 Getting Started

### Requirements

- iOS 16.0+ / macOS 13.0+
- Swift 5.9+
- Xcode 15.0+

### Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/swiftUI-opendesign.git
```

2. Open the project in Xcode:

```bash
cd swiftUI-opendesign
open swiftUI-opendesign.xcodeproj
```

3. Build and run the project to see the design showcase.

### Using Components in Your Project

Each component is designed to be easily copied into your own projects. Simply:

1. Copy the relevant Swift files into your project
2. Import any required resources (shaders, assets, etc.)
3. Use the component in your SwiftUI views

For example, to use the Noisy Gradient:

Copy folder "NoisyGradient Design" especially the extensions
Read the original view to get an idea of how it's functioning
Use the extensions of view model logic relevant to you

```swift
import SwiftUI

struct MyView: View {
    var body: some View {
        ZStack {
            // Apply the noisy purple-teal gradient
            LinearGradient.noisyPurpleTeal()
                .edgesIgnoringSafeArea(.all)

            // Your content here
            Text("Hello, World!")
                .foregroundColor(.white)
        }
    }
}
```

## 🤝 Contributing

Contributions are welcome and encouraged! If you have a cool design, animation, or visual effect you'd like to share:

1. **Fork** the repository
2. **Create a new branch** for your design
3. **Add your design** in a NEW directory
   - Create a new directory with all relevant subfolders
   - Include all necessary files (Swift, Metal shaders, etc.)
4. **Document your design**:
   - Add comments explaining how the design works
   - Include any parameters that can be customized
   - Explain any dependencies or requirements
   - Make it beginner friendly
5. **Submit a pull request** with a description of your design in as much detail as possible

### Contribution Guidelines

When contributing, please:

- Update the bottom of this README.md with acknowledgements if you have used other creators code
- Ensure your code is well-commented and follows good design practices
- Include a preview image or GIF of your design if possible
- Explain the use case or inspiration for your design
- Mention any performance considerations or limitations
- If using third-party code or resources, ensure proper attribution

## 🔍 Design Structure

Each design should follow this structure:

1. **Main View File**: The SwiftUI view that implements the design
2. **Supporting Files**: Any additional files needed (view models, extensions, etc.)
3. **README.md**: A detailed explanation of the design with usage examples

## 📚 Learning Resources

For those new to SwiftUI or looking to improve their skills:

- [Apple's SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
- [SwiftUI by Example](https://www.hackingwithswift.com/quick-start/swiftui)
- [Metal Shading Language Specification](https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf)

## 📄 License

This project is available under the MIT License. See the LICENSE file for more information.

## 🙏 Acknowledgements

- Special thanks to all contributors who share their designs
- Some shader code adapted from [Inferno](https://github.com/twostraws/Inferno) by Paul Hudson

---

Made with ❤️ by the SwiftUI community
