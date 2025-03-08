import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Header Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("SwiftUI Open Design Library")
                            .font(.largeTitle.bold())
                            .foregroundStyle(.linearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))

                        Text("🎨 A collaborative collection of beautiful, reusable SwiftUI designs")
                            .font(.title3)
                            .foregroundColor(.secondary)
                    }
                    .padding(.bottom, 20)

                    // Overview Section
                    CardView {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("🌟 Overview")
                                .font(.title2.bold())

                            Text("SwiftUI Open Design Library is a growing collection of beautiful UI designs, animations, and visual effects implemented in SwiftUI. Our goal is to create a community-driven repository of reusable components that developers can easily incorporate into their own projects.")
                                .foregroundColor(.secondary)
                        }
                    }

                    // Features Section
                    CardView {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("✨ Features")
                                .font(.title2.bold())

                            VStack(alignment: .leading, spacing: 8) {
                                FeatureRow(icon: "cube.fill", text: "Self-contained components")
                                FeatureRow(icon: "slider.horizontal.3", text: "Fully customizable")
                                FeatureRow(icon: "doc.text.fill", text: "Well-documented")
                                FeatureRow(icon: "hand.wave.fill", text: "Beginner-friendly")
                            }
                        }
                    }

                    // Call to Action
                    VStack(spacing: 16) {
                        Text("Join our community and contribute your designs!")
                            .font(.headline)
                            .multilineTextAlignment(.center)

                        NavigationLink {
                            // LaunchView() or Contribution Guide View
                            LaunchView()
                        } label: {
                            Text("Get Started")
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                        }
                    }
                    .padding(.vertical, 20)
                }
                .padding()
            }
            .navigationTitle("Open Design")
        }
    }
}

// Card View Component
struct CardView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading) {
            content
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

// Feature Row Component
struct FeatureRow: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 24)
            Text(text)
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
