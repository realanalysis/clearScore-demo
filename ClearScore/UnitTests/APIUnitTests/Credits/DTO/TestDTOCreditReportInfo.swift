
import API
import XCTest

final class TestDTOCreditReportInfo: XCTestCase {
    func testSuccessfullMapping() {
        let json = getJsonData(withFileName: "TestCaseCredit.geojson")
        var dto: DTOCreditReportInfo?
        do {
            let parentDto = try JSONDecoder().decode(DTOResponseCredit.self, from: json)
            dto = parentDto.creditReportInfo
        }
        catch{
            XCTFail("Decoding data failed")
        }
        
        XCTAssertEqual(dto?.score, 514)
        XCTAssertEqual(dto?.scoreBand, 4)
        XCTAssertEqual(dto?.clientRef, "CS-SED-655426-708782")
        XCTAssertEqual(dto?.status, "MATCH")
        XCTAssertEqual(dto?.scoreBand, 4)
        XCTAssertEqual(dto?.maxScoreValue, 700)
        XCTAssertEqual(dto?.minScoreValue, 0)
        XCTAssertEqual(dto?.monthsSinceLastDefaulted, -1)
        XCTAssertEqual(dto?.hasEverDefaulted, false)
        XCTAssertEqual(dto?.monthsSinceLastDelinquent, 1)
        XCTAssertEqual(dto?.hasEverBeenDelinquent, true)
        XCTAssertEqual(dto?.percentageCreditUsed, 44)
        XCTAssertEqual(dto?.percentageCreditUsedDirectionFlag, 1)
        XCTAssertEqual(dto?.changedScore, 0)
        XCTAssertEqual(dto?.currentShortTermDebt, 13758)
        XCTAssertEqual(dto?.currentShortTermNonPromotionalDebt, 13758)
        XCTAssertEqual(dto?.currentShortTermCreditLimit, 30600)
        XCTAssertEqual(dto?.currentShortTermCreditUtilisation, 44)
        XCTAssertEqual(dto?.changeInShortTermDebt, 549)
        XCTAssertEqual(dto?.currentLongTermDebt, 24682)
        XCTAssertEqual(dto?.currentLongTermNonPromotionalDebt, 24682)
        XCTAssertNil(dto?.currentLongTermCreditLimit)
        XCTAssertNil(dto?.currentLongTermCreditUtilisation)
        XCTAssertEqual(dto?.changeInLongTermDebt, -327)
        XCTAssertEqual(dto?.numPositiveScoreFactors, 9)
        XCTAssertEqual(dto?.numNegativeScoreFactors, 0)
        XCTAssertEqual(dto?.equifaxScoreBand, 4)
        XCTAssertEqual(dto?.equifaxScoreBandDescription, "Excellent")
        XCTAssertEqual(dto?.daysUntilNextReport, 9)
 
    }
}
