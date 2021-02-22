#import "WillpopAdmobPlugin.h"
#if __has_include(<willpop_admob/willpop_admob-Swift.h>)
#import <willpop_admob/willpop_admob-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "willpop_admob-Swift.h"
#endif

@implementation WillpopAdmobPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftWillpopAdmobPlugin registerWithRegistrar:registrar];
}
@end
