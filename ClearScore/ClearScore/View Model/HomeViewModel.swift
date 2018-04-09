//
//  HomeViewModel.swift
//  ClearScore
//
//  Created by Joshua Thompson on 09/04/2018.
//  Copyright © 2018 Joshua Thompson. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol {
    var report: Dynamic<Report?> { get }
    var percentageScore: Double { get }
    var score: Int? { get }
    var description: String? { get }
    var maxScore: String? { get }
    
    var service: ReportServiceProtocol { get }

    func getReport()
}

struct HomeViewModel: HomeViewModelProtocol {
    
    var report: Dynamic<Report?> = Dynamic(nil)
    let service: ReportServiceProtocol
    
    init(service: ReportServiceProtocol = ReportService.shared) {
        self.service = service
    }
    
    var score: Int? {
        return report.value?.creditReportInfo?.score
    }
    
    var description: String? {
        return report.value?.creditReportInfo?.equifaxScoreBandDescription
    }
    
    var percentageScore: Double {
        guard let score = report.value?.creditReportInfo?.score,
            let maxScoreValue = report.value?.creditReportInfo?.maxScoreValue else {
                return 0
        }
        let percentage = Double(score) * (100/Double(maxScoreValue))
        return percentage
    }
    
    var maxScore: String? {
        guard let maxScoreValue = report.value?.creditReportInfo?.maxScoreValue else {
                return nil
        }
        return "out of \(maxScoreValue)"
    }
    
    func getReport() {
        service.getReport(completionHandler: { (report, error) in
            //When we get an error, we can manage it from here and
            //display it accordingly
            self.report.value = report
        })
    }
}
