//
//  PhotoCellCollectionViewCell.h
//  PhotoApp
//
//  Created by leo on 23/4/19.
//  Copyright © 2019 Shafiq Shovo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
NS_ASSUME_NONNULL_BEGIN

@interface PhotoCellCollectionViewCell : UICollectionViewCell
@property(nonatomic, strong) NSData *asset;
@property(nonatomic, weak) IBOutlet UIImageView *photoImageView;
@end

NS_ASSUME_NONNULL_END
