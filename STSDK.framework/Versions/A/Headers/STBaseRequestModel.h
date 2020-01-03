//
//  STBaseRequestModel.h
//  STSDK
//
//  Created by Tommy-mac on 2019/12/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface STBaseRequestModel : NSObject

@property (nonatomic, strong) NSString *apiLanguage;
@property (nonatomic, strong) NSString *apiVersion;
@property (nonatomic, strong) NSString *apiName;
@property (nonatomic, strong) NSString *apiLocation;
@property (nonatomic, strong) NSDictionary *requstData;

@end

NS_ASSUME_NONNULL_END
