//
//  MHSViewController.m
//  GIFImageAndBeyond
//
//  Created by Maher Suboh on 6/6/14.
//  Copyright (c) 2014 Maher Suboh. All rights reserved.
//

#import "MHSViewController.h"
#import "UIImage+animatedGIF.h"


@interface MHSViewController ()

@end

@implementation MHSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"radar02BlackLarge" withExtension:@"gif"];
    
    UIImageView* animatedImageView =[[UIImageView alloc] initWithFrame:self.view.bounds];
    animatedImageView.image = [UIImage animatedImageWithAnimatedGIFURL:url];
    animatedImageView.contentMode = UIViewContentModeScaleToFill;
    
    [self.view addSubview:animatedImageView];
    [animatedImageView setCenter:self.view.center];
    
    
    url = [[NSBundle mainBundle] URLForResource:@"RedAnimationFly" withExtension:@"gif"];
    
//    UIImageView* animatedImageView2 =[[UIImageView alloc] initWithFrame:self.view.bounds];
    _animatedImageView2 =[[UIImageView alloc] initWithFrame:self.view.bounds];
    //    UIImageView* animatedImageView2 =[[UIImageView alloc] initWithFrame:CGRectMake(-50,-150,500,500)];
    _animatedImageView2.image = [UIImage animatedImageWithAnimatedGIFURL:url];
    _animatedImageView2.contentMode = UIViewContentModeScaleAspectFit;
    _animatedImageView2.transform = CGAffineTransformMakeScale(.45,.45);
    _animatedImageView2.alpha = 1;
    [self.view addSubview:_animatedImageView2];
    [_animatedImageView2 setCenter:self.view.center];

    dispatch_async(dispatch_get_main_queue(), ^{
        [self playSoundSequence];
    });

    
}

- (void)playSoundSequence {
    
    // Make array containing audio file names
    NSArray  *theSoundArray = [NSArray arrayWithObjects:@"low-radar-beeps",@"radar-detector",@"radar-detector2",nil];
    NSArray  *theSoundTypeArray = [NSArray arrayWithObjects:@"mp3",@"mp3",@"m4a", nil];
//    NSArray  *theSoundArray = [NSArray arrayWithObjects:@"low-radar-beeps",@"radar-detector",@"radar-detector2",@"NoSound",nil]; // this one work around not to hear two sounds together
//    NSArray  *theSoundTypeArray = [NSArray arrayWithObjects:@"mp3",@"mp3",@"m4a",@"m4a", nil];
//    NSArray  *theSoundArray = [NSArray arrayWithObjects:@"low-radar-beeps",@"radar-detector",nil];
//    NSArray  *theSoundTypeArray = [NSArray arrayWithObjects:@"mp3",@"mp3",nil];
    
    NSInteger totalSoundsInQueue = [theSoundArray count];
    
    for (NSInteger i=0; i < totalSoundsInQueue; ) {
        
        NSString *sound = [theSoundArray objectAtIndex:i];
        
        // Wait until the audio player is not playing anything
        while(![_player isPlaying]){
            AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]   pathForResource:sound ofType: [theSoundTypeArray objectAtIndex:i]      ]] error:NULL];
            _player = player;
            [_player setVolume:1.0f];
            [_player play];
            i++;
            
        }
        //        if (i > 1) i =0;
    }
    
    NSLog(@"I ma here");
    
    NSError *error;
    NSString *soundPath = [[NSBundle mainBundle]pathForResource:@"bgMusic" ofType:@"mp3"];
    
    NSURL *url = [NSURL fileURLWithPath:soundPath];
    
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    [self.view  bringSubviewToFront:_customRangeBar1];
    [self.view  bringSubviewToFront:_customRangeBar2];
    [self.view  bringSubviewToFront:_customRangeBar3];
    [self.view  bringSubviewToFront:_customRangeBar4];
    [self.view  bringSubviewToFront:_remTime];
    [self.view  bringSubviewToFront:_skipAudio];

    
    _customRangeBar1.numBars = 40;
    _customRangeBar1.minLimit = 0.05;
    _customRangeBar1.maxLimit = 1.00;
    _customRangeBar1.holdPeak = NO;
    _customRangeBar1.litEffect = NO;
    // UIColor *clrBar = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]; //if u want to make it
    _customRangeBar1.normalBarColor = [UIColor greenColor];
    _customRangeBar1.warningBarColor = [UIColor yellowColor];;
    _customRangeBar1.dangerBarColor = [UIColor redColor];;
    _customRangeBar1.backgroundColor = [UIColor blackColor];
    _customRangeBar1.outerBorderColor = [UIColor clearColor];
    _customRangeBar1.innerBorderColor = [UIColor clearColor];

    _customRangeBar2.numBars = 40;
    _customRangeBar2.minLimit = 0.05;
    _customRangeBar2.maxLimit = 1.00;
    _customRangeBar2.holdPeak = NO;
    _customRangeBar2.litEffect = NO;
    _customRangeBar2.normalBarColor = [UIColor greenColor];
    _customRangeBar2.warningBarColor = [UIColor yellowColor];;
    _customRangeBar2.dangerBarColor = [UIColor redColor];;
    _customRangeBar2.backgroundColor = [UIColor blackColor];
    _customRangeBar2.outerBorderColor = [UIColor clearColor];
    _customRangeBar2.innerBorderColor = [UIColor clearColor];
    
    _customRangeBar3.numBars = 40;
    _customRangeBar3.minLimit = 0.05;
    _customRangeBar3.maxLimit = 1.00;
    _customRangeBar3.holdPeak = NO;
    _customRangeBar3.litEffect = NO;
    _customRangeBar3.normalBarColor = [UIColor greenColor];
    _customRangeBar3.warningBarColor = [UIColor yellowColor];;
    _customRangeBar3.dangerBarColor = [UIColor redColor];;
    _customRangeBar3.backgroundColor = [UIColor blackColor];
    _customRangeBar3.outerBorderColor = [UIColor clearColor];
    _customRangeBar3.innerBorderColor = [UIColor clearColor];
    
    _customRangeBar4.numBars = 40;
    _customRangeBar4.minLimit = 0.05;
    _customRangeBar4.maxLimit = 1.00;
    _customRangeBar4.holdPeak = NO;
    _customRangeBar4.litEffect = NO;
    _customRangeBar4.normalBarColor = [UIColor greenColor];
    _customRangeBar4.warningBarColor = [UIColor yellowColor];;
    _customRangeBar4.dangerBarColor = [UIColor redColor];;
    _customRangeBar4.backgroundColor = [UIColor blackColor];
    _customRangeBar4.outerBorderColor = [UIColor clearColor];
    _customRangeBar4.innerBorderColor = [UIColor clearColor];


    
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    }
    else
    {
        _audioPlayer.delegate = self;
        [_audioPlayer prepareToPlay];
        _audioPlayer.meteringEnabled = YES;
        [_audioPlayer play];
        playTimer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(playTimer:) userInfo:nil repeats:YES];
        
    }
    
    //audioPlayer.volume = 2;
    _skipAudio.minimumValue = 0;
    _skipAudio.maximumValue = _audioPlayer.duration;
    
