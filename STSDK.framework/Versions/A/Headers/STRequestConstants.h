//
//  STRequestConstants.h
//  STSDK
//
//  Created by Tommy-mac on 2019/12/31.
//

#ifndef STRequestConstants_h
#define STRequestConstants_h

#pragma mark - API

//UAT           kUAT為1不理會kDebugTest的值通常給PM測試
//Apple Store   為kUat跟kDebugTest都為0
//Dev           為kUat=0跟kDebugTest=1
#define kUat 0
#define kDebugTest 1
#define kTommy 0

#define kApiAuthorizationKey @"X2ZyaWVuZG9fbWVtYmVyX2NhcmRf"
#define kBaseOAuthorization (kDebugTest ? @"Basic ZWY4OTliNDk3ZmE1NjM1NzNjMDYyMzRhYmE2ZDc3MDY6ZmI0M2IwZDA4MDc0YjNjN2IxYjU0MWVlYjliMzQxMWY=" : @"Basic ZWY4OTliNDk3ZmE1NjM1NzNjMDYyMzRhYmE2ZDc3MDY6ZmI0M2IwZDA4MDc0YjNjN2IxYjU0MWVlYjliMzQxMWY=")

#define kApiVersion @"/v1"

#define kBaseURL (kUat ? @"https://monsterapi-uat.qscan.me" : (kDebugTest ? @"https://api-int.gdcard888.com" : @"https://monsterapi.qscan.me"))
#define kOauthURL (kUat ? @"https://monsteroauth.qscan.me" : (kDebugTest ? @"https://oauth-int.gdcard888.com" : @"https://monsteroauth.qscan.me"))
#define kT2URL (kUat ? @"https://monsterapi-tp-uat.qscan.me" : (kDebugTest ? @"https://tp.api-int.gdcard888.com" : @"https://monsterapi-tp.qscan.me"))

#define kOauthToken @"/token"
#define kOauthInfo @"/info"

#endif /* STRequestConstants_h */
