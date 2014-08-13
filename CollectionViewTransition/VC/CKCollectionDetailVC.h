//
//  CKCollectionDetailVC.h
//  CollectionViewTransition
//
//  Created by Richard Lichkus on 8/12/14.
//  Copyright (c) 2014 Richard Lichkus. All rights reserved.
//

#import "CKTransitionDelegate.h"
#import <UIKit/UIKit.h>

@interface CKCollectionDetailVC : UIViewController

@property (strong, nonatomic) CKTransitionDelegate *transitioningDelegate;
@property (weak, nonatomic) IBOutlet UIImageView *imgAvatar;

@end
