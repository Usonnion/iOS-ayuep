//
//  MineViewController.m
//  约拍
//
//  Created by apple on 16/2/18.
//  Copyright © 2016年 ArtisticPhoto. All rights reserved.
//

#import "MineViewController.h"
#import "StoreBLL.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (IBAction)storeInvitation:(id)sender
{
    __weak typeof(self) weakSelf = self;
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请输入邀请码" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
    }];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"进入店铺" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textField = alertController.textFields[0];
        [[LoadingManager sharedManager] showLoadingWithBlockUI:weakSelf.tabBarController.view description:@""];
        [self goToMyStore:[textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)goToMyStore:(NSString *)invitationId
{
    [[[StoreBLL alloc] init] getStoreByInvivationId:invitationId success:^(NSDictionary *json) {
        [[LoadingManager sharedManager] hideLoadingWithmessage:nil success:YES];
        StoreModel *store = [StoreModel fromDictionary:json];
        ActionModel *action = [[ActionModel alloc] init];
        action.navigatorType = NavigatorTypeToStore;
        action.storeId = store.storeId;
        [[DiskCacheManager sharedManager] archiveStores:@[store]];
        [NavigatorManager navigatorBy:action viewController:self];
    } failure:^{
        [[LoadingManager sharedManager] hideLoadingWithmessage:@"无效的邀请码，请联系管理员" success:NO];
    }];
}

@end
