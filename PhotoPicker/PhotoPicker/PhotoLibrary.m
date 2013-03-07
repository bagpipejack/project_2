//
//  PhotoLibrary.m
//  PhotoPicker
//
//  Created by Jackson L. Pratt on 3/6/13.
//  Copyright (c) 2013 Jackson L. Pratt. All rights reserved.
//

#import "PhotoLibrary.h"

@implementation PhotoLibrary

- (id)init
{
    if(self = [super init])
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"photos" ofType:@"plist"];
        self.photolibrary = [NSDictionary dictionaryWithContentsOfFile:path];
        
        self.photoCategoryNames = [self.photolibrary allKeys]; 
        NSArray *subDictionaries = [self.photolibrary allValues];
        
        self.photoNames = [[NSMutableArray alloc] init];
        self.photoFileNames = [[NSMutableArray alloc] init];
        for (int i = 0; i < [subDictionaries count]; i++)
        {
            [self.photoNames addObject: [subDictionaries[i] allKeys]];
            [self.photoFileNames addObject: [subDictionaries[i] allValues]];
        }
    }
    return self;
}

- (NSInteger)numberOfCategories
{
    return [self.photoCategoryNames count];
}

- (NSString *)nameOfCategory: (NSInteger)categoryIndex
{
    return self.photoCategoryNames[categoryIndex];
}

- (NSInteger)numberOfPicturesInCategory: (NSInteger)categoryIndex
{
    return [self.photoNames[categoryIndex] count];
}

- (NSString *)nameOfPictureinCategory: (NSInteger)categoryIndex atIndex: (NSInteger)pictureIndex
{
    return self.photoNames[categoryIndex][pictureIndex];
}

- (UIImage *)imageForPictureInCategory: (NSInteger)categoryIndex atIndex: (NSInteger)pictureIndex
{
    return [UIImage imageNamed:self.photoFileNames[categoryIndex][pictureIndex]];
}

@end
