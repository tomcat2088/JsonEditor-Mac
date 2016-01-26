//
//  ViewController.m
//  JsonEditor-Mac
//
//  Created by wangyang on 16/1/25.
//  Copyright © 2016年 wangyang. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.frameLoadDelegate = self;
    [self loadJsonEditor];
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)loadJsonEditor
{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"index"
                                                         ofType:@"html"
                                                    inDirectory:@"web"];
    NSURL* fileURL = [NSURL fileURLWithPath:filePath];
    NSURLRequest* request = [NSURLRequest requestWithURL:fileURL];
    [[self.webView mainFrame] loadRequest:request];
}

- (NSString*)save
{
    NSDictionary* result = [[[[self.webView mainFrame] javaScriptContext] evaluateScript:@"saveToString()"] toDictionary];
    NSData* data = [NSJSONSerialization dataWithJSONObject:result options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
