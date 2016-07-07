//
//  XRequestTool.m
//  StarWardrobe
//
//  Created by Mac on 16/7/6.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import "XRequestTool.h"
#import "XShowComModel.h"
#import "BoutiqueDataModel.h"
#import "TopSVModel.h"

@interface XRequestTool ()

@end


@implementation XRequestTool



+(void)requestShowCVChangeDataWithTag:(NSInteger)index returnData:(DataBlock)dataBlock;
{
    
    NSArray *httpArr =@[@"http://api-v2.mall.hichao.com/sku/list?more_items=1&type=selection&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CBD795AD-1BFC-40FE-A351-407FEAC7219D&gs=640x1136&gos=8.4.1&access_token=",@"http://api-v2.mall.hichao.com/sku/list?more_items=1&type=selection&flag=&category_ids=38,33,34&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CBD795AD-1BFC-40FE-A351-407FEAC7219D&gs=640x1136&gos=8.4.1&access_token=",@"http://api-v2.mall.hichao.com/sku/list?more_items=1&type=selection&flag=&category_ids=39,40&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CBD795AD-1BFC-40FE-A351-407FEAC7219D&gs=640x1136&gos=8.4.1&access_token=",@"http://api-v2.mall.hichao.com/sku/list?more_items=1&type=selection&flag=&category_ids=49,45,48,46,44&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CBD795AD-1BFC-40FE-A351-407FEAC7219D&gs=640x1136&gos=8.4.1&access_token="];
    
    [NetRequestClass netRequestGETWithRequestURL:httpArr[index] WithParameter:nil WithReturnValeuBlock:^(id responseObject, NSError *error) {
        
        if (responseObject) {
            NSMutableArray * array = @[].mutableCopy;
            
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *dataDic =dic[@"data"];
            
            NSArray * itemsArray =dataDic[@"items"];
            
            for (NSDictionary * itemDic in itemsArray) {
                
                NSDictionary * componetDic = itemDic[@"component"];
                
                
                XShowComModel * model = [[XShowComModel alloc]initWithDataDic:componetDic];
                
                [array addObject:model];
            }

            if (dataBlock) {
                dataBlock(array);
            }
        }
    }];
}

+(void)requestPosterData:(DataBlock)dataBlock
{
    
    [NetRequestClass netRequestPOSTWithRequestURL:@"http://api-v2.mall.hichao.com/active/flash/list?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CBD795AD-1BFC-40FE-A351-407FEAC7219D&gs=640x1136&gos=8.4.1&access_token=" WithParameter:nil WithReturnValeuBlock:^(id  responseObject, NSError *error) {
        
        if (responseObject) {
            
            NSMutableArray * array =@[].mutableCopy;
            
            NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *responseDic =dic[@"response"];
            NSDictionary * dataDic = responseDic[@"data"];
            
            NSArray * itemArray = dataDic[@"items"];
            for (int i = 0; i<itemArray.count; i++)
            {
                
                NSDictionary * itemDic =itemArray[i];
                NSDictionary * componentDic = itemDic[@"component"];
                NSString * img_index = componentDic[@"img_index"];
                
                [array addObject:img_index];
            }
            
            if (dataBlock) {
                
                dataBlock(array);
                
            }
            
           }
            
        }];

}

+(void)requestBoutiqueData:(DataBlock)dataBlock
{
    
    dispatch_group_t group = dispatch_group_create();
    
    NSMutableArray * array = @[].mutableCopy;
    
    for (int i=0; i<6; i++) {
        NSString * boutiqueURL = [NSString stringWithFormat:@"http://api-v2.mall.hichao.com/mall/region/new?region_id=%d&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CBD795AD-1BFC-40FE-A351-407FEAC7219D&gs=640x1136&gos=8.4.1&access_token=",i+1];
        dispatch_group_async(group, dispatch_get_global_queue(0,0), ^{
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                [NetRequestClass netRequestGETWithRequestURL:boutiqueURL WithParameter:nil WithReturnValeuBlock:^(id responseObject, NSError *error) {
                    
                    NSDictionary * dic =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                    NSDictionary * dataDic =dic[@"data"];
                    BoutiqueDataModel * dataModel =[[BoutiqueDataModel alloc]initWithDic:dataDic];
                    
                    [array addObject:dataModel];
                    
                    if (array.count==6 && dataBlock ) {
                        
                        dataBlock(array);
                    }
                }];
            });
        });
    }
}

+(void)requestTopSVData:(DataBlock)dataBlock
{
    [NetRequestClass netRequestGETWithRequestURL:@"http://api-v2.mall.hichao.com/mall/banner?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=ECC2B810-D18C-4BCE-84B8-688CE56E5399&gs=1536x2048&gos=9.3.2&access_token=" WithParameter:nil WithReturnValeuBlock:^(NSData * responseObject, NSError *error) {
        
        if (responseObject) {
            NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            NSMutableArray * myArray =@[].mutableCopy;
            
            NSDictionary * dataDic = dic[@"data"];
            NSArray * itemArray = dataDic[@"items"];
            for (int i = 0; i<itemArray.count; i++)
            {
                NSDictionary * itemDic = itemArray[i];
                TopSVModel * topModel =[[TopSVModel alloc]initWithDic:itemDic];
                [myArray addObject:topModel];
            }
            
            if (dataBlock) {
                dataBlock(myArray);
            }
            
        }
    }];

}

+(void)footerRefreshDataWithNum:(NSInteger )num  refreshData:(DataBlock)dataBlock;
{
    NSString * URLStr =[NSString stringWithFormat:@"http://api-v2.mall.hichao.com/sku/list?more_items=1&type=selection&flag=%ld&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=ECC2B810-D18C-4BCE-84B8-688CE56E5399&gs=1536x2048&gos=9.3.2&access_token=",91138-18*num];
    
    [NetRequestClass netRequestGETWithRequestURL:URLStr WithParameter:nil WithReturnValeuBlock:^(id responseObject, NSError *error) {
        
        if (responseObject) {
            NSMutableArray * array = @[].mutableCopy;
            
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *dataDic =dic[@"data"];
            
            NSArray * itemsArray =dataDic[@"items"];
            
            for (NSDictionary * itemDic in itemsArray) {
                
                NSDictionary * componetDic = itemDic[@"component"];
                
                XShowComModel * model = [[XShowComModel alloc]initWithDataDic:componetDic];
                
                [array addObject:model];
            }
            
            if (dataBlock) {
                dataBlock(array);
            }
        }

    }];
}


@end
