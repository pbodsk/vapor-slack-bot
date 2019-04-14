//
//  SlackController.swift
//  App
//
//  Created by Peter Bødskov on 14/04/2019.
//

import Vapor

final class SlackController: RouteCollection {
    func boot(router: Router) throws {
        let harvestRoute = router.grouped("api", "slack")
        harvestRoute.post(use: postHandler)
    }
    
    func postHandler(_ req: Request) throws -> Future<SlackMessage> {
        return try req.content.decode(SlackParameters.self).map(to: SlackMessage.self, { slackParameters in
            if let text = slackParameters.text {
                return SlackMessage(text: "Got params: \(text)")
            } else {
                return SlackMessage(text: "missing parameters")
            }
        })
        
//        else {
//            let missingParametersMessage = req.eventLoop.newPromise(HarvestMessage.self)
//            missingParametersMessage.succeed(result: HarvestMessage(text: "missing parameters"))
//            return missingParametersMessage.futureResult
//        }
//
//        return content
    }
}
