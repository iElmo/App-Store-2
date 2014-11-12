//
//  APTopRatedCollectionViewController.m
//  AppStore
//
//  Created by Dan Mac Hale on 10/11/2014.
//  Copyright (c) 2014 iElmo. All rights reserved.
//

#import "APTopRatedCollectionViewController.h"
#import "APAppItemCollectionViewCell.h"
#import "APAPIController.h"
#import "APAppItemObject.h"

@interface APTopRatedCollectionViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation APTopRatedCollectionViewController

#pragma mark - View Implementation
- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = [[NSMutableArray alloc] init];
    [self executeRSSQuery:@"https://itunes.apple.com/gb/rss/topgrossingapplications/limit=25/json"];
}

#pragma mark - API Methods

- (void)executeRSSQuery:(NSString *)query {
    __weak APTopRatedCollectionViewController *blockSelf = self;
    [APAPIController executeRssQuery:query withCompletionBlock:^(NSArray *items, NSError *error) {
        if (!error) {
            blockSelf.items = [NSMutableArray arrayWithArray:items];
            [blockSelf.collectionView reloadData];
        }
    }];
}

#pragma mark - UICollectionView DataSource

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    APAppItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"APAppItemCollectionViewCell" forIndexPath:indexPath];
    APAppItemObject *item = self.items[indexPath.row];
    [cell decorateCellWithAppItem:item];
    return cell;
}

#pragma mark - UICollectionView Delegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

@end
