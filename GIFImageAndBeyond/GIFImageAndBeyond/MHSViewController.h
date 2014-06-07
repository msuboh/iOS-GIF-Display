//
//  MHSViewController.h
//  GIFImageAndBeyond
//
//  Created by Maher Suboh on 6/6/14.
//  Copyright (c) 2014 Maher Suboh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "F3BarGauge.h"

@interface MHSViewController : UIViewController <AVAudioPlayerDelegate>
{
    NSTimer *playTimer;
    double lowPassReslts;
    double lowPassReslts1;
    double lowPassReslts2;
    double lowPassReslts3;
    double sizeImagePassReslts;
    
}

@property (nonatomic, retain) AVAudioPlayer *player;
@property (nonatomic, retain) AVAudioPlayer *audioPlayer;

@property (strong, nonatomic) IBOutlet F3BarGauge *customRangeBar1;
@property (strong, nonatomic) IBOutlet F3BarGauge *customRangeBar2;
@property (strong, nonatomic) IBOutlet F3BarGauge *customRangeBar3;
@property (strong, nonatomic) IBOutlet F3BarGauge *customRangeBar4;

@property (strong, nonatomic) IBOutlet UISlider *skipAudio;

- (IBAction)skipAudioActn:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *remTime;

@property (retain, nonatomic) IBOutlet UIImageView *animatedImageView2;


@end
