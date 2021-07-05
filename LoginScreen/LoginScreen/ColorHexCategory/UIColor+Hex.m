#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (instancetype)colorFromHex:(unsigned)rgbValue {
    
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                           green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
                            blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
                           alpha:1.0];
}

+ (instancetype)blackCoral {
    return [self colorFromHex:0x4C5C68];
    
}

+ (instancetype)turquoiseGreen {
    return [self colorFromHex:0x91C7B1];
    
}

+ (instancetype)venetianRed {
    return [self colorFromHex:0xC20114];
    
}

+ (instancetype)littleBoyBlue {
    return [self colorFromHex:0x80A4ED];
    
}


@end
