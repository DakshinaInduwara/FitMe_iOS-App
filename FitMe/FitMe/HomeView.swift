import SwiftUI

struct HomeView: View {
    @EnvironmentObject var healthKit: Health
    
    var body: some View {
        VStack {
            Text("Home").font(.title).padding()
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 5), count: 1)) {
                // Display step count
                if let stepAction = healthKit.actions["steps"] {
                    ActionCard(action: stepAction)
                }

                // Display calorie count
                if let calorieAction = healthKit.actions["calories"] {
                    ActionCard(action: calorieAction)
                }

                // Display running distance
                if let runningAction = healthKit.actions["running"] {
                    ActionCard(action: runningAction)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onAppear {
            // Fetch health data when the view appears
            healthKit.getSteps()
            healthKit.getCalories()
            healthKit.getRunningDistance()
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(Health())  // Injecting Health object into the preview
}
