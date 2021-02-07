
import API
import XCTest

final class TestDTOCoachingSummary: XCTestCase {
    func testSuccessfullMapping() {
        let json = getJsonData(withFileName: "TestCaseCredit.geojson")
        var dto: DTOCoachingSummary?
        do {
            let parentDto = try JSONDecoder().decode(DTOResponseCredit.self, from: json)
            dto = parentDto.coachingSummary
        }
        catch{
            XCTFail("Decoding data failed")
        }
        
        XCTAssertEqual(dto?.activeTodo, false)
        XCTAssertEqual(dto?.activeChat, true)
        XCTAssertEqual(dto?.numberOfTodoItems, 0)
        XCTAssertEqual(dto?.numberOfCompletedTodoItems, 0)
        XCTAssertEqual(dto?.selected, true)
    }
}
