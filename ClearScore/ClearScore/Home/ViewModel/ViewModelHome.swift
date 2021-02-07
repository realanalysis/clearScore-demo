import UIKit
import ClearScoreUIKit
import Domain

struct ViewModelHome {
    let backgroundColor = UIColor.white
    let title = "Dashboard"
    var scoreViewModel = ViewModelScoreDashBoard()
}

extension ViewModelHome {
    
    mutating func transform(from entity: EntityCredit) {
        guard entity.score != -1, entity.totalScore != -1 else {
            return
        }
        self.scoreViewModel = ViewModelScoreDashBoard.init(score: entity.score, totalScore: entity.totalScore)
    }
}
