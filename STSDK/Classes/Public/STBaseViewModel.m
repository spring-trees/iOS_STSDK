//
//  STBaseViewModel.m
//  STSDK
//
//  Created by Tommy-mac on 2019/12/31.
//

#import "STBaseViewModel.h"

@implementation STBaseViewModel

#pragma mark --CKIRequestManagerDelegate--
- (void)requestFinished:(STBaseRequestModel *)input output:(id)output error:(NSString *)errorMessage{
    if (errorMessage) {
        if ([self.delegate respondsToSelector:@selector(requestFailed:errorMsg:)]) {
            [self.delegate requestFailed:input errorMsg:errorMessage];
        }
        
    } else {
        if ([self.delegate respondsToSelector:@selector(requestSuccess:dataDict:)]) {
            [self.delegate requestSuccess:input dataDict:output];
        }
    }
}

- (void)requestNeedLogin:(STBaseRequestModel *)inputModel{
    
}


- (STRequestManager *)requestManager {
    if (!_requestManager) {
        _requestManager = [[STRequestManager alloc] init];
        _requestManager.delegate = self;
    }
    
    return _requestManager;
}

@end
