//
//  ReportInfo.swift
//  ClearScore
//
//  Created by Joshua Thompson on 09/04/2018.
//  Copyright © 2018 Joshua Thompson. All rights reserved.
//

import Foundation

struct ReportInfo: Decodable {
    let score: Int?
    let scoreBand: Int?
    let clientRef: String?
    let status: String?
    let maxScoreValue: Int?
    let minScoreValue: Int?
    let monthsSinceLastDefaulted: Int?
    let hasEverDefaulted: Bool?
    let monthsSinceLastDelinquent: Int?
    let hasEverBeenDelinquent: Bool?
    let percentageCreditUsed: Int?
    let percentageCreditUsedDirectionFlag: Int?
    let changedScore: Int?
    let currentShortTermDebt: Int?
    let currentShortTermNonPromotionalDebt: Int?
    let currentShortTermCreditLimit: Int?
    let currentShortTermCreditUtilisation: Int?
    let changeInShortTermDebt: Int?
    let currentLongTermDebt: Int?
    let currentLongTermNonPromotionalDebt: Int?
    let currentLongTermCreditLimit: Int?
    let currentLongTermCreditUtilisation: Int?
    let changeInLongTermDebt: Int?
    let numPositiveScoreFactors: Int?
    let numNegativeScoreFactors: Int?
    let equifaxScoreBand: Int?
    let equifaxScoreBandDescription: String?
    let daysUntilNextReport: Int?
}


extension ReportInfo {
    static func fakeReportInfo() -> ReportInfo {
        let reportInfo = ReportInfo(score: 100, scoreBand: nil, clientRef: nil, status: nil, maxScoreValue: 700, minScoreValue: nil, monthsSinceLastDefaulted: nil, hasEverDefaulted: nil, monthsSinceLastDelinquent: nil, hasEverBeenDelinquent: nil, percentageCreditUsed: nil, percentageCreditUsedDirectionFlag: nil, changedScore: nil, currentShortTermDebt: nil, currentShortTermNonPromotionalDebt: nil, currentShortTermCreditLimit: nil, currentShortTermCreditUtilisation: nil, changeInShortTermDebt: nil, currentLongTermDebt: nil, currentLongTermNonPromotionalDebt: nil, currentLongTermCreditLimit: nil, currentLongTermCreditUtilisation: nil, changeInLongTermDebt: nil, numPositiveScoreFactors: nil, numNegativeScoreFactors: nil, equifaxScoreBand: nil, equifaxScoreBandDescription: "equifaxScoreBandDescription", daysUntilNextReport: nil)
        return reportInfo
    }
}
