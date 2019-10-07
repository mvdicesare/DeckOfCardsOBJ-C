//
//  MVDCardViewController.h
//  DeckOfCardOBJ-C
//
//  Created by Michael Di Cesare on 10/7/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MVDCardViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *suitLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;

- (IBAction)drawNewButtonTapped:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
