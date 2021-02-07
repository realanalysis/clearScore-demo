
import XCTest
extension XCTestCase {
    private static func getJsonData(_ bundle: Bundle, _ fileName: String) -> Data {
        let fileNameArray = fileName.split(separator: ".")
        guard let pathString = bundle.path(forResource: String(fileNameArray[0]), ofType: String(fileNameArray[1])) else {
            fatalError("Couldn't read \(fileName) file")
        }

        guard let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert \(fileName) to String")
        }

        guard let jsonData = jsonString.data(using: .utf8) else {
            fatalError("Unable to convert \(fileName) to Data")
        }

        return jsonData
    }

    func getJsonData(withFileName fileName: String) -> Data {
        return XCTestCase.getJsonData(Bundle(for: type(of: self)), fileName)
    }
}
