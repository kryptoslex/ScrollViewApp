//
//  ViewController.swift
//  ScrollViewApp
//
//  Created by Michael Jay Abalos on 25/09/2017.
//  Copyright © 2017 Michael Jay Abalos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var images = [UIImageView]()
    var contentWidth: CGFloat = 0
    var contentHeight: CGFloat = 0
    var scrollViewWidth: CGFloat = 0
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        print("current page = \(page)")
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right \(page + contentWidth) : \(contentWidth)")
                //scrollView.contentOffset = CGPoint(x: page + contentWidth , y: contentWidth)
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left \(page - contentWidth) : \(contentWidth)")
                //scrollView.contentOffset = CGPoint(x: page - contentWidth, y: contentWidth)
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        
        scrollViewWidth = scrollView.frame.size.width
        
        for x in 0...2 {
            let image = UIImage(named: "icon\(x)")
            let imageView = UIImageView.init(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            newX = scrollViewWidth/2 + scrollViewWidth * CGFloat(x)
            scrollView.addSubview(imageView)
           
            let imageWidth = scrollViewWidth/2
            contentHeight = (scrollView.frame.size.height/2) - imageWidth/2
            imageView.frame = CGRect(x: newX - imageWidth/2, y: contentHeight, width: imageWidth, height: imageWidth)
        }
        
        contentWidth = scrollView.frame.size.width * CGFloat(images.count)
        scrollView.clipsToBounds = false
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        
    }
    
    

}

