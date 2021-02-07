import API

public struct EntityCredit {
    public private(set) var score: Int = -1
    public private(set) var totalScore: Int = -1
}


//transformation
extension EntityCredit {
    static func transform(from dto: DTOResponseCredit?) -> EntityCredit {
        var entity = EntityCredit()
        guard let dto = dto else { return entity }
        entity.score = dto.creditReportInfo?.score ?? -1
        entity.totalScore = dto.creditReportInfo?.maxScoreValue ?? -1
        return entity
    }
}
