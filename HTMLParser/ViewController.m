//
//  ViewController.m
//  HTMLParser
//
//  Created by Reza Fatahi on 6/5/13.
//  Copyright (c) 2013 Rex Fatahi. All rights reserved.
//

#import "ViewController.h"
#import "HTMLParseViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //the other Toys'R Us product ID did not load properly
    [HTMLParseViewController toysRusParsewithProductID:@"12210976"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
