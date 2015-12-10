#include <Foundation/NSObject.h>
#include <CydiaSubstrate/CydiaSubstrate.h>

MSHookInterface(DrmManager, NMAAntiJailbreakDrmManager, NSObject)

@implementation NMAAntiJailbreakDrmManager

- (BOOL)deviceIsJailbroken {
    return NO;
}

@end
