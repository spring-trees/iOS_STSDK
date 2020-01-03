//
//  STBaseViewModel.h
//  STSDK
//
//  Created by Tommy-mac on 2019/12/31.
//

#import <Foundation/Foundation.h>
#import "STRequestManager.h"

NS_ASSUME_NONNULL_BEGIN

@protocol STBaseViewModelDelegate <NSObject>

@optional
/**
 *  VM访问接口时出错了
 *
 *  @param model    请求model
 *  @param errorMsg        错误描述
 */
- (void)requestFailed:(STBaseRequestModel *)model errorMsg:(NSString *)errorMsg;

/**
 *  VM访问接口成功返回
 *
 *  @param model     请求model
 *  @param dataDict    接口返回的数据对象
 */
- (void)requestSuccess:(STBaseRequestModel *)model dataDict:(id)dataDict;

@end

@interface STBaseViewModel : NSObject<STRequestManagerDelegate>

@property (nonatomic, weak) id<STBaseViewModelDelegate> delegate;

/**
 *  接口请求管理器
 */
@property (nonatomic, strong) STRequestManager *requestManager;

/** *  是否正在加载数据 */
@property (nonatomic, assign) BOOL loading;
@end

NS_ASSUME_NONNULL_END
