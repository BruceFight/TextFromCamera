//
//  UITextFieldRelatedController.swift
//  TextFromCamera
//
//  Created by jianghongbao on 2021/6/18.
//

import UIKit

class UITextFieldRelatedController: BaseRelatedController {

    private let textField = UITextField()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        name = "UITextField视图类"
        responder = textField
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ✅应该是跟UITextView一样的表现,UITextField不需要再追加UIKeyInput协议. 可以自行尝试.
        // Do any additional setup after loading the view.
    }

}
