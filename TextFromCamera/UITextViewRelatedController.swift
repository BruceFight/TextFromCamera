//
//  UITextViewRelatedController.swift
//  TextFromCamera
//
//  Created by jianghongbao on 2021/6/18.
//

import UIKit

class UITextViewRelatedController: BaseRelatedController {

    private let textView = MyTextView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        name = "UITextView视图类"
        responder = textView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.keyboardType = .phonePad
        textView.autocorrectionType = .no
        textView.backgroundColor = .blue
        textView.frame = .init(x: 0,
                               y: topHeight,
                               width: view.bounds.size.width,
                               height: view.bounds.size.height - topHeight)
        view.addSubview(textView)
    }
    
}
