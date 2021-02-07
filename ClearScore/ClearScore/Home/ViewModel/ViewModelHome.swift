import UIKit
import ClearScoreUIKit
import Domain

struct ViewModelHome {
    let backgroundColor = UIColor.white
    let title = "Dashboard"
    var scoreViewModel = ViewModelScoreDashBoard.init(message: "Loading ...")
}

extension ViewModelHome {
    
    mutating func transform(from entity: EntityCredit) {
        guard entity.score != -1, entity.totalScore != -1 else {
            self.scoreViewModel =  ViewModelScoreDashBoard.init(message: "Error received")

            return
        }
        self.scoreViewModel = ViewModelScoreDashBoard.init(score: entity.score, totalScore: entity.totalScore)
    }
}
