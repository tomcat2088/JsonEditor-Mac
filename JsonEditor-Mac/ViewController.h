//
//  ViewController.h
//  JsonEditor-Mac
//
//  Created by wangyang on 16/1/25.
//  Copyright © 2016年 wangyang. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface ViewController : NSViewController <WebFrameLoadDelegate>
@property (strong) IBOutlet WebView *webView;

- (NSString*)save;
@end

