//
//  ViewController.swift
//  sixth_2
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 Lixin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let redView = UIView()
        redView.backgroundColor = #colorLiteral(red: 1, green: 0.6438010931, blue: 0.6258417964, alpha: 1)
        let greenView = UIView()
        greenView.backgroundColor = #colorLiteral(red: 0.6125320792, green: 1, blue: 0.7975903153, alpha: 1)
        let yellowView = UIView()
        yellowView.backgroundColor = #colorLiteral(red: 0.9597515464, green: 1, blue: 0.6386668682, alpha: 1)
        let stackView = UIStackView(arrangedSubviews: [redView,greenView,yellowView])
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    

}

