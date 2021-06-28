//
//  ViewController.swift
//  TextFromCamera
//
//  Created by jianghongbao on 2021/6/17.
//

import UIKit

class ViewController: UIViewController {

    private let mainTableView: UITableView = UITableView()
    private let viewControllers: [ControllerConfigProtocol] = [UITextViewRelatedController(),
                                                               UITextFieldRelatedController(),
                                                               CustomRelatedController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "TextFromCamera"
        view.backgroundColor = .white
        
        mainTableView.backgroundColor = .lightGray
        mainTableView.separatorStyle = .none
        mainTableView.estimatedRowHeight = 60
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        view.addSubview(mainTableView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        mainTableView.frame = view.bounds
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewControllers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.contentView.backgroundColor = .systemGray2
        cell.textLabel?.text = viewControllers[indexPath.row].name
        cell.textLabel?.font = .boldSystemFont(ofSize: 16)
        cell.textLabel?.textAlignment = .left
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let subviewController = viewControllers[indexPath.row] as? UIViewController {
            self.navigationController?.pushViewController(subviewController, animated: true)
        }
    }
    
}
