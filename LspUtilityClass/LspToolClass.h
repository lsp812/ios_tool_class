//
//  LspToolClass.h
//  LspUtilityClass
//
//  Created by 大麦 on 15/12/1.
//  Copyright (c) 2015年 lsp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LspToolClass : NSObject

#pragma mark -- 使用16进制的色值获得color
+ (UIColor*)colorWithHexString:(NSString *)stringToConvert;
#pragma mark -- 屏幕分辨率
+(NSString *)getScreen;


#pragma mark -- 高度自适应(根据固定的宽度，字体，文字来计算)
+(CGFloat)getHeightWithWidth:(CGFloat)contentWidth andfont:(UIFont *)contentFont andText:(NSString *)contentString;
#pragma mark -- 宽度自适应(根据固定的高度，字体，文字来计算)
+(CGFloat)getWidthWithHeight:(CGFloat)contentHeight andfont:(UIFont *)contentFont andText:(NSString *)contentString;


#pragma mark -- 字符串转字典
+(NSDictionary *)dictionaryFromJsonString:(NSString *)jsonString;
#pragma mark -- 字典转字符串
+(NSString *)jsonStringFromDictionary:(NSDictionary *)dictionary;


#pragma mark -- 一行字符串有2种及以上的颜色
+(NSMutableAttributedString *)oneWordWithString:(NSMutableArray *)stringArray andColor:(NSMutableArray *)colorArray;


#pragma mark -- 正则表达式(判断规则:只包含数字不判断位数)
+(BOOL)regularOnlyNumberExpressionsWithString:(NSString *)string;
#pragma mark -- 正则表达式(判断规则:8位(只包含数字和字母))
+(BOOL)regularExpressionsWithString:(NSString *)string;



@end
