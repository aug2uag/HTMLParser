//
//  ParsedProduct.h
//  HTMLParser
//
//  Created by Reza Fatahi on 6/5/13.
//  Copyright (c) 2013 Rex Fatahi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParsedProduct : NSObject

@property (strong, nonatomic) NSString* productName;
@property (strong, nonatomic) NSString* productProducer;
@property (strong, nonatomic) NSString* productPrice;
@property (strong, nonatomic) NSString* productDescription;
@property (strong, nonatomic) NSString* productImageURL;

- (id)initWithName:(NSString *)theProductName withProducer:(NSString *)theProductProducer withDescription:(NSString *)theProductDescription andImageURL:(NSString *)theProductImageURL;

@end
