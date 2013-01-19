//
//  MasterViewController.h
//  SplitView Sample
//
//  Created by Ying Rao on 1/19/13.
//  Copyright (c) 2013 Ying Rao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewContainerController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewContainerController *detailViewContainerController;

@end
