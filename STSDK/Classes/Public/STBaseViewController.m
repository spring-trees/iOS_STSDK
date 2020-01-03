//
//  STBaseViewController.m
//  STSDK
//
//  Created by Tommy-mac on 2019/12/30.
//

#import "STBaseViewController.h"
#import "ST_VM_Test.h"

@interface STBaseViewController ()

@property (nonatomic, strong) UIActivityIndicatorView *indicator;

@property (nonatomic, strong) ST_VM_Test *viewModel;

@end

@implementation STBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.view.backgroundColor = [STCommon randomColor];
    
    UIButton *tempButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tempButton.frame = CGRectMake(0, 100, self.view.frame.size.width, 100);
    tempButton.backgroundColor = [UIColor redColor];
    [tempButton setTitle:@"api version" forState:UIControlStateNormal];
    [tempButton addTarget:self action:@selector(testAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tempButton];
    
    
}

- (void)testAction:(id)sender {
    STLog(@"testAction");
    
    [self showProgressHud];
    [self.viewModel requsetTest];
    
}

- (void)startAnimating{
    [self.indicator startAnimating];
}

- (void)stopAnimating{
    [self.indicator stopAnimating];
}

- (BOOL)isAnimating{
    return [self.indicator isAnimating];
}

#pragma mark --STBaseViewModelDelegate---
- (void)requestFailed:(STBaseRequestModel *)model errorMsg:(NSString *)errorMsg{
    
//    [super requestFailed:model errorMsg:errorMsg];
    
//    STLog(@"model=%@",[model yy_modelToJSONObject]);
    STLog(@"model.apiName=%@",model.apiName);
    STLog(@"model.apiLocation=%@",model.apiLocation);
    if ([model.apiName isEqualToString:@"member"] && [model.apiLocation isEqualToString:@"checkVersion"]) {
        STLog(@"returnreturnreturnreturnreturn");
        return;
    }
    
    [self showWithTitle:nil message:errorMsg btnTitleArray:@[@"確定",@"1",@"2",@"3"] callback:^(NSInteger index) {
        STLog(@"index=%ld",(long)index);
    }];
//    [self hideProgreddHud];
//    self.viewModel.loading = NO;
    
}

- (void)requestSuccess:(STBaseRequestModel *)model dataDict:(id)dataDict{
//    STLog(@"model=%@",[model yy_modelToJSONObject]);
//    [self hideProgreddHud];
    
    STLog(@"dataDict=%@",dataDict);
    
}

#pragma - mark Property

- (UIActivityIndicatorView *)indicator{
    if (!_indicator) {
        _indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        //设置显示位置
        _indicator.center = CGPointMake(self.view.center.x, (kScreenHeigth-kNavBarHeight-kTabbarHeight)/2);
        _indicator.hidesWhenStopped = YES;
        //将这个控件加到父容器中。
        [self.view addSubview:_indicator];
    }
    return _indicator;
}

#pragma mark ---property--
- (ST_VM_Test *)viewModel{
    if (!_viewModel) {
        _viewModel = [ST_VM_Test new];
        _viewModel.delegate = self;
    }
    return _viewModel;
}

@end


@implementation STBaseViewController (Alert)
- (void)showDefineWithTitle:(NSString *)title message:(NSString *)message btnTitleArray:(NSArray *)array callback:(void (^)(NSInteger))callback
{
    /*
    CKIPickView *pickView = [[CKIPickView alloc] initWitTitle:title message:message buttonNames:array];
    pickView.selectedBlock = ^(NSInteger index) {
        if (callback) {
            callback(index);
        }
    };
    [pickView showPickView];
     */
}



- (void)showWithTitle:(NSString *)title message:(NSString *)message btnTitleArray:(NSArray *)array callback:(void (^)(NSInteger))callback{
    if (IOS9) {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        for (NSInteger i=0; i<[array count]; i++) {
            UIAlertAction *action = [UIAlertAction actionWithTitle:array[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (callback) {
                    callback(i);
                }
            }];
            [alertVC addAction:action];
        }
        [self presentViewController:alertVC animated:YES completion:nil];
    }else{
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_9_0
        self.callbackBlock = callback;
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
        for (NSString *buttonTitle in array) {
            [alertView addButtonWithTitle:buttonTitle];
        }
        alertView.delegate = self;
        [alertView show];
#endif
    }
    
}

#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_9_0
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (self.callbackBlock) {
        self.callbackBlock(buttonIndex);
    }
}
#endif

@end

#pragma mark - show ProgressHud
@implementation STBaseViewController (ProgressHud)

/**
 *  在当前页面中间显示loading图标
 */
- (void)showProgressHud {
    [self showProgressHud:NO];
}

/**
 *  在当前页面中间显示loading图标
 *
 *  @param lockScreen 是否锁屏
 */
- (void)showProgressHud:(BOOL)lockScreen {
    [self showProgressHud:nil lockScreen:lockScreen];
}

/**
 *  在当前页面中间显示loading图标
 *
 *  @param message    显示的文本
 *  @param lockScreen 是否锁屏
 */
- (void)showProgressHud:(nullable NSString *)message lockScreen:(BOOL)lockScreen {
    [self showProgressHud:message lockScreen:lockScreen autoDismiss:NO];
}

/**
 *  在当前页面中间显示loading图标
 *
 *  @param lockScreen  是否锁屏
 *  @param timeDelta   是否自动隐藏，以秒为单位，为0时不自动隐藏
 */
- (void)showProgressHud:(nullable NSString *)message
             lockScreen:(BOOL)lockScreen
            autoDismiss:(NSTimeInterval)timeDelta {
    [self hideProgreddHudPrivate];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    // 需要显示提示语
    if (message) {
        hud.mode = MBProgressHUDModeText;
        //        [hud setDetailsLabelText:message];
    } else {
        [hud setMode:MBProgressHUDModeIndeterminate];
    }
    
    // 锁屏
    if (lockScreen) {
        self.navigationController.navigationBar.userInteractionEnabled = NO;
        self.tabBarController.tabBar.userInteractionEnabled = NO;
    }
    
    // 自动隐藏
    if (timeDelta > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeDelta * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self hideProgreddHud];
        });
    }
}

/**
 *  隐藏loading图标
 */
- (void)hideProgreddHud {
    [self hideProgreddHudPrivate];
}

/**
 *  vc内部调用的隐藏loading方法
 */
- (void)hideProgreddHudPrivate {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    self.navigationController.navigationBar.userInteractionEnabled = YES;
    self.tabBarController.tabBar.userInteractionEnabled = YES;
}


- (void)hideCustomProgressHud{
    [self hideProgreddHud];
}

@end
