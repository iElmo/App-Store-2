//
//  APAppItemCollectionViewCell.m
//  AppStore
//
//  Created by Dan Mac Hale on 10/11/2014.
//  Copyright (c) 2014 iElmo. All rights reserved.
//

#import "APAppItemCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface APAppItemCollectionViewCell ()
@property (nonatomic, weak) IBOutlet UILabel *name;
@property (nonatomic, weak) IBOutlet UILabel *kind;
@property (nonatomic, weak) IBOutlet UILabel *price;
@property (nonatomic, weak) IBOutlet UIImageView *image;
@end

@implementation APAppItemCollectionViewCell

-(void)decorateCellWithAppItem:(APAppItemObject *)appItem {
    self.name.text = appItem.name;
    self.kind.text = appItem.kind;
    self.price.text = [NSString stringWithFormat:@"%.2f", appItem.price];
    [self.image setImageWithURL:appItem.imageUrl placeholderImage:nil];
}
@end
