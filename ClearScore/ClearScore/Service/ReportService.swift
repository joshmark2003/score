//
//  ReportService.swift
//  ClearScore
//
//  Created by Joshua Thompson on 09/04/2018.
//  Copyright © 2018 Joshua Thompson. All rights reserved.
//

import Foundation
import UIKit

enum RequestError: Swift.Error {
    case invalidURL
    case unknown
}

protocol ReportServiceProtocol {
    func getReport(completionHandler: @escaping (Report?, RequestError?) -> Void)
}

struct ReportService: ReportServiceProtocol {
    
    static let shared = ReportService()
    private let session: URLSession

    var baseURL = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values"
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getReport(completionHandler: @escaping (Report?, RequestError?) -> Void) {
        showActivityIndicator(show: true)
        guard let url = URL(string: baseURL) else {
            DispatchQueue.main.async {
                self.showActivityIndicator(show: false)
                return completionHandler(nil, RequestError.invalidURL)
            }
            return
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.showActivityIndicator(show: false)
                    completionHandler(nil, RequestError.unknown)
                    //We could use this mapper to display error
                    //At the moment we are not sure what the errors are
                }
                return
            }
            
            let reportModel = try? JSONDecoder().decode(Report.self, from: data)
            
            DispatchQueue.main.async {
                self.showActivityIndicator(show: false)
                completionHandler(reportModel, nil)
            }
        }
        
        task.resume()
    }
    
    private func showActivityIndicator(show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
    }
}
