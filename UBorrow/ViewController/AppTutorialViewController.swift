//
//  AppTutorialViewController.swift
//  UBorrow
//
//  Created by Lucas Barros on 17/01/18.
//  Copyright © 2018 Lucas C Barros. All rights reserved.
//

import UIKit

class AppTutorialViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    lazy var orderViewControllers: [UIViewController] = {
        return [self.newVc(viewController: "Page1"),
                self.newVc(viewController: "Page2"),
                self.newVc(viewController: "Page3"),
                self.newVc(viewController: "Page32"),
                self.newVc(viewController: "Page4"),
                self.newVc(viewController: "Page8"),
                self.newVc(viewController: "Page5"),
                self.newVc(viewController: "Page9"),
                self.newVc(viewController: "Page6"),
                self.newVc(viewController: "Page7")]
    }()
    
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
        
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.view.backgroundColor = .clear
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar .setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = UIColor.clear
        navigationController?.navigationBar.backgroundColor =  UIColor.clear
        
        self.dataSource = self
        if let firstViewController = orderViewControllers.first{
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: false,
                               completion: nil)
        }
        
        self.delegate = self
        configurePageControl()
    }

    func configurePageControl(){
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY-50, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = orderViewControllers.count
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = appColor.UIGreen
        self.view.addSubview(pageControl)
    }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
    func newVc(viewController: String) -> UIViewController {
        return UIStoryboard(name: "AppTutorial", bundle: nil).instantiateViewController(withIdentifier:viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex-1
        
        guard previousIndex >= 0 else {
//            return orderViewControllers.last // Makes it infinite carossel
            return nil
        }
        
        guard orderViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex+1
        
        guard orderViewControllers.count != nextIndex else {
//            return orderViewControllers.first  // Makes it infinite carossel
            return nil
        }
        
        guard orderViewControllers.count > nextIndex else {
            return nil
        }
        
        return orderViewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderViewControllers.index(of: pageContentViewController)!
    }
}
