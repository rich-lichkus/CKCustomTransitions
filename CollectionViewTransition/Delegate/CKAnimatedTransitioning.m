//
//  CKAnimatedTransitioning.m
//  CollectionViewTransition
//
//  Created by Richard Lichkus on 8/12/14.
//  Copyright (c) 2014 Richard Lichkus. All rights reserved.
//

#import "CKAnimatedTransitioning.h"

static NSTimeInterval const CKAnimatedTransitionDuration = 2.0f;

@implementation CKAnimatedTransitioning

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    CGRect toVCFrame = toViewController.view.frame;
    CGRect imgViewFrame = CGRectMake(48, 96, 225, 233);
    
    if (self.reverse) {
        [container insertSubview:toViewController.view belowSubview:fromViewController.view];
        fromViewController.view.alpha = 0.0f;
    }
    else {
        
        toViewController.view.alpha = 0.0f;
//        toViewController.view.transform = CGAffineTransformMakeScale(self.collectionCellFrame.size.width/toVCFrame.size.width, self.collectionCellFrame.size.height/toVCFrame.size.height);
//        
//        toViewController.view.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(self.collectionCellFrame.size.width/toVCFrame.size.width,
//                                                                                             self.collectionCellFrame.size.height/toVCFrame.size.height),
//                                                                  CGAffineTransformMakeTranslation(self.collectionCellFrame.origin.x,
//                                                                                                   self.collectionCellFrame.origin.y));
        
        [container addSubview:toViewController.view];
    }
    
    [UIView animateKeyframesWithDuration:CKAnimatedTransitionDuration delay:0 options:0 animations:^{
        if (self.reverse) {
            self.selectedCell.transform = CGAffineTransformInvert(CGAffineTransformMakeScale(225.0/self.collectionCellFrame.size.width, 233.0/self.collectionCellFrame.size.height));
        }
        else {
            self.selectedCell.transform = CGAffineTransformMakeTranslation(48-self.collectionCellFrame.origin.x, 96-self.collectionCellFrame.origin.y);
            self.selectedCell.transform = CGAffineTransformMakeScale(225.0/self.collectionCellFrame.size.width, 233.0/self.collectionCellFrame.size.height);

        }
    } completion:^(BOOL finished) {
        toViewController.view.alpha = 1.0f;
        [transitionContext completeTransition:finished];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return CKAnimatedTransitionDuration;
}

@end
