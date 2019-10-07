//
//  MVDCardController.m
//  DeckOfCardOBJ-C
//
//  Created by Michael Di Cesare on 10/7/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import "MVDCardController.h"

@implementation MVDCardController
// singleton for obj-c
+ (MVDCardController *)sharedController
{
    static MVDCardController * sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [MVDCardController new];
    });
    return sharedController;
}
static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new";


- (void)drawNewCard:(NSInteger)numberOfCards completion:(void (^)(NSArray<MVDCard *> *))completion
{
    NSURL * url = [NSURL URLWithString:baseURLString];
    NSString * cardCount = [@(numberOfCards) stringValue];
    NSURL * drawURL = [url URLByAppendingPathComponent:@"draw/"];
    
    NSURLComponents * urlComponents = [NSURLComponents componentsWithURL:drawURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem * queryItem = [NSURLQueryItem queryItemWithName:@"count" value:cardCount];
    
    urlComponents.queryItems = @[queryItem];
    NSURL * finalURL = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"there was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (data)
        {
            NSDictionary * topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing the JSON %@", error);
                completion(nil);
                return;
            }
            NSArray * cardsArray = topLevelDictionary[@"cards"];
            NSMutableArray * cardPlaceholder = [NSMutableArray new];
            
            for (NSDictionary * dictionary in cardsArray)
            {
                MVDCard * card = [[MVDCard alloc] initWIthDictionary:dictionary];
                [cardPlaceholder addObject:card];
            }
            completion(cardPlaceholder);
        }
    }]resume];
}
- (void)fetchImageFromCard:(MVDCard *)card completion:(void (^)(UIImage *))completion
{
    NSURL * imageURL = [NSURL URLWithString:card.image];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Error %@, %@", error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (data)
        {
            UIImage * image = [UIImage imageWithData:data];
            completion(image);
        }
    }] resume];
}
@end
