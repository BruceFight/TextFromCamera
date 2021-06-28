//
//  ControllerModel.swift
//  TextFromCamera
//
//  Created by jianghongbao on 2021/6/18.
//

import UIKit

protocol ControllerConfigProtocol {
    
    var name: String! { get set }
    var responder: (UIResponder & UIKeyInput)! { get set }
    
}
