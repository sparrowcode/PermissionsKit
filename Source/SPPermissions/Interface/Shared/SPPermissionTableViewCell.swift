// The MIT License (MIT)
// Copyright © 2019 Ivan Vorobei (ivanvorobei@icloud.com)
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

class SPPermissionTableViewCell: UITableViewCell {
    
    var titleLabel = UILabel()
    var subtitleLabel = UILabel()
    var button = SPPermissionActionButton()
    private var iconContainerView = UIView()
    
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
        
        titleLabel.numberOfLines = 0
        titleLabel.textColor = SPPermissionsColor.label
        titleLabel.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -15).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: iconContainerView.trailingAnchor, constant: 10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: iconContainerView.topAnchor, constant: 5).isActive = true
        
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textColor = SPPermissionsColor.secondaryLabel
        subtitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        contentView.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        subtitleLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: -verticalSpace).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subtitleLabel.text = nil
    }
    
    func set(_ data: SPPermissionData?, permission: SPPermission) {
        titleLabel.text = data?.name ?? SPPermissionsText.name(for: permission)
        subtitleLabel.text = data?.description ?? SPPermissionsText.description(for: permission)
        button.permission = permission
        button.allowTitle = data?.allowTitle ?? SPPermissionsText.allow
        button.allowedTitle = data?.allowedTitle ?? SPPermissionsText.allowed
        button.style = permission.isAuthorized ? SPPermissionActionButton.Style.allowed : SPPermissionActionButton.Style.base
        guard iconContainerView.subviews.isEmpty else { return }
        let iconView: UIView = {
            guard let image = data?.image else {
                return SPPermissionIconView(permission)
            }
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        iconContainerView.addSubview(iconView)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.leadingAnchor.constraint(equalTo: iconContainerView.leadingAnchor).isActive = true
        iconView.trailingAnchor.constraint(equalTo: iconContainerView.trailingAnchor).isActive = true
        iconView.topAnchor.constraint(equalTo: iconContainerView.topAnchor).isActive = true
        iconView.bottomAnchor.constraint(equalTo: iconContainerView.bottomAnchor).isActive = true
    }
}
