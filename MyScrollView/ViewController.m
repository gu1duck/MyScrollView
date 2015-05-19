//
//  ViewController.m
//  MyScrollView
//
//  Created by Jeremy Petter on 2015-05-19.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyScrollView* scrollView = [[MyScrollView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview: scrollView];
    self.scrollView = scrollView;
    self.scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * 1.5, scrollView.frame.size.height * 1.5);
    
    UIPanGestureRecognizer* gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(scroll:)];

    [scrollView addGestureRecognizer:gesture];
    
    // Do any additional setup after loading the view, typically from a nib.
    UIView* red = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    red.backgroundColor = [UIColor redColor];
    [scrollView addSubview: red];
    
    UIView* green = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 150, 200)];
    green.backgroundColor = [UIColor greenColor];
    [scrollView addSubview: green];
    
    UIView* blue = [[UIView alloc] initWithFrame:CGRectMake(40, 400, 200, 150)];
    blue.backgroundColor = [UIColor blueColor];
    [scrollView addSubview: blue];
    
    UIView* yellow = [[UIView alloc] initWithFrame:CGRectMake(100, 600, 180, 150)];
    yellow.backgroundColor = [UIColor yellowColor];
    [scrollView addSubview: yellow];
    
//    CGRect rect = self.view.bounds;
//    rect.origin.y += 100;
//    self.view.bounds = rect
    
    
}

-(void)scroll:(UIPanGestureRecognizer*) gesture{
    if (gesture.state == UIGestureRecognizerStateChanged){
        CGRect rect = self.scrollView.bounds;
        CGPoint point = [gesture translationInView:self.scrollView];
        float newX = rect.origin.x - point.x;
        float newY = rect.origin.y - point.y;
        if (newX > 0 && newX + rect.size.width < self.scrollView.contentSize.width){
            rect.origin.x -= point.x;
        }
        if (newY > 0 && newY + rect.size.height < self.scrollView.contentSize.height){
            rect.origin.y -= point.y;
        }
        self.scrollView.bounds = rect;
        
       // NSLog(@"%f, %f", point.x, point.y);
        [gesture setTranslation: CGPointMake(0,0) inView:self.scrollView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
