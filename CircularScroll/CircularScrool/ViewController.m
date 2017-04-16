//
//  ViewController.m
//  CircularScrool
//
//  Created by SaTHYa on 19/01/17.
//  Copyright © 2017 SaTHYa. All rights reserved.
//

#import "ViewController.h"

#define WIDTH_OF_SCROLL_PAGE self.view.frame.size.width
#define HEIGHT_OF_SCROLL_PAGE self.view.frame.size.height
#define WIDTH_OF_IMAGE self.view.frame.size.width
#define HEIGHT_OF_IMAGE self.view.frame.size.height

@interface ViewController ()<UIScrollViewAccessibilityDelegate>
@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) NSMutableArray *slideImages;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.alwaysBounceHorizontal = YES;
    
    self.slideImages = [[NSMutableArray alloc] init];
    [self.slideImages addObject:@"dhoni.jpg"];
    [self.slideImages addObject:@"superman.png"];
    [self.slideImages addObject:@"cr7.png"];
    [self.slideImages addObject:@"jallikatu.png"];
    [self.slideImages addObject:@"batman.png"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[self.slideImages objectAtIndex:([self.slideImages count]-1)]]];
    imageView.frame = CGRectMake(0, 0, WIDTH_OF_IMAGE, HEIGHT_OF_IMAGE);
    [self.scrollView addSubview:imageView];
    for (int i = 0;i<[self.slideImages count];i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[self.slideImages objectAtIndex:i]]];
        imageView.frame = CGRectMake((WIDTH_OF_IMAGE * i)  + WIDTH_OF_IMAGE, 0, WIDTH_OF_IMAGE, HEIGHT_OF_IMAGE);
        [self.scrollView addSubview:imageView];
    }
    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[self.slideImages objectAtIndex:0]]];
    imageView.frame = CGRectMake((WIDTH_OF_IMAGE * ([self.slideImages count] + 1)) , 0, WIDTH_OF_IMAGE, HEIGHT_OF_IMAGE);
    [self.scrollView addSubview:imageView];
    
    [self.scrollView setContentSize:CGSizeMake(WIDTH_OF_SCROLL_PAGE * ([self.slideImages count] + 2), HEIGHT_OF_IMAGE)];
    [self.scrollView setContentOffset:CGPointMake(0, 0)];
    [self.view addSubview:self.scrollView];
    [self.scrollView scrollRectToVisible:CGRectMake(WIDTH_OF_IMAGE,0,WIDTH_OF_IMAGE,HEIGHT_OF_IMAGE) animated:NO];
    [super viewDidLoad];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int currentPage = floor((self.scrollView.contentOffset.x - self.scrollView.frame.size.width / ([self.slideImages count]+2)) / self.scrollView.frame.size.width) + 1;
    if (currentPage==0) {
        [self.scrollView scrollRectToVisible:CGRectMake(WIDTH_OF_IMAGE * [self.slideImages count],0,WIDTH_OF_IMAGE,HEIGHT_OF_IMAGE) animated:NO];
    } else if (currentPage==([self.slideImages count]+1)) {
        [self.scrollView scrollRectToVisible:CGRectMake(WIDTH_OF_IMAGE,0,WIDTH_OF_IMAGE,HEIGHT_OF_IMAGE) animated:NO];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

