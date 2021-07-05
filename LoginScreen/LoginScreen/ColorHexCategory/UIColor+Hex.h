#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Hex)

+ (UIColor *)colorFromHex:(unsigned)rgbValue;

+ (instancetype)blackCoral;
+ (instancetype)turquoiseGreen;
+ (instancetype)venetianRed;
+ (instancetype)littleBoyBlue;

@end

NS_ASSUME_NONNULL_END
