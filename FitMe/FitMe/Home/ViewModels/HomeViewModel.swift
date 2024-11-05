//
//  HomeViewModel.swift
//  FitMe
//
//  Created by Gairuka Bandara on 2024-11-06.
//

import SwiftUI
class HomeViewModel: ObservableObject {
    
    @State var calories: Int = 123
    @State var active: Int = 52
    @State var stand: Int = 8
    
    var mockActivites = [
        Activity(id: 0, title: "Daily steps", subtitle: "Goal 12,000", image: "figure.walk", tinColor: .green, amount: "9812"),
        Activity(id: 1, title: "Daily steps", subtitle: "Goal 12,000", image: "figure.walk", tinColor: .red, amount: "9812"),
        Activity(id: 2, title: "Daily steps", subtitle: "Goal 12,000", image: "figure.run", tinColor: .blue, amount: "9812"),
        Activity(id: 3, title: "Daily steps", subtitle: "Goal 12,000", image: "figure.walk", tinColor: .purple, amount: "9812"),
        Activity(id: 4, title: "Daily steps", subtitle: "Goal 12,000", image: "figure.run", tinColor: .yellow, amount: "9812"),
        Activity(id: 5, title: "Daily steps", subtitle: "Goal 12,000", image: "figure.run", tinColor: .orange, amount: "9812")
    ]
    
    var mockWorkouts = [
        Workout(id: 0, title: "Running", image: "figure.run", tinColor: .cyan, duration: "20 mins", date: "Nov 5", calories: "300 kcal"),
        Workout(id: 1, title: "Strength Training", image: "figure.run", tinColor: .red, duration: "30 mins", date: "Nov 2", calories: "240 kcal"),
        Workout(id: 2, title: "Walking", image: "figure.run", tinColor: .blue, duration: "23 mins", date: "Nov 4", calories: "522 kcal"),
        Workout(id: 3, title: "Climbing", image: "figure.run", tinColor: .yellow, duration: "35 mins", date: "Nov 5", calories: "431 kcal")
    ]
}
