//
//  CustomTableViewCell.swift
//  ios-tableview-custom-cell
//
//  Created by Omer Mohamed Ali on 21.09.20.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
    private let _switch: UISwitch = {
        let _switch = UISwitch()
        _switch.onTintColor = .blue
        _switch.isOn = true
        return _switch
    }()
    
    private let myImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "burger")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .white
        label.text = "Custom Cell and lorem and lorem and loren"
        label.numberOfLines = 2
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray
        contentView.addSubview(_switch)
        contentView.addSubview(myLabel)
        contentView.addSubview(myImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String, imageName: String) {
        myLabel.text = text
        myImage.image = UIImage(named: imageName)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
        myImage.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.height - 6
        
        let switchSize = _switch.sizeThatFits(contentView.frame.size)
        _switch.frame = CGRect(x: 5, y: (contentView.frame.size.height - switchSize.height)/2, width: switchSize.width, height: switchSize.height)
        
        myImage.frame = CGRect(x: contentView.frame.size.width - imageSize, y: 3, width: imageSize, height: imageSize)
        
        myLabel.frame = CGRect(
            x: 10 + _switch.frame.size.width,
            y: 0,
            width: contentView.frame.width - 10 - _switch.frame.size.width - myImage.frame.size.width,
            height: contentView.frame.height
        )
        
        
    }
}
