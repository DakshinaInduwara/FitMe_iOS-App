//
//  ChartsView.swift
//  FitMe
//
//  Created by Gairuka Bandara on 2024-11-07.
//

import SwiftUI
import Charts

struct DailyStepModel: Identifiable {
    let id = UUID()
    let date: Date
    let count: Int
}

struct MonthlyStepModel: Identifiable {
    let id = UUID()
    let date: Date
    let count: Int
}


enum ChartOptions: String, CaseIterable {
    case oneWeek = "1W"
    case oneMonth = "1M"
    case threeMonths = "3M"
    case yearToDate = "YTD"
    case oneYear = "1Y"
}

class ChartViewModel: ObservableObject {
    var mockWeekChartData = [
        DailyStepModel(date: Date(), count: 12345),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), count: 76524),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(), count: 56732),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), count: 20000),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -4, to: Date()) ?? Date(), count: 99975),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(), count: 78638),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -6, to: Date()) ?? Date(), count: 45627),
    ]
    
    var mockYTDChartData = [
        MonthlyStepModel(date: Date(), count: 12345),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date(), count: 76524),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -2, to: Date()) ?? Date(), count: 56732),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -3, to: Date()) ?? Date(), count: 20000),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -4, to: Date()) ?? Date(), count: 99975),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -5, to: Date()) ?? Date(), count: 78328),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -6, to: Date()) ?? Date(), count: 37892),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -7, to: Date()) ?? Date(), count: 87776),
    ]
    
    var mockOneMonthdata = [
        DailyStepModel(date: Date(), count: 3442),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), count: 4221),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(), count: 2342),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), count: 2323),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -4, to: Date()) ?? Date(), count: 8243),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(), count: 8285),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -6, to: Date()) ?? Date(), count: 7714),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date(), count: 2901),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -8, to: Date()) ?? Date(), count: 8522),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -9, to: Date()) ?? Date(), count: 8944),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -10, to: Date()) ?? Date(), count: 3198),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -11, to: Date()) ?? Date(), count: 9559),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -12, to: Date()) ?? Date(), count: 9222),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -13, to: Date()) ?? Date(), count: 7534),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -14, to: Date()) ?? Date(), count: 5905),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -15, to: Date()) ?? Date(), count: 7553),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -16, to: Date()) ?? Date(), count: 2813),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -17, to: Date()) ?? Date(), count: 7861),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -18, to: Date()) ?? Date(), count: 7313),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -19, to: Date()) ?? Date(), count: 7669),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -20, to: Date()) ?? Date(), count: 8424),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -21, to: Date()) ?? Date(), count: 9907),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -22, to: Date()) ?? Date(), count: 8521),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -23, to: Date()) ?? Date(), count: 5471),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -24, to: Date()) ?? Date(), count: 9227),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -25, to: Date()) ?? Date(), count: 9794),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -26, to: Date()) ?? Date(), count: 6543),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -27, to: Date()) ?? Date(), count: 2688),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -28, to: Date()) ?? Date(), count: 9187),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -29, to: Date()) ?? Date(), count: 4136)
    ]
    
    @Published var OneWeekAverage = 1243
    @Published var OneWeekTotal = 8723
    
    @Published var mockOneMonthData = [DailyStepModel]()
    @Published var OneMonthAverage = 0
    @Published var OneMonthTotal = 0
    
    @Published var mockThreeMonthData = [DailyStepModel]()
    @Published var threeMonthAverage = 0
    @Published var threeMonthtotal = 0
    
    @Published var ytdAverage = 0
    @Published var ytdTotal = 0
    
    @Published var oneYearAverage = 0
    @Published var oneYearTotal = 0
    
    init() {
        let mockOneMonth = mockDataForDays(days: 30)
        let mockThreeMonth = mockDataForDays(days: 90)
        DispatchQueue.main.async {
            self.mockOneMonthdata = mockOneMonth
            self.mockThreeMonthData = mockThreeMonth
        }
    }
    
    func mockDataForDays(days: Int) -> [DailyStepModel] {
        var mockData = [DailyStepModel]()
        for day in 0..<days {
            let currentDate = Calendar.current.date(byAdding: .day, value: -day, to: Date()) ?? Date()
            let randomStepCount = Int.random(in: 5000...15000)
            let dailyStepData = DailyStepModel(date: currentDate, count: Int(randomStepCount))
            mockData.append(dailyStepData)
        }
        return mockData
    }
}

struct ChartsView: View {
    @StateObject var viewModel = ChartViewModel()
    @State var selectedChart : ChartOptions = .oneWeek
    var body: some View {
        VStack{
            Text("Charts")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            ZStack {
                switch selectedChart {
                case .oneWeek:
                    VStack {
                        ChartDataView(average: viewModel.OneWeekAverage, total: viewModel.OneWeekTotal)
                        Chart {
                            ForEach(viewModel.mockWeekChartData) { data in
                                BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps",data.count))
                            }
                        }
                    }
                case .oneMonth:
                    VStack {
                        ChartDataView(average: viewModel.OneMonthAverage, total: viewModel.OneMonthTotal)
                        Chart {
                            ForEach(viewModel.mockOneMonthdata) { data in
                                BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps",data.count))
                            }
                        }
                    }
                case .threeMonths:
                    VStack {
                        ChartDataView(average: viewModel.threeMonthAverage, total: viewModel.OneWeekTotal)
                        Chart {
                            ForEach(viewModel.mockThreeMonthData) { data in
                                BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps",data.count))
                            }
                        }
                    }
                case .yearToDate:
                    VStack {
                        ChartDataView(average: viewModel.ytdAverage, total: viewModel.ytdTotal)
                        Chart {
                            ForEach(viewModel.mockYTDChartData) { data in
                                BarMark(x: .value(data.date.formatted(), data.date, unit: .month), y: .value("Steps",data.count))
                            }
                        }
                    }
                case .oneYear:
                    VStack {
                        ChartDataView(average: viewModel.oneYearAverage, total: viewModel.oneYearTotal)
                        Chart {
                            ForEach(viewModel.mockYTDChartData) { data in
                                BarMark(x: .value(data.date.formatted(), data.date, unit: .month), y: .value("Steps",data.count))
                            }
                        }
                    }
                }
            }
            .foregroundColor(.pink)
            .frame(maxHeight: 450)
            .padding(.horizontal)
            
            HStack{
                ForEach(ChartOptions.allCases, id:\.rawValue) { option in
                    Button(option.rawValue) {
                        withAnimation {
                            selectedChart = option
                        }
                    }
                    .padding()
                    .foregroundColor(selectedChart == option ? .white : .pink)
                    .background(selectedChart == option ? .pink : .clear)
                    .cornerRadius(10)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ChartsView()
}
