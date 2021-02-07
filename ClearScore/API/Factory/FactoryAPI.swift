
public protocol RepositoryProtocol {
}


public enum FactoryAPI {
    case credit
    case creditTest(statusCode: Int, error: Error?, JSONData: Data?)
}

extension FactoryAPI {
    public var defaultProtocol: RepositoryProtocol {
        switch self {
        case .credit:
            let repo = RepositoryCredit.init()
            return repo
        case let .creditTest(statusCode, error, data):
            let repo = RepositoryCredit.init(statusCode: statusCode, error: error, JSONData: data)
            return repo
        }
    }
}
