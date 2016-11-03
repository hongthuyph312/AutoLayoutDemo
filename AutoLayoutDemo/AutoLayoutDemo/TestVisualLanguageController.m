//
//  TestVisualLanguageController.m
//  AutoLayoutDemo
//
//  Created by ThuyPH on 9/28/16.
//  Copyright © 2016 themask. All rights reserved.
//

#import "TestVisualLanguageController.h"

@interface TestVisualLanguageController ()

@end

@implementation TestVisualLanguageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Init redView
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [redView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:redView];
    
    //Init blueView
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [blueView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:blueView];
    
    //Init greenView
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [greenView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:greenView];
    
    // Đối với Label có thể không cần set with height cho đối tượng
    UILabel *lbCenter = [[UILabel alloc] init];
    lbCenter.text = @"Đối với Label có thể không cần set with height cho đối tượng, nhưng chữ sẽ bị tràn ra ngoài view. Khi xét width thì label sẽ tự xuống dòng để vừa với text cần hiển thị mà không cần phải set height cho label";
    lbCenter.textAlignment = NSTextAlignmentCenter;
    lbCenter.backgroundColor = [UIColor lightGrayColor];
    lbCenter.translatesAutoresizingMaskIntoConstraints = NO;
    lbCenter.font = [UIFont systemFontOfSize:14];
    lbCenter.numberOfLines = 0;
    [self.view addSubview:lbCenter];
    
    //VFL String
    NSDictionary *dict = @{@"redView":redView,
                           @"blueView":blueView,
                           @"greenView":greenView,
                           @"lbCenter":lbCenter,
                           @"parentView":self.view};

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[redView(==greenView)]-[blueView(==greenView)]-[greenView(>=50)]-|"
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:dict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[redView(==50)]"
                                                                        options:0
                                                                        metrics:nil
                                                                        views:dict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[blueView(==redView)]"
                                                                        options:0
                                                                        metrics:nil
                                                                        views:dict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[greenView(==redView)]"
                                                                        options:0
                                                                        metrics:nil
                                                                        views:dict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[lbCenter(200)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[parentView]-(<=1)-[lbCenter]"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:dict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[redView]-20-[lbCenter]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dict]];
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
