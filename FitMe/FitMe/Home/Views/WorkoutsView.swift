//
//  WorkoutsView.swift
//  FitMe
//
//  Created by Gairuka Bandara on 2024-11-11.
//

import SwiftUI

struct WorkoutsView: View {
    @StateObject var viewModel = HomeViewModel()
    @EnvironmentObject var healthKit: Health
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading) {
                    Text("Workouts")
                        .font(.largeTitle)
                        .padding()
                        .bold()
                    
                    if !viewModel.activities.isEmpty {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("")
                                    .font(.title2)
                                Spacer()
                                
                                NavigationLink {
                                    WorkoutsView()
                                } label: {
                                }
                            }
                            .padding(.horizontal)
                            .padding(.top)
                            //ScrollView(showsIndicators: false){
                            LazyVStack {
                                ForEach(viewModel.workouts, id: \.id) { workout in
                                    WorkoutCard(workout: workout)
                                }
                            }
                        }
                    }
                    //                    LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)){
                    //                        ForEach(viewModel.mockActivites, id: \.id) { activity in
                    //                            ActivityCard(activity: activity)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    WorkoutsView()
}
