//
//  STCommon.h
//  STSDK
//
//  Created by Tommy-mac on 2019/12/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface STCommon : NSObject
+ (void)commonTest;
+ (NSBundle*)getBundle;
+ (UIImage*)imageNamed:(NSString*)imageName;
+ (NSString*)locatingStr:(NSString*)lagStr;
@end

NS_ASSUME_NONNULL_END
