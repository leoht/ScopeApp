//
//  MovieSummaryView.h
//  CinemaAlphaProto
//
//  Created by HETSCH Leonard on 31/01/14.
//  Copyright (c) 2014 Gobelins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieSummaryView : UIViewController

@property (strong, nonatomic) NSString *token;

@property (weak, nonatomic) IBOutlet UIButton *backHomeButton;
@property (strong, nonatomic) IBOutlet UIWebView *movieWebView;


- (IBAction)backHomeButtonTouched:(id)sender;

@end
