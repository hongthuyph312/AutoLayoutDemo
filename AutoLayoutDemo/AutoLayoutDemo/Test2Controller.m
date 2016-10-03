//
//  Test2Controller.m
//  AutoLayoutDemo
//
//  Created by ThuyPH on 10/3/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import "Test2Controller.h"

@interface Test2Controller ()

@end

@implementation Test2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // InitTopView
    viewNavigation = [[UIView alloc] init];
    [viewNavigation setTranslatesAutoresizingMaskIntoConstraints:NO];
    viewNavigation.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:viewNavigation];
    
    buttonLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonLeft setTitle:@"Left" forState:UIControlStateNormal];
    buttonLeft.backgroundColor = [UIColor blueColor];
    [buttonLeft setTranslatesAutoresizingMaskIntoConstraints:NO];
    [viewNavigation addSubview:buttonLeft];
    
    buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonRight setTitle:@"Right" forState:UIControlStateNormal];
    buttonRight.backgroundColor = [UIColor blueColor];
    [buttonRight setTranslatesAutoresizingMaskIntoConstraints:NO];
    [viewNavigation addSubview:buttonRight];
    
    labelTitle = [[UILabel alloc] init];
    labelTitle.text = @"Visual Format Language";
    labelTitle.font = [UIFont systemFontOfSize:14];
    labelTitle.textAlignment = NSTextAlignmentCenter;
    labelTitle.backgroundColor = [UIColor redColor];
    [labelTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [viewNavigation addSubview:labelTitle];
    
    UILabel *labelDetail = [[UILabel alloc] init];
    labelDetail.text = @"Visual Format Language";
    labelDetail.font = [UIFont systemFontOfSize:10];
    labelDetail.textAlignment = NSTextAlignmentCenter;
    labelDetail.backgroundColor = [UIColor redColor];
    [labelDetail setTranslatesAutoresizingMaskIntoConstraints:NO];
    [viewNavigation addSubview:labelDetail];
    
    //Init CenterView
    UIView *centerView = [[UIView alloc] init];
    centerView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:centerView];
    
    //InitBottomView
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:bottomView];
    
    NSDictionary *dictViews = NSDictionaryOfVariableBindings(viewNavigation, buttonLeft, buttonRight,labelTitle,labelDetail);
    NSDictionary *dictMetrics = @{@"heightNav":@44,
                                  @"paddingNormal":@10};
    
    //Add Constraint for view Nav
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[viewNavigation(==heightNav)]" options:0 metrics:dictMetrics views:dictViews]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[viewNavigation]-0-|" options:NSLayoutFormatAlignAllLeft metrics:nil views:dictViews]];
    
    // Add Constraint for buttonLeft
    [viewNavigation addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[buttonLeft]-0-|"
                                                                           options:0
                                                                           metrics:dictMetrics
                                                                             views:dictViews]];
    [viewNavigation addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-paddingNormal-[buttonLeft(==50)]"
                                                                           options:0
                                                                           metrics:dictMetrics
                                                                             views:dictViews]];
    
    [viewNavigation addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[buttonRight]-0-|"
                                                                           options:0
                                                                           metrics:dictMetrics
                                                                             views:dictViews]];
    [viewNavigation addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonRight(==buttonLeft)]-paddingNormal-|"
                                                                           options:0
                                                                           metrics:dictMetrics
                                                                             views:dictViews]];
    
    [viewNavigation addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[labelTitle(==30)]-0-[labelDetail]-0-|"
                                                                           options:NSLayoutFormatAlignAllCenterX
                                                                           metrics:dictMetrics
                                                                             views:dictViews]];
    
    [viewNavigation addConstraint:[NSLayoutConstraint constraintWithItem:labelDetail
                                                               attribute:NSLayoutAttributeCenterX
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:viewNavigation
                                                               attribute:NSLayoutAttributeCenterX
                                                              multiplier:1.0
                                                                constant:0.0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
