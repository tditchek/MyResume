//
//  TabBarController.swift
//  Teddy's_Resume
//
//  Created by Teddy Ditchek on 7/2/15.
//  Copyright (c) 2015 Teddy Ditchek. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // for animated transitioning
        self.delegate = self
    }
}


// MARK: UITabBarControllerDelegate
extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(tabBarController: UITabBarController, animationControllerForTransitionFromViewController fromVC: UIViewController,
        toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            
            // TODO: page curl animation switching to different tab
            let transitioner = AnimationTransitioner()
            transitioner.tabBarController = self
            
            return transitioner
    }
}


// MARK: UIViewControllerAnimatedTransitioning Object
class AnimationTransitioner: NSObject, UIViewControllerAnimatedTransitioning {

    private weak var tabBarController: TabBarController!
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

        // getting From and To view controllers and their views and add to animation context's containerView
        let fromView: UIView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let fromVC: UIViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toView: UIView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        let toVC: UIViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        
        transitionContext.containerView().addSubview(fromView)
        transitionContext.containerView().addSubview(toView)
        
        // get indexes of each VC
        let fromViewControllerIndex = find(self.tabBarController.viewControllers! as! [UIViewController], fromVC)
        let toViewControllerIndex = find(self.tabBarController.viewControllers! as! [UIViewController], toVC)
        
        // set scrolling direction (1 slides left, -1 slides rigth)
        var directionInt : CGFloat!
        if fromViewControllerIndex < toViewControllerIndex {
            directionInt = 1
        } else {
            directionInt = -1
        }
        
        // setup frames for animation:
        // To view starts offscreen and slides, pushing From view off the left side
        toView.frame = CGRectMake(directionInt * toView.frame.width, 0, toView.frame.width, toView.frame.height)
        let fromNewFrame = CGRectMake(-1 * directionInt * fromView.frame.width, 0, fromView.frame.width, fromView.frame.height)
        
        // animate
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
            toView.frame = fromView.frame
            fromView.frame = fromNewFrame
            }) { (Bool) -> Void in
                // update internal view. must ALWAYS be called
                transitionContext.completeTransition(true)
        }
        
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {

        return 0.33
    }
    
}

