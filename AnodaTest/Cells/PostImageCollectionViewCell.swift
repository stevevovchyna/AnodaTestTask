//
//  PostImageCollectionViewCell.swift
//  AnodaTest
//
//  Created by Steven Vovchyna on 12.06.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import UIKit
import SnapKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

final class PostImageCell: UICollectionViewCell {
    
    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        contentView.addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(0)
            make.left.equalTo(contentView.snp.left).offset(0)
            make.right.equalTo(contentView.snp.right).offset(0)
            make.bottom.equalTo(contentView.snp.bottom).offset(0)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    func setup(with image: String) {
        profileImageView.image = UIImage(named: image)
    }
}

extension PostImageCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}

