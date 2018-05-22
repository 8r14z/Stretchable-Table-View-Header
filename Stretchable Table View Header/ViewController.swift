//
//  ViewController.swift
//  Stretchable Table View Header
//
//  Created by Le Vu Hoai An on 5/21/18.
//  Copyright © 2018 Le Vu Hoai An. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    private let _tableView = UITableView()
    private let _imageHeader = UIImageView()
    private let IMAGE_HEADER_DEFAULT_HEIGHT: CGFloat = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self._tableView.frame = self.view.bounds
        self._tableView.contentInset = UIEdgeInsetsMake(IMAGE_HEADER_DEFAULT_HEIGHT, 0, 0, 0)
        self._tableView.delegate = self
        
        self._imageHeader.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: IMAGE_HEADER_DEFAULT_HEIGHT)
        self._imageHeader.backgroundColor = .red

        self.view.addSubview(self._tableView)
        self.view.addSubview(self._imageHeader)
    }
    
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        print("Translation: \(gesture.translation(in: self.view))")
        
        //gesture.setTranslation(CGPoint.zero, in: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = -(scrollView.contentOffset.y)
        let height = min(max(y, 60), 400)
        self._imageHeader.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
    }

}
