//
//  LZCustomSegue.m
//  LZCustomSegue
//
//  Created by comst on 15/12/21.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZCustomSegue.h"
#import "MasterViewController.h"
#import "DetailViewController.h"

@implementation LZCustomSegue

- (void)perform{
    
    MasterViewController *masterVC = (MasterViewController *)self.sourceViewController;
    DetailViewController *detailVC = (DetailViewController *)self.destinationViewController;
    
    CGRect startRect = masterVC.view.frame;
    CGRect finalRect = masterVC.view.frame;
    finalRect.origin.y += finalRect.size.height;
    
    [UIView animateWithDuration:0.75 animations:^{
        masterVC.view.frame = finalRect;
        
    } completion:^(BOOL finished) {
        [masterVC.view.superview addSubview:detailVC.view];
        detailVC.view.frame = finalRect;
        detailVC.view.alpha = 0;
        [UIView animateWithDuration:0.75 animations:^{
            detailVC.view.alpha = 1;
            detailVC.view.frame = startRect;
        } completion:^(BOOL finished) {
            [detailVC.view removeFromSuperview];
            [masterVC.navigationController pushViewController:detailVC animated:NO];
        }];
    }];
}
@end
