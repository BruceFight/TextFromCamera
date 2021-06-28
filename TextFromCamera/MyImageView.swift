//
//  MyImageView.swift
//  CameraForKeyboardInput
//
//  Created by jianghongbao on 2021/6/15.
//

import UIKit

class MyImageView: UIImageView, UIKeyInput {
    
    var headlineLabel: UILabel = UILabel()
    var hasText: Bool = false
    
    override init(image: UIImage?) {
        super.init(image: image)
        addSubview(headlineLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func insertText(_ text: String) {
        headlineLabel.text = text
        setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headlineLabel.frame = frame
    }
    
    func deleteBackward() {
        
    }
    
}
