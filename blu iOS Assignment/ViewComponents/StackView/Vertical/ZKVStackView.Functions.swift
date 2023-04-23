import UIKit

public enum VFillMode {
    case FillWithMargin, CenterX, Leading, Trailing
}

extension StackView.Vertical {
    public func addArrangedSubview(_ view: UIView, margin: UIEdgeInsets = .zero, fillMode: VFillMode = .FillWithMargin, initiallyHidden: Bool = false) {
        let contentView: UIView = .init(frame: .zero)
        contentView.backgroundColor = .clear
        contentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let top = view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin.top)
        let bottom = view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -(margin.bottom))
        let leading = view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin.left)
        let trailing = view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -(margin.right))
        
        var layouts: [NSLayoutConstraint] = []
        
        switch fillMode {
        case .Leading:
            leading.constant = 0
            trailing.constant = -(margin.right)
            
            layouts.append(contentsOf: [top, bottom, leading, trailing])
            
        case .Trailing:
            leading.constant = margin.left
            trailing.constant = 0
            
            layouts.append(contentsOf: [top, bottom, leading, trailing])
            
        case .CenterX:
            let centerX = view.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            top.constant = margin.top
            bottom.constant = -(margin.bottom)
            
            layouts.append(contentsOf: [top, bottom, centerX])
            
        case .FillWithMargin:
            
            layouts.append(contentsOf: [top, bottom, leading, trailing])
            
        }
        
        _ = layouts.map { $0.isActive = true }
        
        self.addArrangedSubview(contentView)
        if initiallyHidden &&
            arrangedSubviews.last == contentView {
            self.arrangedSubviews.last?.isHidden = true
        }
    }
}

extension StackView.Vertical {
    public func showArrangedSubview(_ view: UIView, animated: Bool, completion: ((Bool) -> ())? = nil) {
        guard let index = getIndex(view) else { return }
        if animated {
            UIView.animate(withDuration: 0.5, animations: {
                self.arrangedSubviews[index].isHidden = false
            }, completion: completion)
        }else {
            self.arrangedSubviews[index].isHidden = false
        }
    }
    public func hideArrangedSubview(_ view: UIView, animated: Bool, completion: ((Bool) -> ())? = nil) {
        guard let index = getIndex(view) else { return }
        if animated {
            UIView.animate(withDuration: 0.5, animations: {
                self.arrangedSubviews[index].isHidden = true
            }, completion: completion)
        }else {
            self.arrangedSubviews[index].isHidden = true
        }
    }
}

extension StackView.Vertical {
    private func getIndex(_ view: UIView) -> Int? {
        return arrangedSubviews.firstIndex(where: { $0.subviews.contains(view) }) ??
        arrangedSubviews.firstIndex(where: { $0 == view})
    }
}

extension StackView.Vertical {
    public func hasArrangedSubview(_ view: UIView) -> Bool {
        if let _ = getIndex(view) {
            return true
        }else {
            return false
        }
    }
}

extension StackView.Vertical {
    public override func removeArrangedSubview(_ view: UIView) {
        guard let index = getIndex(view) else { return }
        arrangedSubviews[index].removeFromSuperview()
    }
    
    public func removeAllSubViews() {
        _ = arrangedSubviews.map( {
            $0.removeFromSuperview()
        })
    }
}
