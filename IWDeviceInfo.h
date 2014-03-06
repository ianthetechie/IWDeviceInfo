//
//  IWDeviceInfo.h
//  IWDeviceInfo
//
//  Created by Ian Wagner on 3/5/14.
//

#import <Foundation/Foundation.h>

// Enumeration of known version numbers that make sense to target.
// Enumeration values are guaranteed to be comparable via standard operators.
typedef enum {
    kMajorVersionUnknown = 0,
    kMajorVersion4 = 4,
    kMajorVersion5 = 5,
    kMajorVersion6 = 6,
    kMajorVersion7 = 7
} MajorOSVersion;

@interface IWDeviceInfo : NSObject

+ (BOOL)isIpad;
+ (BOOL)isIphone;
+ (BOOL)isRetina;
+ (BOOL)is3_5Inch;
+ (BOOL)is4Inch;
+ (MajorOSVersion)majorOSVersion;

@end
