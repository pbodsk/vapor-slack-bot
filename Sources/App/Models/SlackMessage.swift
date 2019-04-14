//
//  SlackMessage.swift
//  App
//
//  Created by Peter Bødskov on 14/04/2019.
//

import Vapor

struct SlackMessage {
    let text: String
}

extension SlackMessage: Content { }
