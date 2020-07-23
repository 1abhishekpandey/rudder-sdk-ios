//
//  _ViewController.m
//  Rudder
//
//  Created by arnabp92 on 02/26/2020.
//  Copyright (c) 2020 arnabp92. All rights reserved.
//

#import "_ViewController.h"
#import <Rudder/Rudder.h>

@interface _ViewController ()

@end

@implementation _ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[RSClient sharedInstance] track:@"Test Event 1"];
    [[RSClient sharedInstance] track:@"Test Event 2"];
    [[RSClient sharedInstance] track:@"Test Event 3"];
    [[RSClient sharedInstance] track:@"Test Event 4"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
