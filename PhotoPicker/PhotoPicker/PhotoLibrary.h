//
//  PhotoLibrary.h
//  PhotoPicker
//
//  Created by Jackson L. Pratt on 3/6/13.
//  Copyright (c) 2013 Jackson L. Pratt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoLibrary : NSObject

@property (strong, nonatomic) NSDictionary *photolibrary;
@property (strong, nonatomic) NSArray *photoCategoryNames;
@property (strong, nonatomic) NSMutableArray *photoNames;
@property (strong, nonatomic) NSMutableArray *photoFileNames;

- (NSInteger) numberOfCategories;

- (NSString *)nameOfCategory: (NSInteger)categoryIndex;

- (NSInteger)numberOfPicturesInCategory: (NSInteger)categoryIndex;

- (NSString *)nameOfPictureinCategory: (NSInteger)categoryIndex atIndex: (NSInteger)pictureIndex;

- (UIImage *)imageForPictureInCategory: (NSInteger)categoryIndex atIndex: (NSInteger)pictureIndex;

@end
