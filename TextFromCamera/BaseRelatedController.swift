//
//  BaseRelatedController.swift
//  TextFromCamera
//
//  Created by jianghongbao on 2021/6/18.
//

import UIKit

class BaseRelatedController: UIViewController, ControllerConfigProtocol {
    
    var responder: (UIResponder & UIKeyInput)!
    var name: String!
    var identifier: String!
    
    public let toolBarHeight: CGFloat = 54
    public var toolBar = UIToolbar()
    public var topHeight: CGFloat = 88
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
                
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardHidden),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
        let textFromCamera = UIAction.captureTextFromCamera(responder: responder, identifier: nil)
        let operationsMenu = UIMenu(title: "Operations",
                                    image: nil,
                                    identifier: nil,
                                    options: .singleSelection,
                                    children: [textFromCamera])
        let menuToolBarItem = UIBarButtonItem.init(title: "ToolBar",
                                                   image: UIImage(systemName: "camera"),
                                                   primaryAction: nil,
                                                   menu: operationsMenu)
        
        toolBar = UIToolbar.init(frame: .init(x: 0,
                                              y: view.bounds.size.height,
                                              width: view.bounds.size.width,
                                              height: toolBarHeight))
        toolBar.setItems([menuToolBarItem], animated: true)
        view.addSubview(toolBar)
    }

    @objc func keyBoardShow(noti: Notification) {
        if let _userInfo = noti.userInfo,
           let keyboardRect = _userInfo["UIKeyboardBoundsUserInfoKey"] as? CGRect {
            toolBar.frame = .init(x: 0,
                                  y: view.bounds.size.height - keyboardRect.size.height - toolBarHeight,
                                  width: view.bounds.size.width,
                                  height: toolBarHeight)
            responder.inputView?.frame = .init(x: 0,
                                               y: 0,
                                               width: view.bounds.size.width,
                                               height: toolBar.frame.minY)
        }
    }
    
    @objc func keyBoardHidden() {
        toolBar.frame = .init(x: 0,
                              y: view.bounds.size.height,
                              width: view.bounds.size.width,
                              height: toolBarHeight)
        responder.inputView?.frame = view.bounds
    }
    
}
