import UIKit

struct ViewModelPieSlice {
    let percentage: CGFloat
    let animation = (keyPath: "strokeEnd", fromValue: 0, toValue: 0, duration: 1.4, timingFunction:CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeIn))
    var startAngle: CGFloat { getRadian(from: 0) }
    var endAngle: CGFloat { getRadian(from: percentage) }
    let clockwise = true
    let gradientColors:[CGColor] =  [#colorLiteral(red: 1, green: 0.6941176471, blue: 0.4078431373, alpha: 1).cgColor, #colorLiteral(red: 0.9764705882, green: 0.8862745098, blue: 0.5019607843, alpha: 1).cgColor]
    
    let arc = (lineWidth: CGFloat(4), strokeEnd: CGFloat(1), lineCap: CAShapeLayerLineCap.round )
    let radiusRatio = CGFloat(2.0)
    let awayFromEdgeRatio = CGFloat(2.15)
    
    private func getRadian(from percent: CGFloat) -> CGFloat {
        return  (270 + percent * 360) * CGFloat.pi / 180
    }
}
