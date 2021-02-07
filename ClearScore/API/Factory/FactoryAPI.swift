
public protocol RepositoryProtocol {
}


public enum FactoryAPI {
    case credit
    case creditTest(statusCode: Int, error: Error?, response: DTOResponseCredit?)
}

extension FactoryAPI {
    public var defaultProtocol: RepositoryProtocol {
        switch self {
        case .credit:
            let repo = RepositoryCredit.init()
            return repo
        case let .creditTest(statusCode, error, response):
            let repo = RepositoryCredit.init(statusCode: statusCode, error: error, response: response)
            return repo
        }
    }
}
