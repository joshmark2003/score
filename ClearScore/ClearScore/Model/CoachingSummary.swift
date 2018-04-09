//
//  CoachingSummary.swift
//  ClearScore
//
//  Created by Joshua Thompson on 09/04/2018.
//  Copyright © 2018 Joshua Thompson. All rights reserved.
//

import Foundation

struct CoachingSummary: Decodable {
    let activeTodo: Bool?
    let activeChat: Bool?
    let numberOfTodoItems: Int?
    let numberOfCompletedTodoItems: Int?
    let selected: Bool?
}
