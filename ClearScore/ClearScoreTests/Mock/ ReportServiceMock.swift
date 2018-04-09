//
//  ReportServiceMock.swift
//  ClearScore
//
//  Created by Joshua Thompson on 09/04/2018.
//  Copyright © 2018 Joshua Thompson. All rights reserved.
//

import Foundation
import UIKit

@testable import ClearScore

class  ReportServiceMock: ReportServiceProtocol {
    
    var errorMock: RequestError? = nil
    var getReportMock: Report? = nil
 
    func getReport(completionHandler: @escaping (Report?, RequestError?) -> Void) {
        completionHandler(getReportMock, errorMock)
    }
}
