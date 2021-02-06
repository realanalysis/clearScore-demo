import UIKit

final public class ViewScoreDashBoard: UIView {
    
    private var title: UILabel = UILabel()
    private var pieSlice: ViewPieSlice = ViewPieSlice()

    private func pinEdges(from childView: UIView, to parentView: UIView) {
        guard !parentView.subviews.contains(childView) else { return }
        addSubview(childView)
        childView.translatesAutoresizingMaskIntoConstraints = false
        parentView.addConstraint(NSLayoutConstraint(item: childView, attribute: .bottom, relatedBy: .equal, toItem: parentView, attribute: .bottom, multiplier: 1.0, constant: 0))
        parentView.addConstraint(NSLayoutConstraint(item: childView, attribute: .top, relatedBy: .equal, toItem: parentView, attribute: .top, multiplier: 1.0, constant: 0))
        parentView.addConstraint(NSLayoutConstraint(item: childView, attribute: .left, relatedBy: .equal, toItem: parentView, attribute: .left, multiplier: 1.0, constant: 0))
        parentView.addConstraint(NSLayoutConstraint(item: childView, attribute: .right, relatedBy: .equal, toItem: parentView, attribute: .right, multiplier: 1.0, constant: 0))
    }
}

extension ViewScoreDashBoard {
    public func decorate(from viewModel: ViewModelScoreDashBoard) {
        pinEdges(from: title, to: self)
        pinEdges(from: pieSlice, to: self)

        self.backgroundColor = viewModel.backgroundColor

        self.layer.borderWidth = viewModel.outterBorder.width
        self.layer.borderColor = viewModel.outterBorder.color
        self.layer.cornerRadius = bounds.height / 2
        
        title.attributedText = viewModel.title.attribute
        title.textAlignment = viewModel.title.alignemnt
        title.numberOfLines = viewModel.title.numOfLines

        pieSlice.decroate(from: viewModel.pieSliceViewModel, on: self.bounds.size)
    }
}
