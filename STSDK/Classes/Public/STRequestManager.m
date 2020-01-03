//
//  STRequestManager.m
//  STSDK
//
//  Created by Tommy-mac on 2019/12/31.
//

#import "STRequestManager.h"
#import "STHeader.h"
#import "STNetWorkManager.h"
#import "STRequestConstants.h"
#import "STBaseResponseModel.h"
//#import "YYModel.h"

@implementation STRequestManager

- (BOOL)requestWithRequestModel:(STBaseRequestModel *)requestModel requestType:(RequestType)type{
    
    NSDictionary *dict = [NSDictionary dictionaryWithDictionary:requestModel.requstData];
    
    if (type == PostType || type == GetType) {
        /*
        if (!requestModel.apiName || !requestModel.apiLocation) {
            return NO;
        }
         */
        NSString *url = [NSString stringWithFormat:@"%@/%@/%@/%@",kBaseURL,requestModel.apiVersion,requestModel.apiName,requestModel.apiLocation];
//        NSLog(@"url=%@",url);
        if (type == PostType) {
            [[STNetWorkManager sharedInstance] POSTUrl:url parameters:dict success:^(id responseObject) {
                /*
                STBaseResponseModel *responseModel = [STBaseResponseModel yy_modelWithJSON:responseObject];
                if ([responseModel.errorCode isEqual:@2000] ) {
                    [self.delegate requestFinished:requestModel output:responseModel.data error:nil];
                }else{
                    [self.delegate requestFinished:requestModel output:nil error:responseModel.errorMsg];
                }
                */
            } failure:^(NSError *error) {
                [self.delegate requestFinished:requestModel output:nil error:[error localizedDescription]];
            }];
            return YES;
        }
        
        if (type == GetType) {
            [[STNetWorkManager sharedInstance] GETUrl:url parameters:dict success:^(id responseObject) {
                /*
                STBaseResponseModel *responseModel = [STBaseResponseModel yy_modelWithJSON:responseObject];
                if ([responseModel.errorCode isEqual:@2000] ) {
                    [self.delegate requestFinished:requestModel output:responseModel.data error:nil];
                }else{
                    [self.delegate requestFinished:requestModel output:nil error:responseModel.errorMsg];
                }
                */
            } failure:^(NSError *error) {
                
                [self.delegate requestFinished:requestModel output:nil error:[error localizedDescription]];
                
            }];
            return YES;
        }
    }
    return NO;
}
@end
