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
    viewNavigation.backgroundColor = [UIColor colorWithRed:227/255.0f green:234/255.0f blue:201/255.0f alpha:1];
    [self.view addSubview:viewNavigation];
    
    buttonLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonLeft setTitle:@"Left" forState:UIControlStateNormal];
//    buttonLeft.backgroundColor = [UIColor blueColor];
    [buttonLeft setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonLeft setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonLeft addTarget:self action:@selector(actionBack) forControlEvents:UIControlEventTouchUpInside];
    [viewNavigation addSubview:buttonLeft];
    
    buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonRight setTitle:@"Right" forState:UIControlStateNormal];
//    buttonRight.backgroundColor = [UIColor blueColor];
    [buttonRight setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonRight setTranslatesAutoresizingMaskIntoConstraints:NO];
    [viewNavigation addSubview:buttonRight];
    
    labelTitle = [[UILabel alloc] init];
    labelTitle.text = @"Visual Format Language";
    labelTitle.font = [UIFont systemFontOfSize:14];
    labelTitle.textAlignment = NSTextAlignmentCenter;
//    labelTitle.backgroundColor = [UIColor redColor];
    [labelTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [viewNavigation addSubview:labelTitle];
    
    UILabel *labelDetail = [[UILabel alloc] init];
    labelDetail.text = @"Visual Format Language";
    labelDetail.font = [UIFont systemFontOfSize:10];
    labelDetail.textAlignment = NSTextAlignmentCenter;
//    labelDetail.backgroundColor = [UIColor redColor];
    [labelDetail setTranslatesAutoresizingMaskIntoConstraints:NO];
    [viewNavigation addSubview:labelDetail];
    
    //Init CenterView
    UIView *centerView = [[UIView alloc] init];
    centerView.backgroundColor = [UIColor greenColor];
    [centerView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:centerView];
    
    //InitBottomView
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor blueColor];
    [bottomView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:bottomView];
    
//    NSDictionary *dictViews = NSDictionaryOfVariableBindings(viewNavigation, buttonLeft, buttonRight,labelTitle,labelDetail);
    NSDictionary *dictViews = @{@"viewNavigation":viewNavigation,
                           @"buttonLeft":buttonLeft,
                           @"buttonRight":buttonRight,
                           @"labelTitle":labelTitle,
                           @"labelDetail":labelDetail,
                            @"topLayoutGuide":self.topLayoutGuide,
                            @"bottomLayoutGuide":self.bottomLayoutGuide,
                            @"parentView":self.view,
                            @"centerView":centerView,
                            @"bottomView":bottomView};
    
    NSDictionary *dictMetrics = @{@"heightNav":@44,
                                  @"paddingNormal":@10};
    
    //Add Constraint for view Nav
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[topLayoutGuide][viewNavigation(==heightNav)]" options:0 metrics:dictMetrics views:dictViews]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[viewNavigation]-0-|" options:0 metrics:nil views:dictViews]];
    
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
    
    [viewNavigation addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[labelTitle(==30)][labelDetail]-0-|"
                                                                           options:NSLayoutFormatAlignAllCenterX
                                                                           metrics:dictMetrics
                                                                             views:dictViews]];
    [viewNavigation addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[viewNavigation]-(<=1)-[labelTitle]"
                                                                           options:NSLayoutFormatAlignAllCenterX
                                                                           metrics:dictMetrics
                                                                             views:dictViews]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[parentView]-(<=1)-[centerView(200)]"
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:dictViews]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[parentView]-(<=1)-[centerView(50)]"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:dictViews]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[bottomView(300)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dictViews]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[parentView]-(<=1)-[bottomView(50)]"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:dictViews]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bottomView(30)][bottomLayoutGuide]"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:dictViews]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)actionBack {
    [self.navigationController popViewControllerAnimated:YES];
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
