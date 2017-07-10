//
//  ViewController.swift
//  JMSPageControl
//
//  Created by James.xiao on 2017/7/4.
//  Copyright © 2017年 James.xiao. All rights reserved.
//

import UIKit

private let Screen_Width = UIScreen.main.bounds.width

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var wrap1: UIView!
    @IBOutlet weak var scrollView1: UIScrollView!
    @IBOutlet weak var cstStoryboardPageControl: JMSPageControl!
    
    @IBOutlet weak var wrap2: UIView!
    @IBOutlet weak var scrollView2: UIScrollView!
    private lazy var cstPageControl2: JMSPageControl = {
        let temp = JMSPageControl.init(frame: CGRect.init(x: 0, y: self.scrollView2.frame.maxY - 40, width: Screen_Width, height: 40))
        temp.numberOfPages = self.imagesArray.count
        temp.dotViewClass = JMSExampleDotView.self

        return temp
    }()
    
    @IBOutlet weak var wrap3: UIView!
    @IBOutlet weak var scrollView3: UIScrollView!
    private lazy var cstPageControl3: JMSPageControl = {
        let temp = JMSPageControl.init(frame: CGRect.init(x: 0, y: self.scrollView3.frame.maxY - 40, width: Screen_Width, height: 40))
        temp.numberOfPages = self.imagesArray.count
        temp.currentDotImage = UIImage.init(named: "dotActive")
        temp.dotImage = UIImage.init(named: "dotInactive")
        
        return temp
    }()

    var scrollViews: Array<UIScrollView> {
        return [scrollView1, scrollView2, scrollView3]
    }
    
    private var imagesArray = ["1.jpg", "2.jpg", "3.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        for scrollView in self.scrollViews {
            scrollView.contentSize = CGSize.init(width: Screen_Width * CGFloat(self.imagesArray.count), height: scrollView.frame.height)
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    // MARK: - UI
    func setupViews() {
        setupScrollViewImages()
        
        self.cstStoryboardPageControl.layoutIfNeeded()
        self.cstStoryboardPageControl.layoutSubviews()
        self.cstStoryboardPageControl.numberOfPages = self.imagesArray.count
        
        self.cstStoryboardPageControl.didSelectPage = { (pageControl, atIndex) in
            self.scrollView1.scrollRectToVisible(CGRect.init(x: self.scrollView1.frame.width * CGFloat(atIndex), y: 0, width: self.scrollView1.frame.width, height: self.scrollView1.frame.height), animated: true)
        }
        
        self.cstPageControl2.didSelectPage = { (pageControl, atIndex) in
            self.scrollView2.scrollRectToVisible(CGRect.init(x: self.scrollView2.frame.width * CGFloat(atIndex), y: 0, width: self.scrollView2.frame.width, height: self.scrollView2.frame.height), animated: true)
        }
        self.wrap2.addSubview(self.cstPageControl2)
        
        self.cstPageControl3.didSelectPage = { (pageControl, atIndex) in
            self.scrollView3.scrollRectToVisible(CGRect.init(x: self.scrollView3.frame.width * CGFloat(atIndex), y: 0, width: self.scrollView3.frame.width, height: self.scrollView3.frame.height), animated: false)
        }
        self.wrap3.addSubview(self.cstPageControl3)
    }
    
    private func setupScrollViewImages() {
        for scrollView in self.scrollViews {
            scrollView.delegate = self
            
            for i in 0..<self.imagesArray.count {
                let imageName = self.imagesArray[i]
                
                let tempImageView = UIImageView.init(frame: CGRect.init(x: Screen_Width * CGFloat(i), y: 0, width: UIScreen.main.bounds.width, height: scrollView.frame.height))
                
                tempImageView.contentMode = .scaleAspectFill
                tempImageView.image = UIImage.init(named: imageName)
                
                scrollView.addSubview(tempImageView)
            }
        }
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex: Int = Int(scrollView.contentOffset.x / scrollView.frame.width)
        
        if scrollView == scrollView1 {
            cstStoryboardPageControl.currentPage = pageIndex
        }else if scrollView == scrollView2 {
            cstPageControl2.currentPage = pageIndex
        }else {
            cstPageControl3.currentPage = pageIndex
        }
    }

}

