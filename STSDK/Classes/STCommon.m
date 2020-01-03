//
//  STCommon.m
//  STSDK
//
//  Created by Tommy-mac on 2019/12/31.
//

#import "STCommon.h"

@implementation STCommon

+ (void)commonTest {
//    NSLog(@"commonTest");
}

+ (NSBundle*)getBundle {
    
    NSString *bundlePath = [[NSBundle bundleForClass:[self class]].resourcePath
                            stringByAppendingPathComponent:@"/STSDK.bundle"];
    NSBundle *resource_bundle = [NSBundle bundleWithPath:bundlePath];
    
    return resource_bundle;
}

+ (UIImage*)imageNamed:(NSString*)imageName {
    
    NSString *bundlePath = [[NSBundle bundleForClass:[self class]].resourcePath
                            stringByAppendingPathComponent:@"/STSDK.bundle"];
    NSBundle *resource_bundle = [NSBundle bundleWithPath:bundlePath];
    
    UIImage *image = [UIImage imageNamed:imageName inBundle:resource_bundle compatibleWithTraitCollection:nil];
//    NSLog(@"image=%@",image);
    return image;
}

+ (NSString*)locatingStr:(NSString*)lagStr {
    
    NSString *bundlePath = [[NSBundle bundleForClass:[self class]].resourcePath
                            stringByAppendingPathComponent:@"/STSDK-Localizations.bundle"];
    
    NSBundle *resource_bundle = [NSBundle bundleWithPath:bundlePath];
//    NSLog(@"resource_bundle=%@",resource_bundle);
    NSString *loc = NSLocalizedStringFromTableInBundle(lagStr, @"STLocalizable", resource_bundle, nil);
//    NSLog(@"loc=%@",loc);
    return loc;
}


@end
