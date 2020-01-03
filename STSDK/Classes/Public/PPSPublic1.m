//
//  PPSPublic1.m
//  Pods
//
//  Created by Tommy-mac on 2019/10/22.
//

#import "PPSPublic1.h"
#import "STHeader.h"
/*
#import <AFNetworking/AFNetworking.h>
#import <Lottie/Lottie.h>
#import <JSONModel/JSONModel.h>
#import <SDWebImage/SDWebImage.h>
#import <Masonry/Masonry.h>
#import <MJRefresh/MJRefresh.h>
#import <MBProgressHUD/MBProgressHUD.h>
*/
@implementation PPSPublic1

- (void)public1
{
    STLog(@"public1");
}

- (void)public1Test
{
    STLog(@"public1Test");
}

- (void)postApi {
    
    NSString *url = [NSString stringWithFormat:@"%@%@%@", @"https://api-int.gdcard888.com", @"/v1", @"/member/checkVersion"];
//    NSLog(@"url=%@",url);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager.requestSerializer setValue:@"X2ZyaWVuZG9fbWVtYmVyX2NhcmRf" forHTTPHeaderField:@"Authorization"];
    [manager POST:url parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    }
    failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    /*
    [manager POST:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        //        NSLog(@"JSON: %@", responseObject);
        
        NSInteger errorCode = [[responseObject objectForKey:@"errorCode"] integerValue];
        NSLog(@"errorCode=%ld",(long)errorCode);
        
        if (errorCode == 2000)
        {
            NSDictionary *dataDic = [responseObject objectForKey:@"data"];
            NSLog(@"dataDic=%@",dataDic);
        }
        else
        {
            
            NSString *errorMsg = [responseObject objectForKey:@"errorMsg"];
            NSLog(@"errorMsg=%@",errorMsg);
            
        }
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
        NSLog(@"error.code=%ld",(long)error.code);
        
    }];
    */
}

- (UIView*)addLottieView {
    /*
    LOTAnimationView *lottieLogo = [LOTAnimationView animationNamed:@"dino_dance.json"];
    
    lottieLogo.frame = CGRectMake(0, 200, self.view.frame.size.width, 300);
    //    self.lottieLogo.contentMode = UIViewContentModeScaleToFill;
    //    self.lottieLogo.contentMode = UIViewContentModeScaleAspectFill;
    lottieLogo.contentMode = UIViewContentModeScaleAspectFit;
    lottieLogo.loopAnimation = YES;
    [self.view addSubview:self.lottieLogo];
    [self.lottieLogo play];
    */
    UIView *tempView = [UIView new];
    tempView.backgroundColor = [UIColor redColor];
    tempView.frame = CGRectMake(0, 0, 100, 300);
    return tempView;
}
@end
