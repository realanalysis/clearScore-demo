
import XCTest
@testable import ClearScore
import Domain

final class TestPresenterHome: XCTestCase {
    var presenter: PresenterHome!
    var view: SpyViewHomeControlller!
    var viewModel: ViewModelHome!
    var router: SpyRouterHome!
    var useCase: SpyUseCaseGetCredit!
    
    override func setUp() {
        super.setUp()
        view = SpyViewHomeControlller()
        viewModel = ViewModelHome()
        router = SpyRouterHome()
        useCase =  SpyUseCaseGetCredit()
        
        presenter = PresenterHome.init(view: view,
                                       viewModel: viewModel,
                                       router: router,
                                       useCase:useCase)
        
    }
    
    override func tearDown() {
        presenter = nil
        viewModel = nil
        view = nil
        router = nil
        useCase = nil
        
        super.tearDown()
    }
}

//test internal methods
extension TestPresenterHome {
    func testWithSuccsssResponse_whenMakeRequest_thenAlertViewDoesntShownAndViewDecorate(){
        presenter.makeRequest()
        XCTAssertFalse(router.presentAlertControllerCalled)
        XCTAssertTrue(view.decorateCalled)
    }
    func testWithSuccsssResponse_whenMakeRequest_thenAlertViewShownAndViewDecorate(){
        useCase.success = false
        presenter.makeRequest()
        XCTAssertTrue(router.presentAlertControllerCalled)
        XCTAssertTrue(view.decorateCalled)
    }
}

//test PresenterViewControllerLifeCycleProtocol
extension TestPresenterHome {
    func testDefaultInput_whenViewDidLoad_thenViewDecorate() {
        presenter.viewDidLoad()
        XCTAssertTrue(view.decorateCalled)
    }
}
