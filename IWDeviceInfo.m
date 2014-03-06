//
//  IWDeviceInfo.m
//  IWDeviceInfo
//
//  Created by Ian Wagner on 3/5/14.
//

#import <UIKit/UIKit.h>
#import "IWDeviceInfo.h"

typedef struct {
    BOOL initialized;
    BOOL value;
} BoolData;

static BoolData _isIpad;
static BoolData _isRetina;
static BoolData _is3_5Inch;
static BoolData _is4Inch;
static MajorOSVersion _majorOSVersion;

@implementation IWDeviceInfo

+ (BOOL)isIpad
{
    if (!_isIpad.initialized) {
        _isIpad.value = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
        _isIpad.initialized = YES;
    }
    
    return _isIpad.value;
}

+ (BOOL)isIphone
{
    return ![IWDeviceInfo isIpad];
}

+ (BOOL)isRetina
{
    if (!_isRetina.initialized) {
        _isRetina.value = [UIScreen mainScreen].scale == 2.0;
        _isRetina.initialized = YES;
    }

    return _isRetina.value;
}

+ (BOOL)is3_5Inch
{
    if (!_is3_5Inch.initialized) {
        _is3_5Inch.value = [[UIScreen mainScreen] bounds].size.height == 480;
        _is3_5Inch.initialized = YES;
    }

    return _is3_5Inch.value;
}

+ (BOOL)is4Inch
{
    if (!_is4Inch.initialized) {
        _is4Inch.value = [[UIScreen mainScreen] bounds].size.height == 568;
        _is4Inch.initialized = YES;
    }

    return _is4Inch.value;
}

+ (MajorOSVersion)majorOSVersion
{
    if (!_majorOSVersion) {
        if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] != NSOrderedAscending) {
            _majorOSVersion = kMajorVersion7;
        }
        else if ([[[UIDevice currentDevice] systemVersion] compare:@"6.0" options:NSNumericSearch] != NSOrderedAscending) {
            _majorOSVersion = kMajorVersion6;
        }
        else if ([[[UIDevice currentDevice] systemVersion] compare:@"5.0" options:NSNumericSearch] != NSOrderedAscending) {
            _majorOSVersion = kMajorVersion5;
        }
        else if ([[[UIDevice currentDevice] systemVersion] compare:@"4.0" options:NSNumericSearch] != NSOrderedAscending) {
            _majorOSVersion = kMajorVersion4;
        }
    }

    return _majorOSVersion;
}

@end
