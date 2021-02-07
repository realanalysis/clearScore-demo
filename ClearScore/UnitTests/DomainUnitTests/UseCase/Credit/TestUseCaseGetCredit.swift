import XCTest
@testable import Domain
import API

final class TestUseCaseGetCredit: XCTestCase {

    func testErrorMapping() {
        let error =  NSError(domain:"Domain", code:-1, userInfo:[ NSLocalizedDescriptionKey: "fail test on domain mapping"])
        let repo = FactoryAPI.creditTest(statusCode: 400, error: error, JSONData: nil).defaultProtocol as! RepositoryCreditProtocol
        
        let usecase: UseCaseGetCreditProtocol = UseCaseGetCredit.init(repo: repo) as UseCaseGetCreditProtocol
        usecase.execute { (error, entity) in
         
            XCTAssertEqual(error?.localizedDescription, "fail test on domain mapping")
            XCTAssertEqual(entity.score, -1)
            XCTAssertEqual(entity.totalScore, -1)
        }
    }
    
    func testSuccssMapping() {
        let json = getJsonData(withFileName: "TestCaseCredit.geojson")
        let repo = FactoryAPI.creditTest(statusCode: 200, error: nil, JSONData: json).defaultProtocol as! RepositoryCreditProtocol
        
        let usecase: UseCaseGetCreditProtocol = UseCaseGetCredit.init(repo: repo) as UseCaseGetCreditProtocol
        usecase.execute { (error, entity) in
         
            XCTAssertNil(error)
            XCTAssertEqual(entity.score, 514)
            XCTAssertEqual(entity.totalScore, 700)
        }
    }

}
