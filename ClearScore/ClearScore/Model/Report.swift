//
//  Report.swift
//  ClearScore
//
//  Created by Joshua Thompson on 09/04/2018.
//  Copyright © 2018 Joshua Thompson. All rights reserved.
//

import Foundation

struct Report: Decodable {
    let accountIDVStatus: String?
    let creditReportInfo: ReportInfo?
    let dashboardStatus: String?
    let personaType: String?
    let coachingSummary: CoachingSummary?
    let augmentedCreditScore: Int?
}

extension Report {
    static func fakeReport() -> Report {
        let report = Report(accountIDVStatus: "accountIDVStatus",
                            creditReportInfo: ReportInfo.fakeReportInfo(),
                            dashboardStatus: "dashboardStatus",
                            personaType: "personaType",
                            coachingSummary: nil,
                            augmentedCreditScore: 123)
        return report
    }
}
