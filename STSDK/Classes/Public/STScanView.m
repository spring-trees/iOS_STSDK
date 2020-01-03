//
//  STScanView.m
//  STSDK
//
//  Created by Tommy-mac on 2019/12/31.
//

#import "STScanView.h"
#import "Masonry.h"
//#import "UIView+Extension.h"
#import "STCommon.h"
#import <Lottie/Lottie.h>
//@import Lottie;

@interface STScanView ()
@property (nonatomic, strong) LOTAnimationView *lottieLogo;
@end

@implementation STScanView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self createUI];
        [STCommon commonTest];
    }
    return self;
}

- (void)createUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    CGFloat tempW = self.frame.size.height;
    CGFloat tempH = self.frame.size.height;
    
    [self addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.mas_equalTo(tempW);
        make.height.mas_equalTo(tempH);
    }];
    
    [self addSubview:self.loadingLabel];
    [self.loadingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top).with.offset(405);
        make.center.equalTo(self);
        make.width.mas_equalTo(self.frame.size.width);
        make.height.mas_equalTo(60);
    }];
    
    [self addSubview:self.lottieLogo];
    [self.lottieLogo play];
    
    [self.lottieLogo mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self);
        make.top.equalTo(self.loadingLabel.mas_bottom);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(200);
    }];
    
}

#pragma mark - Property

- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [UIImageView new];
//        _bgImageView.image = image;
        _bgImageView.image = [STCommon imageNamed:@"launch_screen"];
//        _bgImageView.image = [STCommon imageNamed:@"some-image"];
//        _bgImageView.image = [STCommon imageNamed:@"emoji_qmon"];
        _bgImageView.contentMode = UIViewContentModeScaleAspectFit;
        _bgImageView.backgroundColor = [UIColor redColor];
    }
    return _bgImageView;
}

- (UILabel*)loadingLabel {
    if (!_loadingLabel) {
        _loadingLabel = [UILabel new];
        _loadingLabel.font = [UIFont boldSystemFontOfSize:40.f];
        _loadingLabel.backgroundColor = [UIColor blackColor];
//        _loadingLabel.text = @"我要預測";
//        _loadingLabel.text = NSLocalizedString(@"VersionLag", "語系");
//        _loadingLabel.text = [STCommon locatingStr:@"AppName"];
        _loadingLabel.text = [STCommon locatingStr:@"VersionLag"];
//        locatingStr
        _loadingLabel.textColor = [UIColor whiteColor];
        _loadingLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _loadingLabel;
}

- (LOTAnimationView*)lottieLogo {
    if (!_lottieLogo) {
        NSString *urlStr = @"https://d6dzb6iytrcde.cloudfront.net/monster-json/body/01_qmon/stage1/def01.json";
        NSURL *url = [NSURL URLWithString:urlStr];
        _lottieLogo = [[LOTAnimationView alloc] initWithContentsOfURL:url];
        _lottieLogo.backgroundColor = [UIColor blueColor];
        _lottieLogo.contentMode = UIViewContentModeScaleAspectFit;
        _lottieLogo.loopAnimation = YES;
    }
    return _lottieLogo;
}

@end
