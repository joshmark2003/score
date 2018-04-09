//
//  ReportServiceTests.swift
//  ClearScoreTests
//
//  Created by Joshua Thompson on 09/04/2018.
//  Copyright © 2018 Joshua Thompson. All rights reserved.
//

import XCTest
@testable import ClearScore

class ReportServiceTests: XCTestCase {
    
    var session: URLSessionMock!
    var reportService: ReportService!
    var report: Report!
    var parsingError: RequestError?

    override func setUp() {
        super.setUp()
        session = URLSessionMock()
        reportService = ReportService(session: session)
    }
    
    override func tearDown() {
        session = nil
        reportService = nil
        report = nil
        parsingError = nil
        super.tearDown()
    }
    
    func test_WhenReportIsRequested_ReturnsReport() {
        let signalExpectation = expectation(description: "The URL was downloaded")
        let jsonString = Fixture.getJSON(jsonPath: "Report")
        let data = jsonString?.data(using: String.Encoding.utf8)

        session.data = data
        
        reportService.getReport(completionHandler: { (report, error) in
            self.report = report
            self.parsingError = error
            signalExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 5) { _ in
            XCTAssertNil(self.parsingError, "Error is nil when we get report data")
            XCTAssertNotNil(self.report, "Report should not be nil")
        }
    }
    
    func test_URLIsInvalid_ReturnsError() {
        let signalExpectation = expectation(description: "The URL was not downloaded")

        reportService.baseURL = "Invalid URL"
        reportService.getReport(completionHandler: { (report, error) in
            self.report = report
            self.parsingError = error
            signalExpectation.fulfill()
        })

        waitForExpectations(timeout: 5) { _ in
            XCTAssertEqual(self.parsingError, RequestError.invalidURL, "Error is not nil when url is invalid")
            XCTAssertNil(self.report, "Report should be nil")
        }
    }

    func test_WhenResponseDataIsNil_ReturnError() {
        let signalExpectation = expectation(description: "The URL was downloaded")

        reportService.getReport(completionHandler: { (report, error) in
            self.report = report
            self.parsingError = error
            signalExpectation.fulfill()
        })

        waitForExpectations(timeout: 5) { _ in
            XCTAssertEqual(self.parsingError, RequestError.unknown, "Error is not nil when url is invalid")
            XCTAssertNil(self.report, "Report should be nil")
        }
    }
}
