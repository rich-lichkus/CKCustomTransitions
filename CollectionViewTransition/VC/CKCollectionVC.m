//
//  CKCollectionVC.m
//  CollectionViewTransition
//
//  Created by Richard Lichkus on 8/12/14.
//  Copyright (c) 2014 Richard Lichkus. All rights reserved.
//

#import "CKCollectionVC.h"
#import "CKCollectionDetailVC.h"
#import "CKAnimatedTransitioning.h"

@interface CKCollectionVC () <UICollectionViewDataSource, UICollectionViewDelegate, UINavigationControllerDelegate, UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) CKAnimatedTransitioning *animationTransition;
@property (weak, nonatomic) IBOutlet UICollectionView *colCollectionView;

@end

@implementation CKCollectionVC

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
    
    [self configureCollectionView];
    
    [self configureNavigationController];
}

#pragma mark - Configuration

- (void)configureCollectionView
{
    self.colCollectionView.delegate = self;
    self.colCollectionView.dataSource = self;
}

-(void)configureNavigationController{
    self.navigationController.delegate = self;
}

#pragma mark - Collection DataSource

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:cell.bounds];
    imageView.image = [UIImage imageNamed:@"profile"];
    [cell addSubview:imageView];
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

#pragma mark - Collection Delegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    CGRect selectedCellFrame = [cell.superview convertRect:cell.frame toView:self.view];
    self.animationTransition.selectedCell = cell;
    
    self.animationTransition.collectionCellFrame = selectedCellFrame;
    CKCollectionDetailVC *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailVC"];
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - Navigation Controller Delegate

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    
    
    if(operation == UINavigationControllerOperationPush){
        self.animationTransition.reverse = NO;
    } else if (operation == UINavigationControllerOperationPop){
        self.animationTransition.reverse = YES;
    }
    return self.animationTransition;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

}

#pragma mark - Lazy

-(CKAnimatedTransitioning*)animationTransition{
    if(!_animationTransition){
        _animationTransition = [[CKAnimatedTransitioning alloc] init];
    }
    return _animationTransition;
}

#pragma mark - Memory

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
