//
//  MVDCard.h
//  DeckOfCardOBJ-C
//
//  Created by Michael Di Cesare on 10/7/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MVDCard : NSObject

@property (nonatomic, copy, readonly) NSString * suit;
@property (nonatomic, copy, readonly) NSString * image;

- (instancetype)initWithCardSuit:(NSString *) suit
                           image:(NSString *)image;

@end

@interface  MVDCard (JSONConvertable)

- (instancetype)initWIthDictionary:(NSDictionary<NSString *, id> *) dictionary;

@end
NS_ASSUME_NONNULL_END
