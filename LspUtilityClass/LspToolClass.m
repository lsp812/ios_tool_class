//
//  LspToolClass.m
//  LspUtilityClass
//
//  Created by 大麦 on 15/12/1.
//  Copyright (c) 2015年 lsp. All rights reserved.
//

#import "LspToolClass.h"

@implementation LspToolClass

#pragma mark - 十六进制颜色
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor blackColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] < 6) return [UIColor blackColor];
    // Separate into r, g, b substrings
    NSRange range;
    if ([cString length] > 6) {
        range.location = 2;
    }else {
        range.location = 0;
    }
    
    
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location += 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location += 2;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b ;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}
#pragma mark -- 屏幕分辨率
+(NSString *)getScreen
{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    
    NSString *screen = [NSString stringWithFormat:@"%.f*%.f",width*scale_screen,height*scale_screen];
    return screen;
}



#pragma mark -- 高度自适应(根据固定的宽度，字体，文字来计算)
+(CGFloat)getHeightWithWidth:(CGFloat)contentWidth andfont:(UIFont *)contentFont andText:(NSString *)contentString
{
    float contentLabelHEIGHT = 0;
    NSDictionary *attribute = @{NSFontAttributeName:contentFont};
    CGSize size = [contentString boundingRectWithSize:CGSizeMake(contentWidth, 10000) options: NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    contentLabelHEIGHT = size.height;
    return contentLabelHEIGHT;
}
#pragma mark -- 宽度自适应(根据固定的高度，字体，文字来计算)
+(CGFloat)getWidthWithHeight:(CGFloat)contentHeight andfont:(UIFont *)contentFont andText:(NSString *)contentString
{
    float contentLabelWidth = 0;
    NSDictionary *attribute = @{NSFontAttributeName:contentFont};
    CGSize size = [contentString boundingRectWithSize:CGSizeMake(10000, contentHeight) options:  NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attribute context:nil].size;
    contentLabelWidth = size.width;

    return contentLabelWidth;
}
#pragma mark -- 字符串转字典
+(NSDictionary *)dictionaryFromJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        return nil;
    }
    return dic;
}
#pragma mark -- 字典转字符串(此处注意)
+(NSString *)jsonStringFromDictionary:(NSDictionary *)dictionary
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString *string = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    return string;
    
}
#pragma mark -- 一行字符串有2种及以上的颜色
+(NSMutableAttributedString *)oneWordWithString:(NSMutableArray *)stringArray andColor:(NSMutableArray *)colorArray
{
    NSString *stringContent = @"";
    for(int i=0;i<[stringArray count];i++)
    {
        stringContent = [stringContent stringByAppendingString:[stringArray objectAtIndex:i]];
    }
    //
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:stringContent];
    int currentLength = 0;
    int totalLength = 0;
    for(int j=0;j<[stringArray count];j++)
    {
        currentLength = [[stringArray objectAtIndex:j] length];
        //
        [str addAttribute:NSForegroundColorAttributeName value:[colorArray objectAtIndex:j] range:NSMakeRange(totalLength,currentLength)];
        //
        totalLength = totalLength +currentLength;
    }
    return str;
}
#pragma mark -- 正则表达式(判断规则:只包含数字不判断位数)
+(BOOL)regularOnlyNumberExpressionsWithString:(NSString *)string
{
    NSString * regex = @"^[0-9]*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:string];
}
#pragma mark -- 正则表达式(判断规则:8位(只包含数字和字母))
+(BOOL)regularExpressionsWithString:(NSString *)string
{
    NSString * regex = @"^[A-Za-z0-9]{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:string];
}



@end
