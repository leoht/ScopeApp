//
//  NoticeChooserView.m
//  CinemaAlphaProto
//
//  Created by HETSCH Leonard on 14/03/14.
//  Copyright (c) 2014 Gobelins. All rights reserved.
//

#import "NoticeChooserView.h"

@interface NoticeChooserView () <WebViewInterface>

@property WebViewDelegate *webViewDelegate;

@end

@implementation NoticeChooserView

- (void) viewDidLoad {
    [super viewDidLoad];
    
    StylizeWithScopeFont(self.skipButton.titleLabel, 18);
    BorderedButton(self.skipButton, ScopeBlue);
    
    StylizeWithScopeFont(self.chooserTitle, 26);
    
    self.webViewDelegate = [[WebViewDelegate alloc] initWithWebView:self.webView withWebViewInterface:self];
	self.webView.scrollView.scrollEnabled = false;
	[self.webViewDelegate loadPage:@"notice_chooser.html" fromFolder:@"www"];
}

- (id) processFunctionFromJS:(NSString *)name withArgs:(NSArray *)args error:(NSError *__autoreleasing *)error {
    
    if ([name compare:@"yes" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
//        [[NoticeManager sharedManager] ]
    }
    
    if ([name compare:@"no" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
        [VideoController togglePlayPause];
    }
    
    return nil;
}

- (IBAction)skip:(id)sender {
    [[NoticeManager sharedManager] enableAllNotices];
    PushView(@"MovieSummaryView");
}

@end