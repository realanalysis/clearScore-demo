import UIKit

extension NSAttributedString {
    convenience init(text: String, textColor: UIColor, textFont: UIFont) {
        let multipleAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.font: textFont,
        ]

        self.init(string: text, attributes: multipleAttributes)
    }
}
