//
//  CustomRelatedController.swift
//  TextFromCamera
//
//  Created by jianghongbao on 2021/6/18.
//

import UIKit

class CustomRelatedController: BaseRelatedController {

    private let imageview = MyImageView(image: nil)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        name = "自定义视图类"
        responder = imageview
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageview.isUserInteractionEnabled = true
        imageview.backgroundColor = .red
        imageview.frame = .init(x: 0,
                                y: topHeight,
                                width: view.bounds.size.width,
                                height: view.bounds.size.height - topHeight)
        view.addSubview(imageview)
        
        toolBar.frame = .init(x: 0,
                              y: view.bounds.size.height - toolBarHeight,
                              width: view.bounds.size.width,
                              height: toolBarHeight)
        imageview.frame = .init(x: 0,
                                y: 0,
                                width: view.bounds.size.width,
                                height: toolBar.frame.minY)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        imageview.becomeFirstResponder()
        
    }
    
}
