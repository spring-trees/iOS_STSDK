//
//  STBaseResponseModel.h
//  STSDK
//
//  Created by Tommy-mac on 2019/12/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface STBaseResponseModel : NSObject

//1.正确对应的code
@property (nonatomic, strong) NSNumber *errorCode;

@property (nonatomic, strong) id  data;
//错误具体原因
@property (nonatomic, strong) NSString  *errorMsg;

/*
"errorMsg" : "Params Spec Error: Required Params 'app_ver' is missing. Raw Data: {}",
"data" : null,
"errorCode" : 4000
*/
@end

NS_ASSUME_NONNULL_END
