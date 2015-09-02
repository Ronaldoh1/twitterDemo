//
//  WelcomeVC.m
//  InTown
//
//  Created by Ronald Hernandez on 9/1/15.
//  Copyright (c) 2015 inTown. All rights reserved.
//

#import "WelcomeVC.h"

@interface WelcomeVC ()

@end

@implementation WelcomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.parentViewController.view.backgroundColor = [UIColor colorWithRed:255.0 green:94.0 blue:1.0 alpha:1];
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
