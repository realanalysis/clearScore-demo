import API
import XCTest

final class TestDTOResponseCredit: XCTestCase {
    func testSuccessfullMapping() {
        let json = getJsonData(withFileName: "TestCaseCredit.geojson")
        var dto: DTOResponseCredit?
        do {
            dto = try JSONDecoder().decode(DTOResponseCredit.self, from: json)
        }
        catch{
            XCTFail("Decoding data failed")
        }
        
        XCTAssertEqual(dto?.accountIDVStatus, "PASS")
        XCTAssertEqual(dto?.dashboardStatus, "PASS")
        XCTAssertEqual(dto?.personaType, "INEXPERIENCED")
        XCTAssertNil(dto?.augmentedCreditScore)
        XCTAssertNotNil(dto?.creditReportInfo)
        XCTAssertNotNil(dto?.coachingSummary)
    }
}
