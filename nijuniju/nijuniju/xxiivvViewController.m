//
//  xxiivvViewController.m
//  nijuniju
//
//  Created by Devine Lu Linvega on 2013-08-06.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreImage/CoreImage.h>
#import "xxiivvTemplates.h"

@interface xxiivvViewController ()

@end

@implementation xxiivvViewController

- (void)viewDidLoad { [super viewDidLoad]; [self start];}
- (void)didReceiveMemoryWarning{ [super didReceiveMemoryWarning]; }

- (void) start
{
	[self templateStart];
	[self performSelectorInBackground:@selector(captureBlur) withObject:nil];
}

- (void) captureBlur {
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.blurTarget.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CIImage *imageToBlur = [CIImage imageWithCGImage:viewImage.CGImage];
    CIFilter *gaussianBlurFilter = [CIFilter filterWithName: @"CIGaussianBlur"];
    [gaussianBlurFilter setValue:imageToBlur forKey: @"inputImage"];
    [gaussianBlurFilter setValue:[NSNumber numberWithFloat: 3] forKey: @"inputRadius"];
    CIImage *resultImage = [gaussianBlurFilter valueForKey: @"outputImage"];
    
    blurrredImage = [[UIImage alloc] initWithCIImage:resultImage];
    
    UIImageView *newView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    newView.image = blurrredImage;
	newView.backgroundColor = [UIColor redColor];
	newView.frame = screen;
    
    [self.blurContainerView insertSubview:newView belowSubview:self.transparentView];
}


- (void) option0
{
	NSLog(@"!!1");
}
- (void) option1
{
	NSLog(@"!!2");
}
- (void) option2
{
	NSLog(@"!!3");
}






@end
