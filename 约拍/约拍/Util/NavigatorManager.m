//
//  NavigatorManager.m
//  约拍
//
//  Created by apple on 16/1/24.
//  Copyright © 2016年 ArtisticPhoto. All rights reserved.
//

#import "NavigatorManager.h"
#import "ProductsViewController.h"

@implementation NavigatorManager

+ (void)navigatorBy:(ActionModel *)action viewController:(UIViewController *)viewController
{
    if (action.navigatorType == NavigatorTypeByType) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Product" bundle:nil];
        ProductsViewController *navigatorToViewController = [storyBoard instantiateViewControllerWithIdentifier:@"ProductsViewController"];
        navigatorToViewController.action = action;
        [viewController.navigationController pushViewController:navigatorToViewController animated:YES];
    }
}

@end
