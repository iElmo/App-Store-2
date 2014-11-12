//
//  APAppItemObject.h
//  AppStore
//
//  Created by Dan Mac Hale on 10/11/2014.
//  Copyright (c) 2014 iElmo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APAppItemObject : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *kind;
@property (nonatomic) float price;
@property (nonatomic, copy) NSURL *imageUrl;

@end
