//
//  AssistTool.m
//  Matches
//
//  Created by sun on 16/7/4.
//  Copyright © 2016年 sun. All rights reserved.
//

#define URL @"http://api-v2.mall.hichao.com/star/list?category=%E8%BD%BB%E7%86%9F&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=ECC2B810-D18C-4BCE-84B8-688CE56E5399&gs=1536x2048&gos=9.3.2&access_token="

#import "AssistTool.h"


@implementation AssistTool

+ (NSMutableAttributedString *)setTextWithString:(NSString *)str withColor:(UIColor *)color withFont:(float)font withFontRange:(NSRange)range{
    
    NSMutableAttributedString   *attributeString = [[NSMutableAttributedString alloc]initWithString:str];
    [attributeString addAttribute:NSForegroundColorAttributeName value:color range:range];
    [attributeString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:range];
    
    return attributeString;
}

+ (NSDictionary *)getClassifyData {
    
    
    NSMutableArray *arr1 = @[@"最新",@"热门",@"本土",@"清新",@"欧美",@"型男",@"日韩",@"轻熟",@"复古",@"OL",@"混搭",@"甜美",@"街头",@"闺蜜",@"休闲",@"摩登",@"逛街",@"约会",@"派对",@"运动",@"出游",@"典礼",@"高挑",@"娇小",@"丰满",@"优选"].mutableCopy;
    
    
    
    NSMutableArray  *arr = @[@"http://api-v2.mall.hichao.com/star/list?category=%E5%85%A8%E9%83%A8&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=ECC2B810-D18C-4BCE-84B8-688CE56E5399&gs=1536x2048&gos=9.3.1&access_token=",@"http://api-v2.mall.hichao.com/star/list?category=%E7%83%AD%E9%97%A8&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=ECC2B810-D18C-4BCE-84B8-688CE56E5399&gs=1536x2048&gos=9.3.1&access_token=",@"http://api-v2.mall.hichao.com/star/list?category=%E6%9C%AC%E5%9C%9F&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=ECC2B810-D18C-4BCE-84B8-688CE56E5399&gs=1536x2048&gos=9.3.1&access_token=",@"http://api-v2.mall.hichao.com/star/list?category=%E6%B8%85%E6%96%B0&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=ECC2B810-D18C-4BCE-84B8-688CE56E5399&gs=1536x2048&gos=9.3.2&access_token=",@"http://api-v2.mall.hichao.com/star/list?category=%E6%AC%A7%E7%BE%8E&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=ECC2B810-D18C-4BCE-84B8-688CE56E5399&gs=1536x2048&gos=9.3.1&access_token=",@"http://api-v2.mall.hichao.com/star/list?category=%E5%9E%8B%E7%94%B7&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=ECC2B810-D18C-4BCE-84B8-688CE56E5399&gs=1536x2048&gos=9.3.1&access_token=",@"http://api-v2.mall.hichao.com/star/list?category=%E6%97%A5%E9%9F%A9&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=ECC2B810-D18C-4BCE-84B8-688CE56E5399&gs=1536x2048&gos=9.3.1&access_token=",@"http://api-v2.mall.hichao.com/star/list?category=%E8%BD%BB%E7%86%9F&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=ECC2B810-D18C-4BCE-84B8-688CE56E5399&gs=1536x2048&gos=9.3.2&access_token=",URL,URL,URL,URL,URL,URL,URL,URL,URL,URL,URL,URL,URL,URL,URL,URL,URL,URL].mutableCopy;
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:arr forKeys:arr1];
    
    return dic;
}



@end
