//
//  PhotoInPhoneController.m
//  AmericanBaby
//
//  Created by 陆广庆 on 14-8-11.
//  Copyright (c) 2014年 陆广庆. All rights reserved.
//

#import "PhotoInPhoneController.h"
#import "PhotoInPhoneCell.h"

@interface PhotoInPhoneController ()

@property (nonatomic) NSUInteger maxPhotoCount;
@property (nonatomic) NSString *albumName;
@property (nonatomic) NSArray *photos;

@property (nonatomic) NSMutableSet *selected;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *iReselectButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *iCountLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *iConfirmButton;

@end

@implementation PhotoInPhoneController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [_handler initDataForUserInterface];
    _maxPhotoCount = 9999999;
    [_iCountLabel setTintColor:[UIColor clearColor]];
    _selected = [NSMutableSet new];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setToolbarHidden:NO];
    if (_albumName != nil) {
        self.navigationItem.title = _albumName;
    }
    [_iCountLabel setTitle:[NSString stringWithFormat:NSLocalizedString(@"photo.in.phone.rest.count", nil),_maxPhotoCount]];
}

#pragma mark - UICollectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_photos count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"PhotoInPhoneCell";
    PhotoInPhoneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIndentifier forIndexPath:indexPath];
    ALAsset *asset = self.photos[indexPath.row];
    [cell configureWithPhotoAsset:asset];
    [cell doSelect:[_selected containsObject:@(indexPath.row)]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *index = @(indexPath.row);
    BOOL contains = [_selected containsObject:index];
    if (contains) {
        [_selected removeObject:index];
    } else {
        if ([_selected count] >= _maxPhotoCount) {
            return;
        }
        [_selected addObject:index];
    }
    PhotoInPhoneCell *cell = (PhotoInPhoneCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell doSelect:!contains];
    [_iCountLabel setTitle:[NSString stringWithFormat:NSLocalizedString(@"photo.in.phone.rest.count", nil),_maxPhotoCount - [_selected count]]];
}

- (IBAction)didConfirmButtonClick:(id)sender
{
    NSMutableArray *result = [NSMutableArray new];
    for (NSNumber *index in _selected) {
        ALAsset *asset = _photos[[index unsignedIntegerValue]];
        [result addObject:asset];
    }
    [_handler didPhotoSelected:result];
}

- (IBAction)didReselectButtonClick:(id)sender
{
    for (NSNumber *index in _selected) {
        PhotoInPhoneCell *cell = (PhotoInPhoneCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:[index unsignedIntegerValue] inSection:0]];
        [cell doSelect:NO];
    }
    [_selected removeAllObjects];
    [_iCountLabel setTitle:[NSString stringWithFormat:NSLocalizedString(@"photo.in.phone.rest.count", nil),_maxPhotoCount]];
}


@end
