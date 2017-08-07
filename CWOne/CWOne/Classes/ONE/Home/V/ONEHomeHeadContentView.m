//
//  ONEHomeSmallNoteCell.m
//  CWOne
//
//  Created by Coulson_Wang on 2017/8/2.
//  Copyright © 2017年 Coulson_Wang. All rights reserved.
//

#import "ONEHomeHeadContentView.h"
#import "ONELikeView.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "ONEHomeViewModel.h"
#import "ONEHomeItem.h"
#import "ONEMainTabBarController.h"
#import "UILabel+CWLineSpacing.h"

#define kRatioOfHorizontal 207/311.0
#define kRatioOfVertical 338/311.0

@interface ONEHomeHeadContentView ()

@property (weak, nonatomic) IBOutlet UIImageView *coverView;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *imageInfoLabel;
@property (weak, nonatomic) IBOutlet UIButton *collectButton;
@property (weak, nonatomic) IBOutlet UIView *seperateView;

@property (weak, nonatomic) ONELikeView *likeView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *coverViewHeightConstraint;

@end

@implementation ONEHomeHeadContentView

+ (instancetype)headContentView {
    ONEHomeHeadContentView *headContentView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    headContentView.width = CWScreenW;
    return headContentView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // 添加点赞控件
    ONELikeView *likeView = [ONELikeView likeView];
    [self addSubview:likeView];
    [likeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.collectButton.mas_left).with.offset(-10);
        make.centerY.equalTo(self.collectButton);
        make.height.equalTo(@28);
        make.width.equalTo(@60);
    }];
    self.likeView = likeView;
}

- (void)setViewModel:(ONEHomeViewModel *)viewModel {
    _viewModel = viewModel;
    
    self.subTitleLabel.text = viewModel.subTitle;
    [self.contentLabel setText:viewModel.homeItem.forward lineSpacing:8.0];
    self.imageInfoLabel.text = viewModel.homeItem.words_info;
    self.likeView.viewModel = viewModel;
    
    CGFloat ratio = (viewModel.homeItem.orientation.integerValue == 0) ? kRatioOfHorizontal : kRatioOfVertical;
    self.coverViewHeightConstraint.constant = CWScreenW * ratio;
    [self layoutIfNeeded];
    
    NSURL *imgUrl = [NSURL URLWithString:viewModel.homeItem.img_url];
    [self.coverView sd_setImageWithURL:imgUrl placeholderImage:[UIImage imageNamed:@"center_diary_placeholder"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (error) {
            self.coverView.image = [UIImage imageNamed:@"networkingErrorPlaceholderIcon"];
        }
    }];
    
    self.headContentViewHeight = CGRectGetMaxY(self.seperateView.frame);
}

#pragma mark - 私有方法


- (IBAction)smallNoteButtonClick:(UIButton *)sender {
}

- (IBAction)shareButtonClick:(UIButton *)sender {
}
- (IBAction)collectButtonClick:(UIButton *)sender {
}

@end