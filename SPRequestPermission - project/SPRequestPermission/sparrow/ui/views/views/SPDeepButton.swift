import UIKit

class SPDeepButton: UIButton {
    
    let activityIndicatorView = UIActivityIndicatorView.init()
    
    var sideSpace: CGFloat = 20 {
        didSet {
            self.recalculateSize()
        }
    }
    
    init() {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.backgroundColor = UIColor.white
        self.setTitle("Title", for: UIControlState.normal)
        self.titleLabel?.font = UIFont.fonts.AvenirNext(type: .Bold, size: 14)
        self.setTitleColorForNoramlAndHightlightedStates(color: UIColor.blue)
        self.layer.cornerRadius = 4
        self.addSubview(self.activityIndicatorView)
        self.stopLoading()
    }
    
    func startLoading() {
        self.isUserInteractionEnabled = false
        self.activityIndicatorView.color = self.titleLabel?.textColor
        self.activityIndicatorView.isHidden = false
        self.activityIndicatorView.alpha = 0
        SPAnimation.animate(0.3, animations: {
            self.titleLabel?.alpha = 0
        }, delay: 0, options: .beginFromCurrentState, withComplection: {
            self.activityIndicatorView.alpha = 1
            self.activityIndicatorView.startAnimating()
        })
    }
    
    func stopLoading() {
        SPAnimation.animate(0.3, animations: {
            self.activityIndicatorView.isHidden = true
            self.activityIndicatorView.stopAnimating()
            self.titleLabel?.alpha = 1
        }, delay: 0, options: .beginFromCurrentState, withComplection: {
            self.isUserInteractionEnabled = true
        })
    }
    
    func recalculateSize() {
        self.sizeToFit()
        self.titleLabel?.sizeToFit()
        self.frame = CGRect.init(
            x: 0, y: 0,
            width: (self.titleLabel?.frame.width ?? 0) + (2 * self.sideSpace),
            height: 46
        )
        self.layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.activityIndicatorView.frame.size = SPLayout.sizeWith(widthFactor: 0.6, maxWidth: 25, heightFactor: 0.6, maxHeight: 25, relativeSideFactor: 1, from: self.frame.size)
        self.activityIndicatorView.center = CGPoint.init(x: self.frame.width / 2, y: self.frame.height / 2)
        self.setDeepShadow()
    }
}
