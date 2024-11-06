//
//  HealthManager.swift
//  FitMe
//
//  Created by Gairuka Bandara on 2024-11-06.
//

import Foundation
import HealthKit

extension Date {
    static var startOFDay: Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: Date())
    }
}

extension Double {
    func formattedNumberString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        
        return formatter.string(from: NSNumber(value: self)) ?? "0"
    }
}

class HealthManager{
    
    static let shared = HealthManager()
    let healthStore = HKHealthStore()
    
    private init(){
        Task{
            do{
                try await requestHealthAccess()
            } catch{
                print(error.localizedDescription)
            }
        }
    }
    func requestHealthAccess() async throws {
        let calories = HKQuantityType(.activeEnergyBurned)
        let exercise = HKQuantityType(.appleExerciseTime)
        let stand = HKCategoryType(.appleStandHour)
        let steps = HKQuantityType(.stepCount)
        
        let healthTypes: Set = [calories, exercise, stand, steps]
        try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
    }
    
    
    func fetchTodayCaloriesBurned(completion: @escaping (Result<Double, Error>) -> Void) {
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOFDay, end: Date())
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate) { _, results, error in guard let quantity = results?.sumQuantity(), error == nil else {
            completion(.failure(NSError()))
            return
        }
            let calorieCount = quantity.doubleValue(for: .kilocalorie())
            completion(.success(calorieCount))
        }
        healthStore.execute(query)
    }
    
    func fetchTodayExerciseTime(completion: @escaping (Result<Double, Error>) -> Void) {
        let exercise = HKQuantityType(.appleExerciseTime)
        let predicate = HKQuery.predicateForSamples(withStart: .startOFDay, end: Date())
        let query = HKStatisticsQuery(quantityType: exercise, quantitySamplePredicate: predicate) { _, results, error in guard let quantity = results?.sumQuantity(), error == nil else {
            completion(.failure(NSError()))
            return
        }
            let exerciseTime = quantity.doubleValue(for: .minute())
            completion(.success(exerciseTime))
        }
        healthStore.execute(query)
    }
    
    func fetchTodayStandHours(completion: @escaping (Result<Int, Error>) -> Void) {
        let stand = HKCategoryType(.appleStandHour)
        let predicate = HKQuery.predicateForSamples(withStart: .startOFDay, end: Date())
        let query = HKSampleQuery(sampleType: stand, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { _, results, error in guard let samples = results as? [HKCategorySample], error == nil else {
            completion(.failure(NSError()))
            return
        }
            print(samples)
            print(samples.map({ $0.value}))
            let standCount = samples.filter({ $0.value == 0 }).count
            completion(.success(standCount))
        }
        healthStore.execute(query)
        
    }
    
    //Fitness Activity
    func fetchTodaySteps(completion: @escaping (Result<Activity, Error>) -> Void){
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOFDay, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, results, error in guard let quantity = results?.sumQuantity(), error == nil else {
            completion(.failure(NSError()))
            return
        }
            let steps = quantity.doubleValue(for: .count())
            let activity = Activity(id: 0, title: "Today Steps", subtitle: "Goal: 800", image: "figure.walk", tinColor: .green, amount: steps.formattedNumberString())
            completion(.success(activity))
        }
        healthStore.execute(query)
    }
}
