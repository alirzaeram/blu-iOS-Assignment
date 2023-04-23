import UIKit

extension StackView {
    open class Vertical: UIStackView {
        public init() {
            super.init(frame: .zero)
            
            self.distribution = .fillProportionally
            self.alignment = .fill
            self.axis = .vertical
            self.spacing = 0
        }
        required public init(coder: NSCoder) {
            fatalError("Not Available for Storyboard!")
        }
    }
}
