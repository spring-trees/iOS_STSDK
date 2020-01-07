//
//  STHeader.h
//  STSDK
//
//  Created by Tommy-mac on 2019/12/31.
//

#ifndef STHeader_h
#define STHeader_h


//cocoapod
#import <AFNetworking/AFNetworking.h>
#import <JSONModel/JSONModel.h>
#import <SDWebImage/SDWebImage.h>
#import <Masonry/Masonry.h>
#import <MJRefresh/MJRefresh.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <YYModel/YYModel.h>

//cate
//#import "UIView+Extension.h"

//custom
#import "PPSPublic1.h"

#define IOS8 ([[UIDevice currentDevice].systemVersion intValue] >= 8 ? YES : NO)
#define IOS9 ([[UIDevice currentDevice].systemVersion intValue] >= 9 ? YES : NO)
#define IOS10 ([[UIDevice currentDevice].systemVersion intValue] >= 10 ? YES : NO)

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#pragma mark - Color

#define ZXColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define ZXColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#ifndef __OPTIMIZE__
#define STLog(FORMAT,...)   NSLog(@"%s [Line %d] %@", __func__, __LINE__, [NSString stringWithFormat:FORMAT, ##__VA_ARGS__])
#else
#define STLog(...) {}
#endif



#endif /* STHeader_h */
