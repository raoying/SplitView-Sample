//
//  AppDelegate.m
//  SplitView Sample
//
//  Created by Ying Rao on 1/19/13.
//  Copyright (c) 2013 Ying Rao. All rights reserved.
//

#import "DetailViewContainerController.h"

@interface DetailViewContainerController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@end

@implementation DetailViewContainerController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.detailViewController1 = [self.storyboard instantiateViewControllerWithIdentifier:@"viewController1"];
    self.detailViewController2 = [self.storyboard instantiateViewControllerWithIdentifier:@"viewController2"];
    self.detailViewController3 = [self.storyboard instantiateViewControllerWithIdentifier:@"viewController3"];
    [self addChildViewController:self.detailViewController1];
    [self addChildViewController:self.detailViewController2];
    [self addChildViewController:self.detailViewController3];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showViewWithId:(int)viewId {
    UIViewController *viewController;
    switch (viewId) {
        case 0:
            viewController = self.detailViewController1;
            break;
        case 1:
            viewController = self.detailViewController2;
            break;
        case 2:
            viewController = self.detailViewController3;
            break;
    }
    [self showChildViewController:viewController];
      
}



-(void)showChildViewController:(UIViewController*)content {
    if(topController != content) {
        content.view.frame = [self.view frame]; // 2
        [self.view addSubview:content.view];
        [content didMoveToParentViewController:self];
        topController = content;
    }
}



#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}
@end
