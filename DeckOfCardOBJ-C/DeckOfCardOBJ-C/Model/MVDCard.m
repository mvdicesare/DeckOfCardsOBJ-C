//
//  MVDCard.m
//  DeckOfCardOBJ-C
//
//  Created by Michael Di Cesare on 10/7/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import "MVDCard.h"

@implementation MVDCard

- (instancetype)initWithCardSuit:(NSString *)suit image:(NSString *)image
{
    self = [super init];
    if (self)
    {
        _suit = suit;
        _image = image;
    }
    return self;
}

@end

@implementation MVDCard (JSONConvertable)

- (instancetype)initWIthDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString * suit = dictionary[@"suit"];
    NSString * image = dictionary[@"image"];
    
    return [self initWithCardSuit:suit image:image];
    
}

@end
