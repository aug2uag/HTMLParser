//
//  HTMLParseViewController.m
//  HTMLParser
//
//  Created by Reza Fatahi on 6/5/13.
//  Copyright (c) 2013 Rex Fatahi. All rights reserved.
//

#import "HTMLParseViewController.h"

#import "TFHpple.h"
#import "ParsedProduct.h"

@interface HTMLParseViewController ()

@end

@implementation HTMLParseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-
#pragma mark HPPLE Toys 'R Us parse

+ (void) toysRusParsewithProductID:(NSString *)productID
{
    
    // 1 create Toys'R Us URL string, and make NSData object
    NSURL* toysRusURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.toysrus.com/product/index.jsp?productId=%@",productID]];
    
    NSData *toysRusDataFromURL = [NSData dataWithContentsOfURL:toysRusURL];
    
    // 2 create HPPLE parse object with NSData object
    TFHpple* toysRusParser = [TFHpple hppleWithHTMLData:toysRusDataFromURL];
    
    // 3 use XPATH to parse i)name, ii)producer, iii)price, iv)descriptions, v)photos
    NSString* toysRusProductNamePath = @"//div[@id='wrapper']/div[@id='container']/div[@id='productPanel']/div[@id='rightSide']/div[@id='priceReviewAge']/h1";
    NSArray* toysRusProductNameArray = [toysRusParser searchWithXPathQuery:toysRusProductNamePath];
    NSString* toysRusProductName = [[toysRusProductNameArray[0] firstChild] content];
    
    
    NSString* toysRusProductProducerPath = @"//div[@id='wrapper']/div[@id='container']/div[@id='productPanel']/div[@id='rightSide']/div[@id='priceReviewAge']/h3";
    NSArray* toysRusProductProducerArray = [toysRusParser searchWithXPathQuery:toysRusProductProducerPath];
    NSString* toysRusProductProducer = [[toysRusProductProducerArray[0] childrenShoplater] valueForKeyPath:@"nodeChildArray.nodeContent"][1][0];
    
    
    NSString* toysRusProductPricePath = @"//div[@id='wrapper']/div[@id='container']/div[@id='productPanel']/div[@id='rightSide']/div[@id='buyFind']/div[@id='buyWrapper']/div[@id='buyInterior']/div[@id='price']/ul/li/span";
    NSArray* toysRusProductPriceArray = [toysRusParser searchWithXPathQuery:toysRusProductPricePath];
    NSString* toysRusProductPrice = [[toysRusProductPriceArray[0] firstChild] content];
    
    //**************//////////////**************//////////////**************//////////////
    //////////////**************//////////////**************////////////////////////////
    
    //div[@id='body']/div[@class='mboxDefault']/div[@id='container']/form/
    
    NSString* toysRusProductDescriptionPath = @"//div[@id='wrapper']/div[@id='container']/div[@id='infoPanel']/dl[@id='tabset_productPage']/dd/p";
    NSArray* toysRusProductDescriptionArray = [toysRusParser searchWithXPathQuery:toysRusProductDescriptionPath];
    NSString* toysRusProductDescription = [toysRusProductDescriptionArray[0] valueForKeyPath:@"raw"];
    NSRange rangeString;
    while ((rangeString = [toysRusProductDescription rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        toysRusProductDescription = [toysRusProductDescription stringByReplacingCharactersInRange:rangeString withString:@" "];
    
    toysRusProductDescription = [toysRusProductDescription stringByReplacingOccurrencesOfString:@"Product Description" withString:@""];
    toysRusProductDescription = [toysRusProductDescription stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    //NSLog(@"%@\n\n\n\n", toysRusProductDescription);
    
    //**************//////////////**************//////////////**************//////////////
    //////////////**************//////////////**************////////////////////////////
    
    NSString* toysRusProductImagePath = @"//div[@id='wrapper']/div[@id='container']/div[@id='productPanel']/div[@id='leftSide']/div[@id='productView']";
    NSArray* toysRusProductImageArray = [toysRusParser searchWithXPathQuery:toysRusProductImagePath];
    NSString* toysRusProductImage1 = [[[toysRusProductImageArray[0] childrenShoplater] valueForKeyPath:@"nodeChildArray.nodeChildArray.nodeChildArray.nodeAttributeArray"][1][1][1][0][0] valueForKey:@"nodeContent"];
//    NSString* toysRusProductImage2 = [[[[toysRusProductDescriptionArray[0] childrenShoplater] valueForKeyPath:@"nodeChildArray"][2][7] valueForKeyPath:@"nodeChildArray.nodeAttributeArray"][1][0] valueForKeyPath:@"nodeContent"];

    NSLog(@"%@\n\n\n\n\n\n\n",toysRusProductImage1);
    
//        for (TFHppleElement *element in toysRusProductImageArray) {
//            NSLog(@"\n%@\nwowowowowow\n\n\n\n\n\n\n\n\n", element);
//        }
    
}

@end
