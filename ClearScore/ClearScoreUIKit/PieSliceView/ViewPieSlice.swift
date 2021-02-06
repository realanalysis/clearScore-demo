import UIKit

final class ViewPieSlice: UIView {
    
    private func getCABasicAnimation(from viewModel: ViewModelPieSlice) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath:viewModel.animation.keyPath)
        animation.fromValue = viewModel.animation.fromValue
        animation.toValue = viewModel.animation
        animation.duration = viewModel.animation.duration
        animation.timingFunction = viewModel.animation.timingFunction
        return animation
    }
    
    private func getCAShapeLayer(from viewModel: ViewModelPieSlice, on size: CGSize) -> CAShapeLayer {
        let radius = size.width / viewModel.radiusRatio;
        let path = UIBezierPath(arcCenter: CGPoint.init(x: radius, y: radius),
                                radius: size.width / viewModel.awayFromEdgeRatio,
                                startAngle: viewModel.startAngle,
                                endAngle: viewModel.endAngle,
                                clockwise: viewModel.clockwise)
        
        let sliceLayer = CAShapeLayer()
        sliceLayer.path = path.cgPath
        sliceLayer.fillColor = nil
        sliceLayer.strokeColor = UIColor.red.cgColor
        sliceLayer.lineWidth = viewModel.arc.lineWidth
        sliceLayer.strokeEnd = viewModel.arc.strokeEnd
        sliceLayer.lineCap = viewModel.arc.lineCap
        self.layer.addSublayer(sliceLayer)
        return sliceLayer
    }
    
    private func getCAGradientLayer(from viewModel: ViewModelPieSlice, on size:CGSize) -> CAGradientLayer {
        let graidentLayer = CAGradientLayer()
        graidentLayer.frame = CGRect.init(origin: CGPoint.zero, size: size)
        graidentLayer.colors = viewModel.gradientColors
        self.layer.addSublayer(graidentLayer)
        return graidentLayer
    }
        
    func decroate(from viewModel: ViewModelPieSlice, on size: CGSize) {
        self.layer.sublayers = nil
        
        let animation = getCABasicAnimation(from: viewModel)
        let sliceLayer = getCAShapeLayer(from: viewModel, on: size)
        let graidentLayer = getCAGradientLayer(from: viewModel, on: size)
        
        graidentLayer.mask = sliceLayer
        sliceLayer.add(animation, forKey: animation.keyPath)
    }
}
