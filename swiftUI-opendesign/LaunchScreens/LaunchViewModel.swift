import Foundation
import SwiftUI

// I am used with SwiftUI views and app initialization. I basically say "Hey, I'm going to handle all the loading screen stuff and tell your app when things change!"
class LaunchViewModel: ObservableObject {
    @Published var isLoading: Bool = true // I am used with progress bars, loading spinners, and view transitions. I basically say "Hey if you want to tell me that I'm loading pass a true or false, if nothing passes, its true"

    @Published var loadingProgress: Double = 0.0 // I am used with progress bars, loading animations, and status indicators. I basically say "Hey I'll tell you how far along we are from 0 to 1, starting at 0"

    @Published var shouldAnimateElements: Bool = false // I am used with loading text, progress circles, and UI transitions. I basically say "Hey when you set me to true, I'll tell your fancy animations to start moving"

    @Published var shouldDismissLaunchScreen: Bool = false // I am used with navigation controllers, view transitions, and app state. I basically say "Hey when you set me to true, I'll make the launch screen go away"

    private let baseLoadTime: Double = 3.0 // I am used with timer calculations and loading animations. I basically say "Hey I'm going to make sure we show the launch screen for at least 3 seconds"

    private var additionalLoadTime: Double = 0.0 // I am used with network checks, data loading, and system status. I basically say "Hey I'll add extra seconds if the app needs more time to get ready"

    private var loadingTimer: Timer? // I am used with progress updates and animation timing. I basically say "Hey I'll tick every 0.1 seconds to update how far along we are"

    init() { // I am used with view creation and app startup. I basically say "Hey as soon as you create me, I'll start the loading process"
        startLoading()
    }

    func startLoading() { // I am used with initial load and reload scenarios. I basically say "Hey I'll set everything back to the start and begin the loading process"
        isLoading = true
        loadingProgress = 0.0
        shouldAnimateElements = true
        shouldDismissLaunchScreen = false

        checkAppStatus()

        let totalLoadTime = baseLoadTime + additionalLoadTime

        loadingTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] timer in // I am used with progress updates and memory management. I basically say "Hey every 0.1 seconds I'll update how far along we are"
            guard let self = self else {
                timer.invalidate()
                return
            }

            let progressIncrement = 0.1 / totalLoadTime
            self.loadingProgress += progressIncrement

            if self.loadingProgress >= 1.0 {
                self.completeLoading()
                timer.invalidate()
            }
        }
    }

    private func checkAppStatus() { // I am used with system checks and load time calculation. I basically say "Hey I'll figure out if we need to wait a bit longer by adding 0-2 seconds"
        additionalLoadTime = Double.random(in: 0.0 ... 2.0)
    }

    private func completeLoading() { // I am used with loading completion and view transitions. I basically say "Hey we're done loading, let me clean up and tell everyone we can show the main app"
        isLoading = false
        loadingProgress = 1.0

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.shouldDismissLaunchScreen = true
        }
    }

    func restartLoading() { // I am used with retry scenarios and error recovery. I basically say "Hey something went wrong? No problem, I'll start the whole process over"
        loadingTimer?.invalidate()
        startLoading()
    }

    deinit { // I am used with cleanup and memory management. I basically say "Hey I'm being deleted, let me clean up any timers so we don't waste memory"
        loadingTimer?.invalidate()
    }
}

// USAGE GUIDE FOR LAUNCHVIEW:
// 1. Create your LaunchViewModel in your LaunchView:
//    @StateObject private var viewModel = LaunchViewModel()
//
// 2. Use the published properties in your view:
//    - viewModel.isLoading -> Control loading state visibility
//    - viewModel.loadingProgress -> Update progress bar or loading indicators (0.0 to 1.0)
//    - viewModel.shouldAnimateElements -> Trigger animations when true
//    - viewModel.shouldDismissLaunchScreen -> Handle transition to main app
//
// Example usage in LaunchView:
//
// struct LaunchView: View {
//     @StateObject private var viewModel = LaunchViewModel()
//
//     var body: some View {
//         ZStack {
//             // Your launch screen content
//             ProgressView(value: viewModel.loadingProgress)
//                 .opacity(viewModel.isLoading ? 1 : 0)
//
//             // Animated elements
//             YourAnimatedView()
//                 .opacity(viewModel.shouldAnimateElements ? 1 : 0)
//         }
//         .onChange(of: viewModel.shouldDismissLaunchScreen) { shouldDismiss in
//             if shouldDismiss {
//                 // Navigate to your main app view
//             }
//         }
//     }
// }
//
// Note: The loading process starts automatically when LaunchViewModel is initialized.
// If you need to restart the loading process, call viewModel.restartLoading()
