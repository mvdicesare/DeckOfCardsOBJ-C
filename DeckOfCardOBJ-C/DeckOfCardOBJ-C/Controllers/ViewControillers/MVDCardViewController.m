//
//  MVDCardViewController.m
//  DeckOfCardOBJ-C
//
//  Created by Michael Di Cesare on 10/7/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import "MVDCardViewController.h"
#import "MVDCardController.h"
#import "MVDCard.h"

@interface MVDCardViewController ()

@end

@implementation MVDCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)drawNewButtonTapped:(UIButton *)sender {
    [MVDCardController.sharedController drawNewCard:1 completion:^(NSArray<MVDCard *> * cardArray) {
        [MVDCardController.sharedController fetchImageFromCard:cardArray[0] completion:^(UIImage * image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.cardImageView.image = image;
                MVDCard * card = cardArray[0];
                self.suitLabel.text = card.suit;
            });
        }];
    }];
}
@end
