//
//  APAPIController.h
//  AppStore
//
//  Created by Dan Mac Hale on 10/11/2014.
//  Copyright (c) 2014 iElmo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^NSArrayNSErrorCompletionBlock)(NSArray *items, NSError *error);

@interface APAPIController : NSObject

+ (void)executeRssQuery:(NSString *)query withCompletionBlock:(NSArrayNSErrorCompletionBlock)completionBlock;

@end
