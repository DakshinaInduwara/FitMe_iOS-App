import SwiftUI
import Firebase

@main
struct SwiftUIAuthApp: App {
    @StateObject var viewModel = AuthViewModel()

    init() {
        FirebaseApp.comfigure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(viewModel)
        }
    }    
}