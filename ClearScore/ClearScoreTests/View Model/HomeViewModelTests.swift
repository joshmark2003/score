//
//  HomeViewModelTests.swift
//  ClearScoreTests
//
//  Created by Joshua Thompson on 09/04/2018.
//  Copyright © 2018 Joshua Thompson. All rights reserved.
//

import XCTest
@testable import ClearScore

class HomeViewModelTests: XCTestCase {
    
    var reportService: ReportServiceMock!

    override func setUp() {
        super.setUp()
        reportService = ReportServiceMock()
    }
    
    override func tearDown() {
        reportService = nil
        super.tearDown()
    }
    
    func test_GetReport_ReturnsReport() {
        
        reportService.getReportMock = Report.fakeReport()
        
        let viewModel = HomeViewModel(service: reportService)
        viewModel.getReport()

        reportService.getReport(completionHandler: { (report, error) in
            XCTAssertNotNil(report, "Report should not be nil")
            XCTAssertNil(error, "Error is nil when we get report data")
            XCTAssertEqual(viewModel.score, report?.creditReportInfo?.score, "Scores should be equal")
            XCTAssertEqual(viewModel.description, report?.creditReportInfo?.equifaxScoreBandDescription, "Description should be equal")
            XCTAssertEqual(viewModel.maxScore, "out of \(String(describing: report?.creditReportInfo?.maxScoreValue ?? 0))", "MaxScore should be equal")
            
            let score = Double(report?.creditReportInfo?.score ?? 0) * (100/Double(report?.creditReportInfo?.maxScoreValue ?? 0))
            XCTAssertEqual(viewModel.percentageScore, score, "PercentageScore should be equal")
        })
    }
}
