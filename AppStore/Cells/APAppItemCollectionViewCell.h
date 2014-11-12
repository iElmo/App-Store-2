//
//  APAppItemCollectionViewCell.h
//  AppStore
//
//  Created by Dan Mac Hale on 10/11/2014.
//  Copyright (c) 2014 iElmo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APAppItemObject.h"

@interface APAppItemCollectionViewCell : UICollectionViewCell
-(void)decorateCellWithAppItem:(APAppItemObject *)appItem;
@end
