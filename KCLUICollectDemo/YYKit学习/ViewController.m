//
//  ViewController.m
//  KCLUICollectDemo
//
//  Created by kcl on 2018/3/26.
//  Copyright © 2018年 KCL. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //MARK: 文本布局适配
    NSString *str = @"阿瑟费说的分开了水电费水电费对方的苏格拉底法国货到付款了吧";
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:str];
    text.font = [UIFont systemFontOfSize:14];
    text.lineSpacing = 14;
    YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(UIScreenWidth-40, MAXFLOAT)];
    YYTextLayout * detailLayout = [YYTextLayout layoutWithContainer:container text:text];
    YYLabel *label = [YYLabel new];
    label.origin = CGPointMake(20, 40);
    label.size = detailLayout.textBoundingSize;
    label.textLayout = detailLayout;
    [self.view addSubview:label];

    //MARK: 文本高亮
    YYTextBorder *border = [YYTextBorder borderWithFillColor:[UIColor grayColor] cornerRadius:3];
    YYTextHighlight *highlight = [YYTextHighlight new];
    [highlight setColor:[UIColor whiteColor]];
    [highlight setBackgroundBorder:border];
    highlight.tapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
    };
    NSRange range = NSMakeRange(0, 4);
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:@"却委屈委屈委屈委屈就开始考虑打发时间的困难就开始放到几点开始把奋笔疾书的"];
    [attrStr setTextHighlight:highlight range:range];
    [attrStr setColor:[UIColor blueColor] range:range];
    YYLabel *highlightLabel = [YYLabel new];
    highlightLabel.attributedText = attrStr;
    highlightLabel.frame = CGRectMake(20, label.bottom+10, UIScreenWidth-40, 40);
    [self.view addSubview:highlightLabel];
    // Do any additional setup after loading the view, typically from a nib.


    //MARK: 图文混排
    NSMutableAttributedString *text1 = [NSMutableAttributedString new];
    UIFont *font = [UIFont systemFontOfSize:16];
    NSMutableAttributedString *attachment = nil;

    // 嵌入 UIImage
    UIImage *image = [UIImage imageNamed:@"dribbble64_imageio"];
    attachment = [NSMutableAttributedString attachmentStringWithContent:image contentMode:UIViewContentModeCenter attachmentSize:image.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
    [text1 appendAttributedString: attachment];

    // 嵌入 UIView
    UISwitch *switcher = [UISwitch new];
    [switcher sizeToFit];
    attachment = [NSMutableAttributedString attachmentStringWithContent:switcher contentMode:UIViewContentModeBottom attachmentSize:switcher.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
    [text1 appendAttributedString: attachment];

    // 嵌入 CALayer
    CAShapeLayer *layer = [CAShapeLayer layer];
//    layer.path = ...
    attachment = [NSMutableAttributedString attachmentStringWithContent:layer contentMode:UIViewContentModeBottom attachmentSize:switcher.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
    [text1 appendAttributedString: attachment];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
