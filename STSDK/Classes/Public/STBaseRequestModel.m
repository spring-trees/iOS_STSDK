//
//  STBaseRequestModel.m
//  STSDK
//
//  Created by Tommy-mac on 2019/12/31.
//

#import "STBaseRequestModel.h"

@implementation STBaseRequestModel

- (id)init
{
    if (self = [super init]) {
//        self.apiLanguage = @"tw";
        [self getApiLanguage];
        self.apiVersion = @"v1";
    }
    return self;
}

- (void)getApiLanguage
{
    /*
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.member_id = [defaults objectForKey:@"member_id"];
    NSLog(@"self.member_id=%@",self.member_id);
    if (self.member_id == nil)
    {
        self.member_id = @"";
    }
    */
    self.apiLanguage = @"en";
}

@end
