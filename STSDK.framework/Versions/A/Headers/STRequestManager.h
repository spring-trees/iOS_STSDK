//
//  STRequestManager.h
//  STSDK
//
//  Created by Tommy-mac on 2019/12/31.
//

#import <Foundation/Foundation.h>
#import "STBaseRequestModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    PostType,
    CKIPostType,
    GetType,
    CKIGetType,
    PoralGetType,
    CaptchaPostType
} RequestType;

@protocol STRequestManagerDelegate <NSObject>

@optional
/**
 *  通讯返回需要登录
 *
 *  @param inputModel        请求的输入参数
 */
- (void)requestNeedLogin:(STBaseRequestModel*)inputModel;
/**
 *  接口访问返回
 *
 *  @param input  接口的输入参数
 *  @param output 接口返回的数据
 *  @param errorMessage  接口访问出现的错误
 */
- (void)requestFinished:(nullable STBaseRequestModel *)input
                 output:(nullable id)output
                  error:(nullable NSString *)errorMessage;

@end

@interface STRequestManager : NSObject

/** *  委托 */
@property (nonatomic, weak) id <STRequestManagerDelegate> delegate;

/**
 *  发送请求
 *
 *   url          交易url
 *  @param requestModel 交易输入参数
 *  @param type         请求类型类型
 *
 *  @return 成功提交发送请求返回YES，否则返回NO
 */
- (BOOL)requestWithRequestModel:(STBaseRequestModel *)requestModel requestType:(RequestType)type;

@end

NS_ASSUME_NONNULL_END
