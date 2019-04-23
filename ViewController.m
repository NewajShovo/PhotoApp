//
//  ViewController.m
//  PhotoApp
//
//  Created by leo on 23/4/19.
//  Copyright © 2019 Shafiq Shovo. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import "PhotoCellCollectionViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _assets = [@[] mutableCopy];
    _images=[@[]mutableCopy];
    PHFetchResult *result = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:nil];
    
    NSLog(@"%d",(int)result.count);
    
    for (PHAsset *val in result)
    {
        [_assets addObject:val];
    }
    [self.collectionView reloadData];
    
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - collection view data source

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.assets.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCellCollectionViewCell *cell = (PhotoCellCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    PHAsset *asset = self.assets[indexPath.row];
    
    __block UIImage *temp ;
    
    
    PHImageRequestOptions *requestOptions = [[PHImageRequestOptions alloc] init];
    requestOptions.resizeMode   = PHImageRequestOptionsResizeModeExact;
    requestOptions.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
    requestOptions.synchronous = true;
    requestOptions.networkAccessAllowed = YES;
    PHImageManager *manager = [PHImageManager defaultManager];
     cell.photoImageView.image=nil;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        CGRect screenBounds = [ [ UIScreen mainScreen] bounds];
        CGFloat screenScale = [ [ UIScreen mainScreen] scale];
        
        [manager requestImageForAsset:asset
//                           targetSize:CGSizeMake(screenBounds.size.width*screenScale*.5,screenBounds.size.height*screenScale*.5)
                           targetSize:CGSizeMake(500, 500)
                          contentMode:PHImageContentModeDefault
                              options:requestOptions
                        resultHandler:^void(UIImage *image, NSDictionary *info) {
                            temp=image;
                        }];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if(temp){
                cell.photoImageView.image = temp;
            }
           
            
        });
        
        
    });
    
    
    
    
    return cell;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 4;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}


@end
//@implementation PhotoCellCollectionViewCell
//
//-(void) prepareForReuse{
//    [super prepareForReuse];
//}
//
//@end
//@implementation PhotoCellCollectionViewCell
//
//- (void) prepareForReuse
//{
//    [super prepareForReuse];
//    self.photoImageView.image = nil;
//}
//
//@end

