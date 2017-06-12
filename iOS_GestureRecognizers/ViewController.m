//
//  ViewController.m
//  iOS_GestureRecognizers
//
//  Created by TMA103 on 6/9/17.
//  Copyright © 2017 TMA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageView, tapImage, pinchImage, rotateImage, longPressImage, images, imageIndex;

- (void)viewDidLoad {
    [super viewDidLoad];
    imageIndex = 0;
    imageView.userInteractionEnabled = YES;
    images = [[NSMutableArray alloc] initWithObjects:@"girl.jpg", @"bush.jpg", @"Totoro.jpg", nil];
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    // Setting the swipe direction.
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    
    // Adding the swipe gesture on image view
    [imageView addGestureRecognizer:swipeLeft];
    [imageView addGestureRecognizer:swipeRight];
//    tapImage = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageAction:)];
//    pinchImage = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchImageAction:)];
//    rotateImage = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateImageAction:)];
//    
//    [imageView addGestureRecognizer:pinchImage];
//    [imageView addGestureRecognizer:tapImage];
//    [imageView addGestureRecognizer:rotateImage];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapImageAction:(id)sender {
    NSLog(@"Tap image");
}

- (IBAction)longPressImageAction:(id)sender {
    NSLog(@"long press image");
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe {
    if ([images count] > 0) {
        if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
            imageIndex--;
        }
        
        if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
            imageIndex++;
        }
    }
    
    imageIndex = (imageIndex < 0) ? ((int)[images count]-1): (imageIndex % [images count]);
    imageView.image =   [UIImage imageNamed:[images objectAtIndex:imageIndex]];
    
}

- (IBAction)pinchImageAction:(id)sender {
    NSLog(@"pinch image");
}

- (IBAction)rotateImageAction:(id)sender {
    NSLog(@"rotate Image");
}

@end
