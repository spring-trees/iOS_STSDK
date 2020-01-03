//
//  STNetWorkManager.h
//  STSDK
//
//  Created by Tommy-mac on 2019/12/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface STNetWorkManager : NSObject

+ (STNetWorkManager *)sharedInstance;

/**!
 @brief GET 请求
 @param parameters 传入的参数
 @param success 调用接口成功后返回一个id类型值
 @param failure 调用接口失败后返回一个错误描述
 */
- (void)GETUrl:(NSString *)url parameters:(NSDictionary *)parameters
       success:(void (^)(id responseObject))success
       failure:(void (^)(NSError *error))failure;

/**!
 @brief POST 请求
 @param parameters 传入的参数
 @param success 调用接口成功后返回一个id类型值
 @param failure 调用接口失败后返回一个错误描述
 */
- (void)POSTUrl:(NSString *)url parameters:(NSDictionary *)parameters
        success:(void (^)(id responseObject))success
        failure:(void (^)(NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
