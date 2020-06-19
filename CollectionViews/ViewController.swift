//
//  ViewController.swift
//  CollectionViews
//
//  Created by Anderson Malaguitte on 19/06/2020.
//  Copyright © 2020 Anderson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var itemToShow: Item?
    
    //happens once
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //happens every time the view will be shown
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let itemTitle = itemToShow?.title {
            print(itemTitle)
        }
        
    }

}

