//
//  ST_VM_Test.m
//  STSDK
//
//  Created by Tommy-mac on 2019/12/31.
//

#import "ST_VM_Test.h"

@implementation ST_VM_Test

- (void)requsetTest {
    if (!self.loading) {
        self.loading = YES;
        /*
        NSString *url = [NSString stringWithFormat:@"%@%@%@", @"https://api-int.gdcard888.com", @"/v1", @"/member/checkVersion"];
        NSLog(@"url=%@",url);
        */
        STBaseRequestModel *model = [[STBaseRequestModel alloc] init];
        model.apiName = @"member";
        model.apiLocation = @"checkVersion";
        /*
        //APP 版次
        @property (nonatomic, strong) NSString *app_ver;
        //裝置型號
        @property (nonatomic, strong) NSString *device_model;
        //裝置Token
        @property (nonatomic, strong) NSString *device_token;
        //裝置類型(0:ios,1:android)
        @property (nonatomic) NSInteger device_type;
        //會員編號
        @property (nonatomic, strong) NSString *member_id;
        //OS 版本
        @property (nonatomic, strong) NSString *os_ver;
        */
//        model.requstData = @{}.mutableCopy;
        model.requstData = @{
                             @"app_ver" : @"1.0.0",
                             @"device_type" : [NSNumber numberWithInt:0]
                             };
        [self.requestManager requestWithRequestModel:model requestType:PostType];
        
        /*
        NSMutableDictionary *dict = @{}.mutableCopy;
        NSString *location = nil;
        NSString *apiName = ApiClaims;
        
        location = AddClaimCar;
        CKIClaimSupplyModel_Car *model = [[CKIClaimSupplyModel_Car alloc] init];
        model.carNumber = self.licenseItem.text;
        //    model.carName = @"";
        model.carName = self.title3.text;
        //    CKILog(@"model.carName=%@",model.carName);
        //    model.dNumber = @"1234567"; //身份證
        //    model.optionsHandle = @1;//處理情形
        //    model.carBirthday = @""; //出生年月
        //    model.optionsRelation = @1; //關係
        model.carPhone = self.telItem.text;
        model.carEmail = self.emailItem.text?self.emailItem.text:@"";
        //    model.carTel = self.contactTelItem.text;//電話
        NSString *time = [self.timeItem.text substringFromIndex:[self.timeItem.text length]-2];
        NSString *other = [self.timeItem.text substringToIndex:[self.timeItem.text length]-3];
        model.carAccidentDate = [NSString stringWithFormat:@"%@ %@:00",other,time];
        model.carLocation = self.addressItem.text;
        for (NSInteger i =0; i<self.reasonItem.causeModels.count; i++) {
            CKICauseModel *causeModel = self.reasonItem.causeModels[i];
            NSInteger index = i+1;
            NSNumber *carReason = causeModel.selelcted?@(true):@(false);
            switch (index) {
                case 1:
                    model.carReason1 = carReason;
                    break;
                case 2:
                    model.carReason2 = carReason;
                    break;
                case 3:
                    model.carReason3 = carReason;
                    break;
                case 4:
                    model.carReason4 = carReason;
                    break;
                case 5:
                    model.carReason5 = carReason;
                    break;
                case 6:
                    model.carReason6 = carReason;
                    break;
                case 7:
                    model.carReason7 = carReason;
                    break;
                default:
                    break;
            }
        }
        NSMutableArray *images = @[].mutableCopy;
        for (CKIAccidentPicModel *picModel in self.accidetnItem.images) {
            NSString *base65Image = [picModel.imageData base64EncodedStringWithOptions:0];
            //        [images addObject:base65Image];
            [images addObject:@{@"Image":base65Image}];
        }
        for (CKIAccidentPicModel *picModel in self.mineItem.images) {
            NSString *base65Image = [picModel.imageData base64EncodedStringWithOptions:0];
            //        [images addObject:base65Image];
            [images addObject:@{@"Image":base65Image}];
        }
        for (CKIAccidentPicModel *picModel in self.otherItem.images) {
            NSString *base65Image = [picModel.imageData base64EncodedStringWithOptions:0];
            //        [images addObject:base65Image];
            [images addObject:@{@"Image":base65Image}];
        }
        for (CKIAccidentPicModel *picModel in self.aboutItem.images) {
            NSString *base65Image = [picModel.imageData base64EncodedStringWithOptions:0];
            [images addObject:@{@"Image":base65Image}];
        }
        NSDictionary *imageDict = @{@"ClaimsImage":images};
        model.ClaimsImage = [NSString convertToJSONString:imageDict withEscapeCharacters:NO];
        NSDictionary *modelDict = [model yy_modelToJSONObject];
        [dict addEntriesFromDictionary:modelDict];
        
        BaseRequestModel *requestModel = [[BaseRequestModel alloc] init];
        requestModel.Location = location;
        requestModel.apiName = apiName;
        requestModel.requstData = dict;
        [self.requestManager requestWithRequestModel:requestModel requestType:PostType];
        */
    }
}
@end
