//
//  CKTransitionDelegate.m
//  CollectionViewTransition
//
//  Created by Richard Lichkus on 8/12/14.
//  Copyright (c) 2014 Richard Lichkus. All rights reserved.
//

#import "CKTransitionDelegate.h"

@implementation CKTransitionDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    CKAnimatedTransitioning *transitioning = [CKAnimatedTransitioning new];
    return transitioning;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    CKAnimatedTransitioning *transitioning = [CKAnimatedTransitioning new];
    transitioning.reverse = YES;
    return transitioning;
}

@end
