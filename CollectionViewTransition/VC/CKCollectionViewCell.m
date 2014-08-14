//
//  CKCollectionViewCell.m
//  CKCustomTransitions
//
//  Created by Richard Lichkus on 8/13/14.
//  Copyright (c) 2014 Richard Lichkus. All rights reserved.
//

#import "CKCollectionViewCell.h"

@implementation CKCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imgAvatar = [[UIImageView alloc] initWithFrame:frame];
        [self addSubview:self.imgAvatar];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.imgAvatar = [[UIImageView alloc] initWithFrame:self.frame];
        [self addSubview:self.imgAvatar];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
