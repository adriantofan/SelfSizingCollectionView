//
//  ViewControllerObjcC.m
//  SelfSizing
//
//  Created by Adrian Tofan on 26/12/2014.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "ViewControllerObjcC.h"

@interface ViewControllerObjcC ()

@end

@implementation ViewControllerObjcC

static NSString * const reuseIdentifier = @"Cell";
-(UICollectionViewFlowLayout*)flowLayout{
  return (UICollectionViewFlowLayout*)self.collectionViewLayout;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
  CGSize estimatedSize = CGSizeMake(self.view.frame.size.width, 25.0);
  BOOL testEstimatedItemSize = true;
  if (testEstimatedItemSize) {
    [self flowLayout].estimatedItemSize = estimatedSize;
  }else{
    [self flowLayout].itemSize = estimatedSize;
  }

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 40;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
  UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
  [cell.contentView addSubview:label];
  label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
  label.backgroundColor = [UIColor redColor];
  return cell;
}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//  return CGSizeMake(self.view.frame.size.width, 25.0);
//}
@end
