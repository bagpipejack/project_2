//
//  FirstViewController.m
//  PhotoPicker
//
//  Created by Jackson L. Pratt on 3/6/13.
//  Copyright (c) 2013 Jackson L. Pratt. All rights reserved.
//

#import "GridViewController.h"
#import "PhotoLibrary.h"
#import "PictureCell.h"
#import "PictureHeader.h"

@interface GridViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *gridView;

@property (weak, nonatomic) IBOutlet UILabel *pictureLabel;
@property (nonatomic, strong) PhotoLibrary *photoLibrary;

@end

@implementation GridViewController

- (PhotoLibrary *)photoLibrary
{
    if (!_photoLibrary) {
        _photoLibrary = [[PhotoLibrary alloc] init];
    }
    
    return _photoLibrary;
}



#pragma mark - UICollectionViewDataSource

- (NSInteger) numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return [self.photoLibrary numberOfCategories];
}

- (NSInteger) collectionView: (UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.photoLibrary numberOfPicturesInCategory:section];
}

- (UICollectionViewCell *) collectionView: (UICollectionView *)collectionView cellForItemAtIndexPath: (NSIndexPath *)indexPath
{
    PictureCell *cell;
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PictureCell" forIndexPath:indexPath];
    
    cell.imageView.image = [self.photoLibrary imageForPictureInCategory:indexPath.section atIndex: indexPath.row];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    PictureHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind: kind withReuseIdentifier: @"PictureHeader" forIndexPath: indexPath];
    
    header.categoryLabel.text  = [self.photoLibrary nameOfCategory:indexPath.section];
   
    return header;
}



#pragma mark - UICollectionViewDelegate

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.pictureLabel.text = [self.photoLibrary nameOfPictureinCategory: indexPath.section atIndex: indexPath.row];
}

@end
