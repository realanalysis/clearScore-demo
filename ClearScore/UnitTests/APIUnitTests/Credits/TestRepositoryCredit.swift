
import API
import XCTest

final class TestRepositoryCredit: XCTestCase {

    func testGetCMSPageHTTPStatusCode200() {
        let json = getJsonData(withFileName: "TestCaseCredit.geojson")
        
        let repo = FactoryAPI.creditTest(statusCode: 200, error: nil, JSONData: json).defaultProtocol as! RepositoryCreditProtocol
        repo.eecuteGetMockCredit { (status, error, response) in
            XCTAssertEqual(status, 200)
            XCTAssertNil(error)
            XCTAssertNotNil(response)
        }
    }
    
    func testGetCMSPageHTTPStatusCode400WithError() {
        let json = getJsonData(withFileName: "TestCaseCredit.geojson")
        let repo = FactoryAPI.creditTest(statusCode: 400, error: nil, JSONData: json).defaultProtocol as! RepositoryCreditProtocol
        repo.eecuteGetMockCredit { (status, error, response) in
            XCTAssertEqual(status, 400)
            XCTAssertEqual(error?.localizedDescription, "Cant reach end point")
            XCTAssertNil(response)
        }
    }
}
