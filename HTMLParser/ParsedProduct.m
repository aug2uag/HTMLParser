//
//  ParsedProduct.m
//  HTMLParser
//
//  Created by Reza Fatahi on 6/5/13.
//  Copyright (c) 2013 Rex Fatahi. All rights reserved.
//

#import "ParsedProduct.h"

@implementation ParsedProduct

@synthesize productName, productProducer, productPrice, productDescription, productImageURL;

- (id)initWithName:(NSString *)theProductName withProducer:(NSString *)theProductProducer withDescription:(NSString *)theProductDescription andImageURL:(NSString *)theProductImageURL
{
    self = [super init];
    if (self) {
        productName         = theProductName;
        productProducer    = theProductProducer;
        productDescription  = theProductDescription;
        productImageURL     = theProductImageURL;
    }
    return self;
}

@end
