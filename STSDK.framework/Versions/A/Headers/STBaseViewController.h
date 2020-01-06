//
//  STBaseViewController.h
//  STSDK
//
//  Created by Tommy-mac on 2019/12/30.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
//#import "UIView+Extension.h"
#import "STDefDevice.h"
#import "STHeader.h"
#import "STBaseRequestModel.h"
#import "STBaseViewModel.h"

//#import "ST_VM_Test.h"

NS_ASSUME_NONNULL_BEGIN

@interface STBaseViewController : UIViewController<STBaseViewModelDelegate>

- (void)requestFailed:(STBaseRequestModel *)model errorMsg:(NSString *)errorMsg;

- (void)requestSuccess:(STBaseRequestModel *)model dataDict:(id)dataDict;
- (void)startAnimating;  //开启动画，也就是开始旋转。

- (void)stopAnimating;   //停止动画，旋转。

- (BOOL)isAnimating;     //获取状态 ，0 NO 表示正在旋转，1 YES 表示没有旋转。

@end

#pragma mark - alert功能的扩展
@interface STBaseViewController (Alert)<UIAlertViewDelegate>
/**
 *  显示自定义提示框带callback
 *
 *  @param title   提示框标题
 *  @param message 提示语
 *  @param array   按钮文本数组
 *  @param callback 回调方法（index 从1开始）
 */
- (void)showDefineWithTitle:(nullable NSString *)title
                    message:(nullable NSString *)message
              btnTitleArray:(nullable NSArray *)array
                   callback:(nullable void(^)(NSInteger index))callback;
/*
- (void)showPhotoWithTitle:(nullable NSString *)title
                      data:(nullable NSArray *)data
                  callback:(nullable void(^)(NSInteger index))callback;

- (void)showAlertIcon:(NSString*)iconStr withTitle:(NSString *)title withMessages:(NSArray *)messages btnTitleArray:(NSArray *)array callback:(void (^)(NSInteger))callback;

- (void)showAlertIcon:(NSString*)iconStr withTitle:(NSString *)title withMessages:(NSArray *)messages btnTitleArray:(NSArray *)array withLeftSpace:(CGFloat)leftSpace callback:(void (^)(NSInteger))callback;

- (void)showAlertIcon:(NSString*)iconStr withTitle:(NSString *)title withCenterMessages:(NSArray *)messages btnTitleArray:(NSArray *)array callback:(void (^)(NSInteger))callback;
*/
/**
 *  显示系统提示框带callback
 *
 *  @param title   提示框标题
 *  @param message 提示语
 *  @param array   按钮文本数组
 *  @param callback 回调方法（index 从1开始）
 */
- (void)showWithTitle:(nullable NSString *)title
              message:(nullable NSString *)message
        btnTitleArray:(nullable NSArray *)array
             callback:(nullable void(^)(NSInteger index))callback;


@end

#pragma mark - ProgressHud 扩展
@interface STBaseViewController (ProgressHud)

/**
 *  在当前页面中间显示loading图标
 */
- (void)showProgressHud;

/**
 *  在当前页面中间显示loading图标
 *
 *  @param lockScreen 是否锁屏
 */
- (void)showProgressHud:(BOOL)lockScreen;

/**
 *  在当前页面中间显示loading图标
 *
 *  @param message    显示的文本
 *  @param lockScreen 是否锁屏
 */
- (void)showProgressHud:(nullable NSString *)message lockScreen:(BOOL)lockScreen;

/**
 *  在当前页面中间显示loading图标
 *
 *  @param message     显示的文本
 *  @param lockScreen  是否锁屏
 *  @param timeDelta 是否自动隐藏，以秒为单位，为0时不自动隐藏
 */
- (void)showProgressHud:(nullable NSString *)message
             lockScreen:(BOOL)lockScreen
            autoDismiss:(NSTimeInterval)timeDelta;

/**
 *  隐藏loading图标
 */
- (void)hideProgreddHud;

/**
 *  关闭自定义hud
 */
- (void)hideCustomProgressHud;

@end

NS_ASSUME_NONNULL_END
