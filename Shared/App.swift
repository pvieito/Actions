import SwiftUI

@main
struct ActionsApp: App {
	#if canImport(AppKit)
	@NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
	#endif

	var body: some Scene {
		WindowGroup {
			ContentView()
		}
			#if canImport(AppKit)
			.windowStyle(.hiddenTitleBar)
			.commands {
				CommandGroup(replacing: .newItem) {}
				CommandGroup(replacing: .help) {
					Link("Website", destination: "https://github.com/sindresorhus/Actions")
					Link("Rate on the App Store", destination: "macappstore://apps.apple.com/app/id1545870783?action=write-review")
					Link("More Apps by Me", destination: "macappstore://apps.apple.com/developer/id328077650")
					Divider()
					Button("Send Feedback…") {
						SSApp.openSendFeedbackPage()
					}
				}
			}
			#endif
	}
}

#if canImport(AppKit)
private final class AppDelegate: NSObject, NSApplicationDelegate {
	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool { true }
}
#endif