//
//  CKCollectionDetailVC.m
//  CollectionViewTransition
//
//  Created by Richard Lichkus on 8/12/14.
//  Copyright (c) 2014 Richard Lichkus. All rights reserved.
//

#import "CKCollectionDetailVC.h"

@interface CKCollectionDetailVC ()


@end

@implementation CKCollectionDetailVC

#pragma mark - Instantiation

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

#pragma mark - View

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureUIElements];
    
    [self configureTransistion];
}

#pragma mark - Configuration

-(void)configureUIElements{
    self.imgAvatar.image = [UIImage imageNamed:@"profile"];
}

-(void)configureTransistion{
    [self setTransitioningDelegate:self.transitioningDelegate];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

}

#pragma mark - Memory

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
