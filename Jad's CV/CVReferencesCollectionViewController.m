//
//  CVReferencesCollectionViewController.m
//  Jad's CV
//
//  Created by Jad Osseiran on 10/04/2014.
//  Copyright (c) 2014 Jad Osseiran. All rights reserved.
//

#import "CVReferencesCollectionViewController.h"

#import "CVRefereeCollectionViewCell.h"

static NSString *CVRefereeCollectionViewCellIdentifier = @"Referee Cell";

@interface CVReferencesCollectionViewController ()

@end

@implementation CVReferencesCollectionViewController

@synthesize pageIndex = _pageIndex;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"References";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection View

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CVRefereeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CVRefereeCollectionViewCellIdentifier forIndexPath:indexPath];
    
    
    
    return cell;
}

@end
