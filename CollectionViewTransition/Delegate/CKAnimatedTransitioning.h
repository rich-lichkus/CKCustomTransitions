//
//  CKAnimatedTransitioning.h
//  CollectionViewTransition
//
//  Created by Richard Lichkus on 8/12/14.
//  Copyright (c) 2014 Richard Lichkus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CKCollectionViewCell.h"

@interface CKAnimatedTransitioning : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic) BOOL reverse;
@property (nonatomic) CGRect collectionCellFrame;
@property (nonatomic) CGRect imgViewFrame;
@property (strong, nonatomic) CKCollectionViewCell *selectedCell;
@end
