//
//  ViewController.m
//  get_SIM_Information
//
//  Created by 李根 on 16/9/5.
//  Copyright © 2016年 ligen. All rights reserved.
//

#import "ViewController.h"

#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

#import <AdSupport/AdSupport.h>

@interface ViewController ()
{
    CTTelephonyNetworkInfo *networkInfo;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    __weak ViewController *blockSelf = self;
    
    networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    //  当sim卡更换时弹出此窗口
    networkInfo.subscriberCellularProviderDidUpdateNotifier = ^(CTCarrier *carrier) {
        UIAlertView *aler = [[UIAlertView alloc] initWithTitle:@"SIM card changed" message:nil delegate:blockSelf cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [aler show];
    };
    
    //  获取SIM卡信息
    CTCarrier *carrier = networkInfo.subscriberCellularProvider;
    //  供应商名称
    NSLog(@"供应商名称: %@", carrier.carrierName);
    //  所在国家编号
    NSLog(@"所在国家编号: %@", carrier.mobileCountryCode);
    //  供应商网络编号
    NSLog(@"供应商网络编号: %@", carrier.mobileNetworkCode);
    //
    NSLog(@"%@", carrier.isoCountryCode);
    //  是否允许voip
    NSLog(@"%d", carrier.allowsVOIP);
    
//    //  CFUUID
//    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
//    NSString *uuid = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
//    NSLog(@"CFUUID: %@", uuid);
//    
//    //  NSUUID
//    NSString *uuidStr = [[NSUUID UUID] UUIDString];
//    NSLog(@"NSUUID: %@", uuidStr);
//    
//    //  vindor标识符
//    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
//    NSLog(@"vindor: %@", idfv);
    
    //  IDFA    广告标识符
    NSString *idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    NSLog(@"idfa: %@", idfa);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
