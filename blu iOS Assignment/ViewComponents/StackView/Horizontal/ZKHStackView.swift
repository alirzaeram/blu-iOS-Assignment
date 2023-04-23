import UIKit

extension StackView {
    open class Horizontal: UIStackView {
        public init() {
            super.init(frame: .zero)
            
            self.distribution = .fillProportionally
            self.alignment = .fill
            self.axis = .horizontal
            self.spacing = 0
        }
        required public init(coder: NSCoder) {
            fatalError("Not Available for Storyboard!")
        }
    }
}
