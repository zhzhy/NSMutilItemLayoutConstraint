//
//  ViewController.m
//  newTest
//
//  Created by zcy on 13-2-22.
//  Copyright (c) 2013年 zcy. All rights reserved.
//

#import "ViewController.h"
#import "NSMutilItemLayoutConstraint.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self testOneOption];
    [self testMultiOptions];
}

- (void)testOneOption
{
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [firstButton setTitle:@"First" forState:UIControlStateNormal];
    [firstButton setTitle:@"First" forState:UIControlStateHighlighted];
    [secondButton setTitle:@"Second" forState:UIControlStateNormal];
    [secondButton setTitle:@"Second" forState:UIControlStateHighlighted];
    
    [self.view addSubview:firstButton];
    [self.view addSubview:secondButton];
    
    [firstButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [secondButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *viewDictionary = NSDictionaryOfVariableBindings(firstButton,secondButton);
    NSArray *vConstraint = [NSLayoutConstraint constraintsWithMultiVisualFormats:@"|-[firstButton]-[secondButton]-|,V:|-[firstButton],[firstButton(secondButton)]" options:NSLayoutFormatAlignAllBaseline | NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:viewDictionary];
    
    if (vConstraint) {
        [self.view addConstraints:vConstraint];
    }
}

- (void)testMultiOptions
{
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [firstButton setTitle:@"Three" forState:UIControlStateNormal];
    [firstButton setTitle:@"Three" forState:UIControlStateHighlighted];
    [secondButton setTitle:@"Four" forState:UIControlStateNormal];
    [secondButton setTitle:@"Four" forState:UIControlStateHighlighted];
    
    [self.view addSubview:firstButton];
    [self.view addSubview:secondButton];
    
    [firstButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [secondButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *viewDictionary  = NSDictionaryOfVariableBindings(firstButton,secondButton);
    NSArray *options = [NSArray arrayWithObjects:[NSNumber numberWithUnsignedInt:NSLayoutFormatAlignAllBottom], [NSNumber numberWithUnsignedInt:0],nil];
    NSArray *constraints = [NSLayoutConstraint constraintsWithMultiVisualFormatsWithMultiOptions:@"|-[firstButton]-[secondButton]-|,V:[firstButton]-|" multiOptions:options metrics:nil views:viewDictionary];
    
    if (constraints) {
        [self.view addConstraints:constraints];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
