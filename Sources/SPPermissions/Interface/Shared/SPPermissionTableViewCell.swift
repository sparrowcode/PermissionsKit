// The MIT License (MIT)
// Copyright © 2020 Ivan Vorobei (hello@ivanvorobei.by)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

#if os(iOS)

public class SPPermissionTableViewCell: UITableViewCell {
    
    public let permissionTitleLabel = UILabel()
    public let permissionDescriptionLabel = UILabel()
    public let permissionButton = SPPermissionActionButton()
    public let permissionIconView = SPPermissionIconView()
    
    public let permissionIconImageView = UIImageView()
    private let permissionIconContainerView = UIView()
    
    static var id = "SPPermissionTableViewCell"
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        permissionTitleLabel.text = nil
        permissionDescriptionLabel.text = nil
        permissionButton.removeTarget(nil, action: nil, for: .allEvents)
        permissionIconImageView.image = nil
        permissionIconImageView.isHidden = true
        permissionIconView.isHidden = false
    }
    
    // MARK: - Layout
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        let superSize = super.sizeThatFits(size)
        return CGSize.init(width: superSize.width, height: 100)
    }
    
    // MARK: - Helpers
    
    func defaultConfigure(for permission: SPPermission) {
        permissionTitleLabel.text = Text.permission_name(permission)
        permissionDescriptionLabel.text = Text.permission_description(permission)
        
        permissionButton.permission = permission
        permissionButton.allowTitle = Text.allow_permission_action
        permissionButton.allowedTitle = Text.allowed_permission_action
        permissionButton.allowTitleColor = UIColor.tint
        permissionButton.allowBackgroundColor = UIColor.buttonArea
        permissionButton.allowedTitleColor = UIColor.white
        permissionButton.allowedBackgroundColor = UIColor.tint
        
        permissionIconView.permission = permission
        permissionIconView.tintColor = permissionButton.allowedBackgroundColor
        
        permissionIconImageView.image = nil
        permissionIconImageView.contentMode = .scaleAspectFit
        permissionIconImageView.tintColor = permissionButton.allowedBackgroundColor
    }
}
#endif
