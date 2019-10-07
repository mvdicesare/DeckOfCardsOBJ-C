//
//  MVDCardController.h
//  DeckOfCardOBJ-C
//
//  Created by Michael Di Cesare on 10/7/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVDCard.h"
#import <UIKit/UIKit.h>
@interface MVDCardController : NSObject

+ (MVDCardController *)sharedController;

- (void)drawNewCard:(NSInteger)numberOfCards completion: (void (^) (NSArray <MVDCard *> *))completion;

- (void)fetchImageFromCard:(MVDCard *)card completion:(void(^)(UIImage*))completion;


@end


