//
//  STNetWorkManager.m
//  STSDK
//
//  Created by Tommy-mac on 2019/12/31.
//

#import "STNetWorkManager.h"
#import "AFNetworking.h"
#import "STRequestConstants.h"
#import "STHeader.h"
#import "STBaseViewController.h"

void ua_internal_debug(id params,id response,NSString *title){
    
    NSString *convertString = @"";
    NSString *responseString = @"";
    
    if ([params isKindOfClass:NSDictionary.class] || [params isKindOfClass:NSArray.class]) {
        
        NSData *convertData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
        convertString = [[NSString alloc] initWithData:convertData encoding:NSUTF8StringEncoding];
        
    } else {
        convertString = [NSString stringWithFormat:@"%@",(params ?: @"No params")];
    }
    if ([response isKindOfClass:NSDictionary.class] || [response isKindOfClass:NSArray.class]) {
        
        NSData *convertData = [NSJSONSerialization dataWithJSONObject:response options:NSJSONWritingPrettyPrinted error:nil];
        responseString = [[NSString alloc] initWithData:convertData encoding:NSUTF8StringEncoding];
        
    } else {
        responseString = [NSString stringWithFormat:@"%@",(response ?: @"No response")];
    }
    STLog(@"-----------------------------------------\n Debug url: %s \n Debug params: %s \n Debug response: %s \n-----------------------------------------\n", [(title ?: @"No title") UTF8String],[convertString UTF8String],[responseString UTF8String]);
};

@interface STNetWorkManager ()

//@property(nonatomic,assign)BOOL refreshTokenFlag;

@property (nonatomic, strong) AFHTTPSessionManager *requestManager;

@end

@implementation STNetWorkManager

static id _instance = nil;

-(id) init{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super init];
        _requestManager = [AFHTTPSessionManager manager];
        //初始化响应者
        //        _requestManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        //        _requestManager.requestSerializer = [AFJSONRequestSerializer serializer];
        _requestManager.responseSerializer = [AFJSONResponseSerializer serializer];
        _requestManager.requestSerializer = [AFJSONRequestSerializer serializer];
//        _requestManager.requestSerializer setValue:kApiAuthorizationKey forHTTPHeaderField:@"Authorization"];
        AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
        [manager startMonitoring];
        [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusUnknown:
                {
                    // 位置网络
                    STLog(@"位置网络");
                }
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                {
                    // 无法联网
                    STLog(@"无法联网");
//                    [self openNetWorkTip];
                }
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi:
                {
                    // 手机自带网络
                    STLog(@"当前使用的是2G/3G/4G网络");
                }
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN:
                {
                    // WIFI
                    STLog(@"当前在WIFI网络下");
                }
            }
        }];
    });
    return _instance;
}

-(void)openNetWorkTip{
    /*
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController * vc = [UIApplication sharedApplication].delegate.window.rootViewController;
        if ([vc isKindOfClass:[STBaseViewController class]]) {
            STBaseViewController *VC = (STBaseViewController *)vc;
            
            [VC showDefineWithTitle:@"提示" message:@"請在iPhone的「設定」>「行動服務」中開啟網路功能。" btnTitleArray:@[@"取消",@"設定"] callback:^(NSInteger index) {
                if (index == 2) {
                    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]]) {
                        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                    }
                }
            }];
             
        }
    });
             */
}

+ (STNetWorkManager *)sharedInstance{
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}


- (void)GETUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    AFHTTPSessionManager *manager = [STNetWorkManager sharedInstance].requestManager;
    [manager.requestSerializer setValue:kApiAuthorizationKey forHTTPHeaderField:@"Authorization"];
    [manager GET:url parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        if (success) {
            ua_internal_debug(parameters,responseObject, url);
            success(responseObject);
        }
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if (failure) {
            failure(error);
            STLog(@"网络异常 - T_T%@", error);
        }
    }];
    
}

- (void)POSTUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    AFHTTPSessionManager *manager = [STNetWorkManager sharedInstance].requestManager;
    [manager.requestSerializer setValue:kApiAuthorizationKey forHTTPHeaderField:@"Authorization"];
    [manager POST:url parameters:parameters success:^(NSURLSessionTask *task, id responseObject) {
        //        STLog(@"responseObject=%@",responseObject);
        if (success) {
            success(responseObject);
            ua_internal_debug(parameters,responseObject, url);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
            STLog(@"网络异常 - T_T%@", error);
        }
    }];
}

/*
- (void)LoginedPOSTUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    AFHTTPSessionManager * manager = [STNetWorkManager sharedInstance].requestManager;
    NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithCapacity:1];
    [mutableDic addEntriesFromDictionary:parameters];
    [mutableDic setValue:@"" forKey:@"token"];
    [manager POST:url parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        if (success) {
            //            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            ua_internal_debug(parameters,responseObject, url);
            success(responseObject);
            //            STLog(@"请求url---%@\n请求数据---%@\n返回数据---%@",url,parameters,responseObject);
        }
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if (failure) {
            failure(error);
            STLog(@"网络异常 - T_T%@", error);
        }
    }];
    
}

- (void)LoginedGETUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
    AFHTTPSessionManager * manager = [STNetWorkManager sharedInstance].requestManager;
    NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithCapacity:1];
    [mutableDic addEntriesFromDictionary:parameters];
    [mutableDic setValue:@"" forKey:@"token"];
    
    [manager GET:url parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        if (success) {
            //            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            ua_internal_debug(parameters,responseObject, url);
            success(responseObject);
            //            STLog(@"请求url---%@\n请求数据---%@\n返回数据---%@",url,parameters,responseObject);
        }
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if (failure) {
            failure(error);
            STLog(@"网络异常 - T_T%@", error);
        }
    }];
    
}
*/
@end
