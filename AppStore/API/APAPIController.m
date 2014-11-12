//
//  APAPIController.m
//  AppStore
//
//  Created by Dan Mac Hale on 10/11/2014.
//  Copyright (c) 2014 iElmo. All rights reserved.
//

#import "APAPIController.h"
#import "AFNetworking.h"
#import "APAppItemObject.h"
@implementation APAPIController

+ (void)executeRssQuery:(NSString *)query withCompletionBlock:(NSArrayNSErrorCompletionBlock)completionBlock {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableArray *items = [[NSMutableArray alloc] init];
    [manager GET:query parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *itemDictionary = [responseObject valueForKeyPath:@"feed.entry"];
        for (NSDictionary *item in itemDictionary) {
            APAppItemObject *itemObject = [[APAppItemObject alloc] init];
            itemObject.name = [item valueForKeyPath:@"im:name.label"];
            itemObject.kind = [item valueForKeyPath:@"category.attributes.label"];
            itemObject.price = [[item valueForKeyPath:@"im:price.attributes.amount"] floatValue];
            NSArray *itemImages = [item valueForKeyPath:@"im:image"];
            NSString *imageUrlString = [[itemImages lastObject] objectForKey:@"label"];
            itemObject.imageUrl = [NSURL URLWithString:imageUrlString];
            [items addObject:itemObject];
        }
        if (completionBlock) {
            completionBlock(items, 0);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (error) {
            NSString *errorMessage = @"Web services error";
            error = [NSError errorWithDomain:@"com.AppStore" code:1 userInfo:[NSDictionary dictionaryWithObject:errorMessage forKey:@"RSS"]];
        }
        if (completionBlock) {
            completionBlock(0, error);
        }
    }];
}
@end
