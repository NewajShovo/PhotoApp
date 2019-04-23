//
//  PhotoCellCollectionViewCell.m
//  PhotoApp
//
//  Created by leo on 23/4/19.
//  Copyright © 2019 Shafiq Shovo. All rights reserved.
//
#import "PhotoCellCollectionViewCell.h"

@interface PhotoCellCollectionViewCell ()
// 1
//@property(nonatomic, weak) IBOutlet UIImageView *photoImageView;
@end

@implementation PhotoCellCollectionViewCell
- (void) setAsset:(NSData *)asset
{
//    // 2
//    NSLog(@"_-------");
//    NSLog(@"%@",asset);
//    NSLog(@"---------");
    _asset = asset;
    UIImage *ui = [ UIImage imageWithData:asset];
    self.photoImageView.image = ui;
}
@end
