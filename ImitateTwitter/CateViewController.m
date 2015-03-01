//
//  CateViewController.m
//  ImitateTwitter
//
//  Created by je_ffy on 15/2/11.
//  Copyright (c) 2015年 je_ffy. All rights reserved.
//

#import "CateViewController.h"
#import "FlowLayout.h"
#import "CollectionViewCell.h"
#import "CollectionReusableView.h"

#define HEADERIDENTIFIER  (@"resableView")

@interface CateViewController ()<UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)UICollectionView *collection;
@property (nonatomic, strong)NSMutableArray *dataArray;
@property (nonatomic, strong)NSMutableArray *widthArray;
@property (nonatomic, strong)NSMutableArray *heightArray;
@end

@implementation CateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataResource];
    
    
    self.collection = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[[FlowLayout alloc] init]];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    [self.collection registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    [self.collection registerClass:[CollectionReusableView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
               withReuseIdentifier:HEADERIDENTIFIER];
    [self.view addSubview:self.collection];
    


    // Do any additional setup after loading the view.
}

//数据源
- (void)dataResource
{
    self.dataArray = [NSMutableArray array];
    self.widthArray = [NSMutableArray array];
    self.heightArray = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        @autoreleasepool {
            NSString *im = [NSString stringWithFormat:@"%d.jpg",i+20];
            UIImage *img = [UIImage imageNamed:im];
            [_dataArray addObject:img];
            [_widthArray addObject:[NSString stringWithFormat:@"%f",img.size.width]];
            [_heightArray addObject:[NSString stringWithFormat:@"%f",img.size.height]];
        }
    }
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_dataArray count];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 30;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.view.frame.size.width, 50);
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader){
        CollectionReusableView *resableView =
        [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                           withReuseIdentifier:HEADERIDENTIFIER
                                                  forIndexPath:indexPath];
        return resableView;
    }
    return nil;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@" = %ld",(long)indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//每一个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@" = %lu",(unsigned long)indexPath.row);

    CGFloat imgWidth = [self.widthArray[indexPath.row] floatValue];
    CGFloat imgHeight = [self.heightArray[indexPath.row] floatValue];
    CGFloat width = 50*imgHeight/imgWidth;
    NSLog(@" = %lu",(unsigned long)self.widthArray.count);
    return CGSizeMake(width, 50);
}
//
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return  UIEdgeInsetsMake(0, 5, 0, 0);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
