import SwiftUI

struct HomeView: View {
    @State var calories: Int = 123
    @State var active: Int = 52
    @State var stand: Int = 8
    @EnvironmentObject var healthKit: Health
    
    var mockActivites = [
        Activity(id: 0, title: "Daily steps", subtitle: "Goal 12,000", image: "figure.walk", tinColor: .green, amount: "9812"),
        Activity(id: 1, title: "Daily steps", subtitle: "Goal 12,000", image: "figure.walk", tinColor: .red, amount: "9812"),
        Activity(id: 2, title: "Daily steps", subtitle: "Goal 12,000", image: "figure.run", tinColor: .blue, amount: "9812"),
        Activity(id: 3, title: "Daily steps", subtitle: "Goal 12,000", image: "figure.walk", tinColor: .purple, amount: "9812"),
        Activity(id: 4, title: "Daily steps", subtitle: "Goal 12,000", image: "figure.run", tinColor: .yellow, amount: "9812"),
        Activity(id: 5, title: "Daily steps", subtitle: "Goal 12,000", image: "figure.run", tinColor: .orange, amount: "9812")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading) {
                    Text("Home")
                        .font(.largeTitle)
                        .padding()
                    HStack {
                        Spacer()
                        
                        VStack {
                            VStack(alignment: .leading, spacing: 8){
                                Text("Calories")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.red)
                                
                                Text("123 kcal")
                                    .bold()
                            }
                            .padding(.bottom)
                            VStack(alignment: .leading, spacing: 8){
                                Text("Active")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.green)
                                
                                Text("30 misns")
                                    .bold()
                            }
                            .padding(.bottom)
                            VStack(alignment: .leading, spacing: 8){
                                Text("Stand")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.blue)
                                
                                Text("8 hours")
                                    .bold()
                            }
                        }
                        Spacer()
                        
                        ZStack {
                            ProgressCircleView(progress: $calories, goal: 600, color: .red)
                            ProgressCircleView(progress: $active, goal: 60, color: .green)
                                .padding(.all, 20)
                            ProgressCircleView(progress: $stand, goal: 12, color: .blue)
                                .padding(.all, 40)
                        }
                        .padding(.horizontal)
                        Spacer()
                    }
                    .padding()
                    
                    HStack {
                        Text("Fitness Activity")
                            .font(.title2)
                        Spacer()
                        Button {
                            print("show more")
                        } label: {
                            Text("Show more")
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)){
                        ForEach(mockActivites, id: \.id) { activity in
                            ActivityCard(activity: activity)
                        }
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("Recent Workouts")
                            .font(.title2)
                        Spacer()
                        
                        NavigationLink {
                            EmptyView()
                        } label: {
                            Text("Show more")
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        
        
//        VStack {
//            Text("Home").font(.title).padding()
//            LazyVGrid(columns: Array(repeating: GridItem(spacing: 5), count: 1)) {
//                // Display step count
//                if let stepAction = healthKit.actions["steps"] {
//                    ActionCard(action: stepAction)
//                }
//
//                // Display calorie count
//                if let calorieAction = healthKit.actions["calories"] {
//                    ActionCard(action: calorieAction)
//                }
//
//                // Display running distance
//                if let runningAction = healthKit.actions["running"] {
//                    ActionCard(action: runningAction)
//                }
//            }
//            .padding()
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
//        .onAppear {
//            // Fetch health data when the view appears
//            healthKit.getSteps()
//            healthKit.getCalories()
//            healthKit.getRunningDistance()
//        }
    }
}

#Preview {
    HomeView()
        .environmentObject(Health())  // Injecting Health object into the preview
}