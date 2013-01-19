//
//  AppDelegate.m
//  SplitView Sample
//
//  Created by Ying Rao on 1/19/13.
//  Copyright (c) 2013 Ying Rao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h" 


@interface DetailViewContainerController : UIViewController <UISplitViewControllerDelegate> {
    UIViewController* topController;
}

-(void)showViewWithId:(int)viewId;

@property (strong, nonatomic) DetailViewController *detailViewController1;
@property (strong, nonatomic) DetailViewController *detailViewController2;
@property (strong, nonatomic) DetailViewController *detailViewController3;
@end
