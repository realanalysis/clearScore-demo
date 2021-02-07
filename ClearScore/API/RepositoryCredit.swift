public protocol RepositoryCreditProtocol: RepositoryProtocol {
    func eecuteGetMockCredit(on completion: @escaping (Int, Error?, DTOResponseCredit?) -> Void)
    
}

struct RepositoryCredit {
    private var statusCode: Int = -1
    private var error: Error? = NSError(domain:"API", code:-1, userInfo:[ NSLocalizedDescriptionKey: "Cant read url"])
    private var response: Any?
    private var testing: Bool = false
    
    init() {
    }
    
    init(statusCode: Int, error: Error?, response: Any?) {
        testing = true
        self.statusCode = statusCode
        self.error = error
        self.response = response
    }
    
    private func excute<T: Codable>(from url: String, on completion: @escaping (Int, Error?, T?) -> Void) {
        guard let url = URL(string: url), !testing else {
            return completion(statusCode, error, response as? T)
        }
        
        DispatchQueue.global(qos: .utility).async {
            URLSession.shared.dataTask(with: url) {(data, response, responseError) in
                guard let data = data, let response = response as? HTTPURLResponse else { return  completion(-1, error, nil)}
                do {
                    let tmpObjecs = try JSONDecoder().decode(T.self, from: data)
                    if response.statusCode == 200 {
                        completion(response.statusCode, nil, tmpObjecs)
                    } else {
                        completion(response.statusCode, responseError ??  NSError(domain:"API", code:-1, userInfo:[ NSLocalizedDescriptionKey: "Cant reach end point"]), tmpObjecs)
                    }
                    
                    
                }   catch let error {
                    completion(response.statusCode, error, nil)
                }
            }.resume()
        }
    }
}

extension RepositoryCredit: RepositoryCreditProtocol {
    func eecuteGetMockCredit(on completion: @escaping (Int, Error?, DTOResponseCredit?) -> Void) {
        return excute(from: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values", on: completion)
    }
}
