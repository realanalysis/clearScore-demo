import UIKit

public struct ViewModelScoreDashBoard {
    let backgroundColor = UIColor.white
    let outterBorder = (color: UIColor.black.cgColor, width: CGFloat(2))
    let highLightColor = UIColor.orange
    private(set) var title = (attribute: NSMutableAttributedString(), numOfLines: 3, alignemnt: NSTextAlignment.center)
    let pieSliceViewModel: ViewModelPieSlice
    
    public init() {
        title.attribute.append(NSAttributedString.init(text: "Loading ...",
                                                      textColor: UIColor.black,
                                                      textFont: UIFont.systemFont(ofSize: 20, weight: .medium)))
        pieSliceViewModel = ViewModelPieSlice.init(percentage: CGFloat(0))
    }
    
    public init(score: Int, totalScore: Int) {
        title.attribute.append(NSAttributedString.init(text: "Your credit score is",
                                                      textColor: UIColor.black,
                                                      textFont: UIFont.systemFont(ofSize: 20, weight: .bold)))
        title.attribute.append(NSAttributedString.init(text: "\n\(score)",
                                                      textColor: #colorLiteral(red: 0.9764705882, green: 0.8862745098, blue: 0.5019607843, alpha: 1),
                                                      textFont: UIFont.systemFont(ofSize: 60, weight: .thin)))
        title.attribute.append(NSAttributedString.init(text: "\nout of \(totalScore)",
                                                      textColor: UIColor.black,
                                                      textFont: UIFont.systemFont(ofSize: 20, weight: .bold)))
        pieSliceViewModel = ViewModelPieSlice.init(percentage: CGFloat(score) / CGFloat(totalScore))
    }
}
