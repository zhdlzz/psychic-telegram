//
//  HeaderScrollView.m
//  ZhaoChe
//
//  Created by 严佳文 on 16/6/29.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "HeaderScrollView.h"
#import "CarShowView.h"
@interface HeaderScrollView()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) NSTimer *timer;
@end
@implementation HeaderScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)xibWithHeaderScrollView{
    HeaderScrollView * view = [[[NSBundle mainBundle]loadNibNamed:@"HeaderScrollView" owner:nil options:nil]firstObject];
    return view;
}

-(void)awakeFromNib{
    self.scrollView.bounces = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    CGFloat csW = SCREEN_WIDTH;
    CGFloat csH = 126;
    for (int i = 0; i <3*3; i++) {
        CarShowView *csView = [CarShowView xibWithCarShowView];
        CGFloat csX = i * csW;
        csView.frame = CGRectMake(csX, 0, csW, csH);
        [self.scrollView addSubview:csView];
    }
    self.scrollView.contentSize = CGSizeMake(csW * 3*3, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.pageControl.numberOfPages =3;
    self.pageControl.currentPage = 0;
    
    [self.scrollView addSubview:self.pageControl];

    self.timer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
    

}
-(void)scrollImage{
    //获得偏移量
    CGFloat offsetX = self.scrollView.contentOffset.x;
    //计算当前显示的页
    NSInteger page = offsetX/self.scrollView.bounds.size.width;
    page ++;
    CGFloat offX = page * self.scrollView.bounds.size.width;
    //设置偏移量
    [self.scrollView setContentOffset:CGPointMake(offX, 0) animated:YES];
}

#pragma mark --UIScrollViewDelegate
//1.滑动时候
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //偏移量
    CGFloat offX = scrollView.contentOffset.x;
    //设置一半 page 滚动
    offX = offX +(scrollView.bounds.size.width)/2;
    //    self.pageControl.currentPage = offX/scrollView.bounds.size.width;
    NSInteger page = offX/scrollView.bounds.size.width;
    page = page % 3;
    self.pageControl.currentPage = page;
    
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self scrollViewDidEndDecelerating:scrollView];
}


//2.即将滑动时
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    //停止计时器
    [self.timer invalidate];
    
    self.timer = nil;
    
}

//滑动结束时
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    //重启计时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offX = scrollView.contentOffset.x;
    NSInteger page = offX/scrollView.bounds.size.width;
    if (page == 0) {
        page = 3;
        self.scrollView.contentOffset = CGPointMake(page * scrollView.bounds.size.width, 0);
        
    }else if(page == (3*3 -1)){
        page = 3 -1;
        self.scrollView.contentOffset = CGPointMake(page * scrollView.bounds.size.width, 0);
        
    }
    
    
    
    
}

@end
