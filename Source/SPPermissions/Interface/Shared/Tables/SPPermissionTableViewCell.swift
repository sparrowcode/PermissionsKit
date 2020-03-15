// The MIT License (MIT)
// Copyright © 2019 Ivan Varabei (varabeis@icloud.com)
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
/**
 Class using in `.list` & `.dialog` interface.
 */
public class SPPermissionTableViewCell: UITableViewCell {
    
    /**
     Short name of permission.
     */
    public let permissionTitleLabel = UILabel()
    
    /**
     Describe why you need it permission. Support any lines.
     */
    public let permissionDescriptionLabel = UILabel()
    
    /**
     Action button. By tap start request permission.
     */
    public let button = SPPermissionActionButton()
    
    /**
     Default icons. If need set custom image, use `set(_ image: UIImage)`.
     */
    public let iconView = SPPermissionIconView(.notification)
    
    /**
     View for custom `UIImage`.
     */
    private let iconImageView = UIImageView()
    
    /**
     Container of icons view.
     */
    private let iconContainerView = UIView()
    
    /**
     ID for register in table view.
     */
    static var id = "SPPermissionTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let verticalSpace: CGFloat = 5
        
        contentView.addSubview(iconContainerView)
        iconContainerView.translatesAutoresizingMaskIntoConstraints = false
        iconContainerView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: -2).isActive = true
        iconContainerView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: verticalSpace).isActive = true
        iconContainerView.widthAnchor.constraint(equalToConstant: 45).isActive = true
        iconContainerView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerYAnchor).isActive = true
        button.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .horizontal)
        button.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        
        contentView.addSubview(permissionTitleLabel)
        permissionTitleLabel.numberOfLines = 0
        permissionTitleLabel.textColor = SPPermissionsColor.label
        permissionTitleLabel.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        permissionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        permissionTitleLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -15).isActive = true
        permissionTitleLabel.leadingAnchor.constraint(equalTo: iconContainerView.trailingAnchor, constant: 10).isActive = true
        permissionTitleLabel.topAnchor.constraint(equalTo: iconContainerView.topAnchor, constant: 5).isActive = true
        
        contentView.addSubview(permissionDescriptionLabel)
        permissionDescriptionLabel.numberOfLines = 0
        permissionDescriptionLabel.textColor = SPPermissionsColor.secondaryLabel
        permissionDescriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        permissionDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        permissionDescriptionLabel.topAnchor.constraint(equalTo: permissionTitleLabel.bottomAnchor, constant: 3).isActive = true
        permissionDescriptionLabel.trailingAnchor.constraint(equalTo: permissionTitleLabel.trailingAnchor).isActive = true
        permissionDescriptionLabel.leadingAnchor.constraint(equalTo: permissionTitleLabel.leadingAnchor).isActive = true
        permissionDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: -verticalSpace).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        permissionTitleLabel.text = nil
        permissionDescriptionLabel.text = nil
        button.removeTarget(nil, action: nil, for: .allEvents)
        iconImageView.image = nil
        iconImageView.isHidden = true
        iconView.isHidden = false
    }
    
    /**
     Default configuration for cell.
     Set titles and default icon.
     */
    func defaultConfigure(for permission: SPPermission) {
        
        permissionTitleLabel.text = SPPermissionsText.name(for: permission)
        permissionDescriptionLabel.text = SPPermissionsText.description(for: permission)
        
        button.permission = permission
        button.allowTitle = SPPermissionsText.allow
        button.allowedTitle = SPPermissionsText.allowed
        button.allowTitleColor = SPPermissionsColor.base
        button.allowBackgroundColor = SPPermissionsColor.buttonArea
        button.allowedTitleColor = SPPermissionsColor.white
        button.allowedBackgroundColor = SPPermissionsColor.base
        button.style = permission.isAuthorized ? SPPermissionActionButton.Style.allowed : SPPermissionActionButton.Style.base
        
        iconView.permission = permission
        iconView.color = button.allowedBackgroundColor
        iconContainerView.addSubview(iconView)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.leadingAnchor.constraint(equalTo: iconContainerView.leadingAnchor).isActive = true
        iconView.trailingAnchor.constraint(equalTo: iconContainerView.trailingAnchor).isActive = true
        iconView.topAnchor.constraint(equalTo: iconContainerView.topAnchor).isActive = true
        iconView.bottomAnchor.constraint(equalTo: iconContainerView.bottomAnchor).isActive = true
        
        iconImageView.image = nil
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = button.allowedBackgroundColor
        iconContainerView.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.leadingAnchor.constraint(equalTo: iconContainerView.leadingAnchor).isActive = true
        iconImageView.trailingAnchor.constraint(equalTo: iconContainerView.trailingAnchor).isActive = true
        iconImageView.topAnchor.constraint(equalTo: iconContainerView.topAnchor).isActive = true
        iconImageView.bottomAnchor.constraint(equalTo: iconContainerView.bottomAnchor).isActive = true
    }
    
    /**
     Hide default image and set object of `UIImage`.
     */
    public func set(_ image: UIImage) {
        iconView.isHidden = true
        iconImageView.isHidden = false
        iconImageView.image = image
    }
}
#endif
