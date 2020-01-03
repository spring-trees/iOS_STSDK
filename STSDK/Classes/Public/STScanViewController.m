//
//  STScanViewController.m
//  STSDK
//
//  Created by Tommy-mac on 2019/12/31.
//

#import "STScanViewController.h"
#import "ST_VM_Test.h"
#import "STScanView.h"

@interface STScanViewController ()
@property (nonatomic, strong) ST_VM_Test *viewModel;
@end

@implementation STScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    STScanView *scanView = [[STScanView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scanView];
    
    UIButton *tempButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tempButton.frame = CGRectMake(0, 100, self.view.frame.size.width, 100);
    tempButton.backgroundColor = [UIColor blueColor];
    [tempButton setTitle:@"api version" forState:UIControlStateNormal];
    [tempButton addTarget:self action:@selector(testAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tempButton];
    
//    [STCommon commonTest];
    
}

- (void)testAction:(id)sender {
    NSLog(@"testAction");
    
    [self showProgressHud];
    [self.viewModel requsetTest];
    
}

#pragma mark --STBaseViewModelDelegate---
- (void)requestFailed:(STBaseRequestModel *)model errorMsg:(NSString *)errorMsg{
    
    [super requestFailed:model errorMsg:errorMsg];
    /*
    [self showWithTitle:nil message:errorMsg btnTitleArray:@[@"確定",@"1",@"2",@"3"] callback:^(NSInteger index) {
        STLog(@"index=%ld",(long)index);
    }];
     */
    [self hideProgreddHud];
    self.viewModel.loading = NO;
}

- (void)requestSuccess:(STBaseRequestModel *)model dataDict:(id)dataDict{
//    STLog(@"model=%@",[model yy_modelToJSONObject]);
    
    [super requestSuccess:model dataDict:dataDict];
//    [self hideProgreddHud];
    
    STLog(@"dataDict=%@",dataDict);
    /*
     NSString *urlStr = [dataDict objectForKey:@"url"];
     STLog(@"urlStr=%@",urlStr);
     NSDictionary *dic = @{
     @"ownerID" : [self.viewModel.ownerID.text uppercaseString],
     @"carID" : [self.viewModel.carID.text uppercaseString],
     @"url": urlStr
     };
     STLog(@"dic=%@",dic);
     */
    /*
     NSInteger targeIndex = 0;
     BOOL isHave = NO;
     for (NSInteger i=0 ; i<buttons.count ; i++)
     {
     NSDictionary *tempDic = [buttons objectAtIndex:i];
     STLog(@"tempDic=%@",tempDic);
     NSString *carid = [tempDic objectForKey:@"carID"];
     if ([carid isEqualToString:[dic objectForKey:@"carID"]])
     {
     isHave = YES;
     targeIndex = i;
     }
     }
     
     if (isHave)
     {
     [buttons removeObjectAtIndex:targeIndex];
     }
     [buttons addObject:dic];
     NSString *fileStr = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:PortalPlist];
     [buttons writeToFile:fileStr atomically:YES];
     self.viewModel.buttons = buttons;
     [self.tableView reloadData];
     [self.viewModel performSelector:@selector(resettingDefult) withObject:nil afterDelay:0.1f];
     */
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
