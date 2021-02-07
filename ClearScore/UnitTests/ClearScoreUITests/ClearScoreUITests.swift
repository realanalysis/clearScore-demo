
import XCTest

final class ClearScoreUITests: XCTestCase {

  func testLoadingText() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "ViewModelScoreDashBoardTitle").label, "Loading ...")
        app.terminate()
    }
    
    
    func testSuccessFullText() throws {
        let app = XCUIApplication()
        app.launch()
        sleep(3)
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "ViewModelScoreDashBoardTitle").label, "Your credit score is\n514\nout of 700")
    }
}
