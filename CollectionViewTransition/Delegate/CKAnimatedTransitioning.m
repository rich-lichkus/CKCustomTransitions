//
//  CKAnimatedTransitioning.m
//  CollectionViewTransition
//
//  Created by Richard Lichkus on 8/12/14.
//  Copyright (c) 2014 Richard Lichkus. All rights reserved.
//

#import "CKAnimatedTransitioning.h"
#import "CKCollectionDetailVC.h"

static NSTimeInterval const CKAnimatedTransitionDuration = 2.0f;

@implementation CKAnimatedTransitioning

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    CGRect imgOverlayFrame;

    // Detail VC
    CKCollectionDetailVC *detailVC;
    if(self.reverse){
        if([fromViewController isKindOfClass:[CKCollectionDetailVC class]]){
            detailVC = (CKCollectionDetailVC*)fromViewController;
            detailVC.view.alpha = 1.0f;
            [container addSubview:toViewController.view];
            [container bringSubviewToFront:detailVC.view];
        }
        imgOverlayFrame = detailVC.imgAvatar.frame;
//        imgOverlayFrame.origin.y -= 64;
    } else {
        if([toViewController isKindOfClass:[CKCollectionDetailVC class]]){
            detailVC = (CKCollectionDetailVC*)toViewController;
            detailVC.view.alpha = 0.0f;
            [container addSubview:detailVC.view];
        }
        imgOverlayFrame = self.selectedCell.frame;
        imgOverlayFrame.origin.y += 64;
    }
    
    detailVC.imgAvatar.hidden = YES;
    self.selectedCell.hidden = YES;
    
    // Image View Overlay
    UIImageView *imgOverlay = [[UIImageView alloc] initWithFrame:imgOverlayFrame];
    imgOverlay.image = self.selectedCell.imgAvatar.image;
    [container addSubview:imgOverlay];
    
    // Transformations
    CGFloat scaleFactorX = self.collectionCellFrame.size.width/detailVC.imgAvatar.frame.size.width;
    CGFloat scaleFactorY = self.collectionCellFrame.size.height/detailVC.imgAvatar.frame.size.height;
    
    [UIView animateKeyframesWithDuration:CKAnimatedTransitionDuration delay:0 options:0 animations:^{
        if (self.reverse) {
            detailVC.view.alpha = 0.0f;
            imgOverlay.center = CGPointMake(self.selectedCell.frame.size.width*.5+self.selectedCell.frame.origin.x,
                                            self.selectedCell.frame.size.height*.5+self.selectedCell.frame.origin.y+64);
            imgOverlay.transform = CGAffineTransformMakeScale(scaleFactorX, scaleFactorY);
        } else {
            detailVC.view.alpha =1.0f;
            imgOverlay.center = CGPointMake(detailVC.imgAvatar.frame.size.width*.5+detailVC.imgAvatar.frame.origin.x,
                                            detailVC.imgAvatar.frame.size.height*.5+detailVC.imgAvatar.frame.origin.y);
            imgOverlay.transform = CGAffineTransformMakeScale(1/scaleFactorX, 1/scaleFactorY);
            
        }
    } completion:^(BOOL finished) {
        if(self.reverse){
            self.selectedCell.hidden = NO;
        } else {
            detailVC.imgAvatar.hidden = NO;
            detailVC.imgAvatar.image = imgOverlay.image;
        }
        [imgOverlay removeFromSuperview];
        [transitionContext completeTransition:finished];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return CKAnimatedTransitionDuration;
}

@end
