import CoreGraphics
import SwiftUI

enum NoiseGenerator {
    static func generateNoiseTexture(size: CGSize, scale: CGFloat = 1.0) -> UIImage {
        let width = Int(size.width * scale)
        let height = Int(size.height * scale)

        var pixels = [UInt8](repeating: 0, count: width * height * 4)
        for y in 0 ..< height {
            for x in 0 ..< width {
                let offset = (y * width + x) * 4
                let randomValue = UInt8.random(in: 0 ... 255)
                pixels[offset] = randomValue // R
                pixels[offset + 1] = randomValue // G
                pixels[offset + 2] = randomValue // B
                pixels[offset + 3] = 40 // Alpha (reduced for subtle effect)
            }
        }

        let bitsPerComponent = 8
        let bytesPerRow = width * 4
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGImageAlphaInfo.premultipliedLast.rawValue

        guard let context = CGContext(
            data: &pixels,
            width: width,
            height: height,
            bitsPerComponent: bitsPerComponent,
            bytesPerRow: bytesPerRow,
            space: colorSpace,
            bitmapInfo: bitmapInfo
        ), let cgImage = context.makeImage() else {
            return UIImage()
        }

        return UIImage(cgImage: cgImage)
    }
}

extension View {
    func withNoise(opacity: Double = 0.1) -> some View {
        modifier(NoiseModifier(opacity: opacity))
    }
}

struct NoiseModifier: ViewModifier {
    let opacity: Double

    func body(content: Content) -> some View {
        ZStack {
            content

            GeometryReader { geometry in
                Image(uiImage: NoiseGenerator.generateNoiseTexture(size: geometry.size))
                    .resizable()
                    .blendMode(.overlay)
                    .opacity(opacity)
            }
        }
    }
}