//    NSTimeInterval shortStartDelay = 0.5;            // seconds
//    NSTimeInterval now = _player.deviceCurrentTime;
    
    //    [_player playAtTime:now + shortStartDelay];  //these players are instances of AVAudioPlayer
    //    [_player playAtTime:now + shortStartDelay];
    //    [_player playAtTime:now + shortStartDelay];
    
    
}

- (void)playTimer:(NSTimer *)timer{
    
    [_audioPlayer updateMeters];
    
    const double ALPHA = 1.05;
    const double ALPHA2 = 1.50;
    const double ALPHA3 = 0.05;
    
	double averagePowerForChannel = pow(10, (0.05 * [_audioPlayer averagePowerForChannel:0]));
	lowPassReslts = ALPHA * averagePowerForChannel + (1.0 - ALPHA) * lowPassReslts;
	
    double averagePowerForChannel1 = pow(10, (0.05 * [_audioPlayer averagePowerForChannel:1]));
	lowPassReslts1 = ALPHA * averagePowerForChannel1 + (1.0 - ALPHA) * lowPassReslts1;
	
    double peakPowerForChannel = pow(10, (0.05 * [_audioPlayer peakPowerForChannel:0]));
	lowPassReslts2 = ALPHA2 * peakPowerForChannel + (1.0 - ALPHA2) * lowPassReslts2;
    
    double peakPowerForChannel1 = pow(10, (0.05 * [_audioPlayer peakPowerForChannel:1]));
	lowPassReslts3 = ALPHA2 * peakPowerForChannel1 + (1.0 - ALPHA2) * lowPassReslts3;
    
    double sizeImage = pow(10, (0.05 * [_audioPlayer averagePowerForChannel:1]));
	sizeImagePassReslts = ALPHA3 * sizeImage + (1.0 - ALPHA3) * sizeImagePassReslts;
    
    
	//if (lowPassReslts < 1.95)
    //	NSLog(@"Should animate here But HOW?? %f",lowPassReslts);
    
    
    _customRangeBar1.value = lowPassReslts2;
    _customRangeBar2.value = lowPassReslts3;
    _customRangeBar3.value = lowPassReslts;
    _customRangeBar4.value = lowPassReslts;
//    customRangeBar5.value = lowPassReslts3;
//    customRangeBar6.value = lowPassReslts2;
    
    
    
    
    [_animatedImageView2 setFrame:CGRectMake(82, 20, 150, 150)];
    [_animatedImageView2 setTransform:CGAffineTransformMakeScale(sizeImagePassReslts, sizeImagePassReslts)];
    
    
    _skipAudio.value = _audioPlayer.currentTime; //for the skipper
    

    
    float minutes = floor(_audioPlayer.currentTime/60);
    float seconds = _audioPlayer.currentTime - (minutes * 60);
    
    float duration_minutes = floor(_audioPlayer.duration/60);
    float duration_seconds = _audioPlayer.duration - (duration_minutes * 60);
    
    NSString *timeInf = [[NSString alloc] initWithFormat:@"%0.00f:%0.00f / %0.00f:%0.00f",minutes, seconds, duration_minutes, duration_seconds];
    _remTime.text = timeInf;
    
    
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)skipAudioActn:(id)sender {
//    _skipAudio.value = _audioPlayer.currentTime ++;
}
@end
