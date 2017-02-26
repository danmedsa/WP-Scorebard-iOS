//
//  Water_Polo_MarkerViewController.m
//  Water Polo Marker
//
//  Created by Daniel Medina on 8/24/13.
//  Copyright (c) 2013 Medalabs Development. All rights reserved.
//

#import "Water_Polo_MarkerViewController.h"

NSInteger len;

@interface Water_Polo_MarkerViewController ()
{
    int qt;
    int noSound;
    int remainingTime;
}
@end

@implementation Water_Polo_MarkerViewController


#pragma Mark - View did load
- (void)viewDidLoad
{
    [super viewDidLoad];
    remainingTime = 0;
    HomeScore = 0;
    AwayScore = 0;
    qt = 1;
    thirty = 30;
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"gameLength"] == 0){
        len = [length.text integerValue];
        [[NSUserDefaults standardUserDefaults] setInteger:len forKey:@"gameLength"];
        [[NSUserDefaults standardUserDefaults] setObject:homeName.text forKey:@"TeamName"];
    }
    else{
        len = [[NSUserDefaults standardUserDefaults] integerForKey:@"gameLength"];
        homeTeam.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"TeamName"];
        homeName.text = homeTeam.text;
    }
    length.text = [NSString stringWithFormat:@"%ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"gameLength"]];
    Quarter.text = [NSString stringWithFormat:@"%d",qt];
    mainTimer.text = [NSString stringWithFormat:@"%ld:00",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"gameLength"]];
    
/*    if ([homeTeam isEqual:@"Home"]){
 *      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Setup Team Name" message:@"Enter the name of your team" delegate:self 
 *      cancelButtonTitle:@"Cancel" otherButtonTitles:@"Save",nil];
 *       alert.alertViewStyle = UIAlertViewStylePlainTextInput;
 *       alert.tag = 2;
 *       [alert show];
 *      }
 */
//    if (![[[NSUserDefaults standardUserDefaults] objectForKey:@"HomeName"] isEqualToString:@"Home"]) {
//        homeName.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"HomeName"];
//    }
//    [[NSUserDefaults standardUserDefaults] setObject:homeName.text forKey:@"HomeName"];
//    homeTeam.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"HomeName"];
//    if ([homeTeam.text isEqualToString:@""]) {
//        homeTeam.text = @"Home";
//    }
}

-(IBAction)resetGameSet{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Restart" message:@"Are you sure you want to restart the game?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes",nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if(buttonIndex == 1){
        [thirtyCdown invalidate];
        [countDown invalidate];
        [hftimer invalidate];
        [aftimer invalidate];

        mainStop.hidden = YES;
        mainStartbtn.hidden = NO;
        resumeMain.hidden = YES;
        buzLight.hidden = YES;
        hpos.hidden = NO;
        apos.hidden = YES;
        HomeScore = 0;
        AwayScore = 0;
        HomeScorelbl.text = [NSString stringWithFormat:@"%d",HomeScore];
        AwayScorelbl.text = [NSString stringWithFormat:@"%d",AwayScore];
        awayName.text = @"Away";
        awayTeam.text = awayName.text;
        qt = 1;
        thirty = 30;
        remainingTime = 0;
        Homeposp = 0;
        Awayposp = 0;
        thirtysec.text = [NSString stringWithFormat:@"%d",thirty];
        Quarter.text = [NSString stringWithFormat:@"%d",qt];
        mainTimer.text = [NSString stringWithFormat:@"%ld:00",(long)len];
        hf13.hidden = NO; hf11.hidden = NO; hf12.hidden = NO;
        hf23.hidden = NO; hf21.hidden = NO; hf22.hidden = NO;
        hf33.hidden = NO; hf31.hidden = NO; hf32.hidden = NO;
        hf43.hidden = NO; hf41.hidden = NO; hf42.hidden = NO;
        hf53.hidden = NO; hf51.hidden = NO; hf52.hidden = NO;
        hf63.hidden = NO; hf61.hidden = NO; hf62.hidden = NO;
        hf73.hidden = NO; hf71.hidden = NO; hf72.hidden = NO;
        hf83.hidden = NO; hf81.hidden = NO; hf82.hidden = NO;
        hf93.hidden = NO; hf91.hidden = NO; hf92.hidden = NO;
        hf103.hidden = NO; hf101.hidden = NO; hf102.hidden = NO;
        hf113.hidden = NO; hf111.hidden = NO; hf112.hidden = NO;
        hf123.hidden = NO; hf121.hidden = NO; hf122.hidden = NO;
        hf133.hidden = NO; hf131.hidden = NO; hf132.hidden = NO;
        hf143.hidden = NO; hf141.hidden = NO; hf142.hidden = NO;
        
        af13.hidden = NO; af11.hidden = NO; af12.hidden = NO;
        af23.hidden = NO; af21.hidden = NO; af22.hidden = NO;
        af33.hidden = NO; af31.hidden = NO; af32.hidden = NO;
        af43.hidden = NO; af41.hidden = NO; af42.hidden = NO;
        af53.hidden = NO; af51.hidden = NO; af52.hidden = NO;
        af63.hidden = NO; af61.hidden = NO; af62.hidden = NO;
        af73.hidden = NO; af71.hidden = NO; af72.hidden = NO;
        af83.hidden = NO; af81.hidden = NO; af82.hidden = NO;
        af93.hidden = NO; af91.hidden = NO; af92.hidden = NO;
        af103.hidden = NO; af101.hidden = NO; af102.hidden = NO;
        af113.hidden = NO; af111.hidden = NO; af112.hidden = NO;
        af123.hidden = NO; af121.hidden = NO; af122.hidden = NO;
        af133.hidden = NO; af131.hidden = NO; af132.hidden = NO;
        af143.hidden = NO; af141.hidden = NO; af142.hidden = NO;
    }
}

/*
 ************* Main Timer **********
 */
- (IBAction)mainStart{
    if (buzLight.hidden == NO) {
        buzLight.hidden = YES;
    }
    mainStartbtn.hidden = YES;
    mainStop.hidden = NO;
    startDate = [NSDate date];
    Homeposp = 0;
    Awayposp = 0;
    [self setstarterTimer];
}

- (void) setstarterTimer{
    countDown = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerStart) userInfo:nil repeats:YES];
}

- (void) timerStart{
    currentDate = [NSDate date];
    timeElapsing = [currentDate timeIntervalSinceDate:startDate] + pauseTime;
    [self possesionStat:timeElapsing];
    mainMinutes = (int)((60*len - (int) timeElapsing) / 60);
    NSLog(@"\nlen: %ld\nMain Minutes: %d\n",(long)len,mainMinutes);
    currentTime = (60*len - (int) timeElapsing) % 60;
    if (currentTime < 10){
        if (currentTime == 0) {
            int n = mainMinutes;
            mainTimer.text = [NSString stringWithFormat:@"%d:00",(n)];
        }
        else{
        mainTimer.text = [NSString stringWithFormat:@"%d:0%d",mainMinutes,currentTime];
        }
    }
    else{
        mainTimer.text = [NSString stringWithFormat:@"%d:%d",mainMinutes,currentTime];
    }
    NSLog(@"\nTime Elapsing: %.f \nCurrent Time: %d",timeElapsing,currentTime);
    
    //***********Thirty timer***************
    
    thirtytimer = ((thirty - (int) timeElapsing % 30) % 30);
    NSLog(@"\nBefore: %d\n",thirtytimer);
    //thirtytimer += remainingTime;
    NSLog(@"\nAfter: %d\n",thirtytimer);
    thirtysec.text = [NSString stringWithFormat:@"%d",thirtytimer];
    NSLog(@"\nThirty Timer: %d\n",thirtytimer);
    if(thirtytimer == 0){ /// cahnge ==
        if (noSound == 0){
            NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"thritytimer buzz" ofType:@"mp3"];
            NSURL *pathAsURL = [[NSURL alloc] initFileURLWithPath:audioFilePath];
            
            NSError *error;
            thirtybuzz = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURL error:&error];
            
            if (error) {
                NSLog(@"%@", [error localizedDescription]);
            }
            else{
                [thirtybuzz prepareToPlay];
            }
            
            [thirtybuzz setDelegate:self];
            
            [thirtybuzz play];
        }
        noSound = 0;
        [self positionchange];
        [thirtyCdown invalidate];
    }
    if (thirtytimer > 0) {
        thirtysec.text = [NSString stringWithFormat:@"%d",thirtytimer];
    }
    else {
        thirtysec.text = @"30";
    }
    if (currentTime <= 0)
    {
        if ((int)timeElapsing == (60*len)){// cahnge
            //remainingTime = thirtytimer;
            mainTimer.text = [NSString stringWithFormat:@"0:00"];
            [countDown invalidate];
            [thirtyCdown invalidate];
            mainStartbtn.hidden = NO;
            mainStop.hidden = YES;
            mainTimer.text = [NSString stringWithFormat:@"%ld:00",(long)len];//len
            [self thirtyQreset];
            thirtysec.text = [NSString stringWithFormat:@"30"];
            qt += 1;
            Quarter.text = [NSString stringWithFormat:@"%d",qt];
            if (qt > 4) {
                Quarter.text = [NSString stringWithFormat:@"4"];
                thirtysec.text = [NSString stringWithFormat:@"0"];
                mainTimer.text = [NSString stringWithFormat:@"0:00"];
                mainStartbtn.hidden = YES;
                mainStop.hidden = NO;
                [thirtyCdown invalidate];
                [countDown invalidate];
                NSLog(@"\n\nEn Game\n\n");
            }
            buzLight.hidden = NO;
                NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"Quarter buzz" ofType:@"mp3"];
                NSURL *pathAsURL = [[NSURL alloc] initFileURLWithPath:audioFilePath];
                
                NSError *error;
                quartedbuzz = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURL error:&error];
                
                if (error) {
                    NSLog(@"%@", [error localizedDescription]);
                }
                else{
                    
                    [quartedbuzz prepareToPlay];
                }
                
                [quartedbuzz setDelegate:self];
                [quartedbuzz play];
            
        }
        mainMinutes -= 1;
        timeStart = 60;
        NSLog(@"mainMinutes: %d",mainMinutes);
    }
}

- (IBAction)mainStoptime{
    [countDown invalidate];
    resumeMain.hidden = NO;
    mainStop.hidden = YES;
    mainStartbtn.hidden = YES;
    pauseDate = [NSDate date];
    [self pauseHTimer];
    [self pauseATimer];
}

- (IBAction)resumeMainTimer{
    lostTime = [NSDate date];
    pauseTime += [pauseDate timeIntervalSinceDate:lostTime];
    timeElapsing -= pauseTime;
    resumeMain.hidden = YES;
    mainStop.hidden = NO;
    countDown = [NSTimer scheduledTimerWithTimeInterval:1/1.0f target:self selector:@selector(timerStart) userInfo:nil repeats:YES];
    if (HomeFoulRunning == YES){
        [self resumeHTimer];
    }
    if (AwayFoulRunning == YES){
        [self resumeATimer];
    }
}

- (void)thirtyQreset{
    thirty = (30 + (int) timeElapsing) + remainingTime;
    noSound = 1;
    //[self positionchange];
}

- (IBAction)resetThirtytimer{
    thirty = (31 + (int) timeElapsing) + remainingTime;
    noSound = 1;
    //[self positionchange];
}

#pragma mark - Home Foul Timer
- (void) sethfTimer{
    if (mainStop.hidden == NO) {
        hftimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(hmTimer) userInfo:nil repeats:YES];
        HomeFoulRunning = YES;
    }
}

- (void) pauseHTimer{
    [hftimer invalidate];
}

- (void) resumeHTimer{
    if (mainStop.hidden == NO) {
        hftimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(hmTimer) userInfo:nil repeats:YES];
    }
}

- (void) hmTimer{
    hmftimer -= 1;
    hftimerlbl.text = [NSString stringWithFormat:@"%d",hmftimer];
    if(hmftimer < 0){
        [hftimer invalidate];
        HomeFoulRunning = NO;
        hmftimer = 20;
        hftimerlbl.text = [NSString stringWithFormat:@"%d",hmftimer];
    }
}
- (IBAction) hftimer{
    if(hmftimer == 0 && mainStop.hidden == NO){
        hmftimer = 20;
        [self sethfTimer];
    }
    else
    {
        if (mainStop.hidden == NO) {
            [hftimer invalidate];
            hmftimer = 20;
            [self sethfTimer];
        }
    }
}

#pragma mark - Away Foul Timer
- (void) setafTimer{
    if (mainStop.hidden == NO) {
        awftimer = 20;
        aftimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(amTimer) userInfo:nil repeats:YES];
        AwayFoulRunning = YES;
    }
}

- (void) pauseATimer{
    [aftimer invalidate];
}

- (void) resumeATimer{
    if (mainStop.hidden == NO) {
        aftimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(amTimer) userInfo:nil repeats:YES];
    }
}

- (void) amTimer{
    awftimer -= 1;
    aftimerlbl.text = [NSString stringWithFormat:@"%d",awftimer];
    if(awftimer == 0){
        [aftimer invalidate];
        AwayFoulRunning = NO;
        awftimer = 20;
        aftimerlbl.text = [NSString stringWithFormat:@"%d",awftimer];
    }
}
- (IBAction) aftimer{
    if(awftimer == 0){
        awftimer = 20;
        [self setafTimer];
    }
    else
    {
        [aftimer invalidate];
        awftimer = 20;
        [self setafTimer];
    }
}

#pragma mark - Home Score

-(IBAction)HomeScoreplus{
    if (mainStop.hidden == NO) {
        HomeScore += 1;
        HomeScorelbl.text = [NSString stringWithFormat:@"%d",HomeScore];
    }
}
-(IBAction)HomeScoreminus{
    if (mainStop.hidden == NO) {
        if (HomeScore > 0) {
            HomeScore -= 1;
            HomeScorelbl.text = [NSString stringWithFormat:@"%d",HomeScore];
        }
    }
}
-(IBAction)AwayScoreplus{
    if (mainStop.hidden == NO) {
        AwayScore += 1;
        AwayScorelbl.text = [NSString stringWithFormat:@"%d",AwayScore];
    }
}
-(IBAction)AwayScoreminus{
    if (mainStop.hidden == NO) {
        if (AwayScore > 0) {
            AwayScore -= 1;
            AwayScorelbl.text = [NSString stringWithFormat:@"%d",AwayScore];
        }
    }
}

-(void)positionchange{
    
    if (hpos.hidden == NO) {
        hpos.hidden = YES;
        apos.hidden = NO;
    }
    else if (apos.hidden == NO){
        apos.hidden = YES;
        hpos.hidden = NO;
    }
}

- (IBAction)awaypos{
    if (mainStop.hidden == NO) {
        if (hpos.hidden == NO) {
            hpos.hidden = YES;
            apos.hidden = NO;
        }
    }
}
- (IBAction)homepos{
    if (mainStop.hidden == NO) {
        if (apos.hidden == NO){
            apos.hidden = YES;
            hpos.hidden = NO;
        }
    }
}

- (BOOL)homePossession{
    if (hpos.hidden == NO) {
        return true;
    }
    else{
        return false;
    }
}

- (void)possesionStat:(float) currTime{
    
    if ([self homePossession] == true){
        Homeposp++;
    }else{
        Awayposp++;
    }
    
    Hposper.text = [NSString stringWithFormat:@"%.02f",(Homeposp/currTime)*100];
    Aposper.text = [NSString stringWithFormat:@"%.02f",(Awayposp/currTime)*100];
}

- (IBAction) bph1{
    if (mainStop.hidden == NO) {
        if (hf13.hidden == NO && hf11.hidden == YES && hf12.hidden == YES) {
            hf13.hidden = YES;
        }
        if(hf12.hidden == NO && hf11.hidden == YES){
            hf12.hidden = YES;
        }
        if(hf11.hidden == NO){
            hf11.hidden = YES;
        }
    }
}
- (IBAction) bph2{
    if (mainStop.hidden == NO) {
        if (hf23.hidden == NO && hf21.hidden == YES && hf22.hidden == YES) {
            hf23.hidden = YES;
        }
        if(hf22.hidden == NO && hf21.hidden == YES){
            hf22.hidden = YES;
        }
        if(hf21.hidden == NO){
            hf21.hidden = YES;
        }
    }
}
- (IBAction) bph3{
    if (mainStop.hidden == NO) {
        if (hf33.hidden == NO && hf31.hidden == YES && hf32.hidden == YES) {
            hf33.hidden = YES;
        }
        if(hf32.hidden == NO && hf31.hidden == YES){
            hf32.hidden = YES;
        }
        if(hf31.hidden == NO){
            hf31.hidden = YES;
        }
    }
}
- (IBAction) bph4{
    if (mainStop.hidden == NO) {
        if (hf43.hidden == NO && hf41.hidden == YES && hf42.hidden == YES) {
            hf43.hidden = YES;
        }
        if(hf42.hidden == NO && hf41.hidden == YES){
            hf42.hidden = YES;
        }
        if(hf41.hidden == NO){
            hf41.hidden = YES;
        }
    }
}
- (IBAction) bph5{
    if (mainStop.hidden == NO) {
        if (hf53.hidden == NO && hf51.hidden == YES && hf52.hidden == YES) {
            hf53.hidden = YES;
        }
        if(hf52.hidden == NO && hf51.hidden == YES){
            hf52.hidden = YES;
        }
        if(hf51.hidden == NO){
            hf51.hidden = YES;
        }
    }
}
- (IBAction) bph6{
    if (mainStop.hidden == NO) {
        if (hf63.hidden == NO && hf61.hidden == YES && hf62.hidden == YES) {
            hf63.hidden = YES;
        }
        if(hf62.hidden == NO && hf61.hidden == YES){
            hf62.hidden = YES;
        }
        if(hf61.hidden == NO){
            hf61.hidden = YES;
        }
    }
}
- (IBAction) bph7{
    if (mainStop.hidden == NO) {
        if (hf73.hidden == NO && hf71.hidden == YES && hf72.hidden == YES) {
            hf73.hidden = YES;
        }
        if(hf72.hidden == NO && hf71.hidden == YES){
            hf72.hidden = YES;
        }
        if(hf71.hidden == NO){
            hf71.hidden = YES;
        }
    }
}
- (IBAction) bph8{
    if (mainStop.hidden == NO) {
        if (hf83.hidden == NO && hf81.hidden == YES && hf82.hidden == YES) {
            hf83.hidden = YES;
        }
        if(hf82.hidden == NO && hf81.hidden == YES){
            hf82.hidden = YES;
        }
        if(hf81.hidden == NO){
            hf81.hidden = YES;
        }
    }
}
- (IBAction) bph9{
    if (mainStop.hidden == NO) {
        if (hf93.hidden == NO && hf91.hidden == YES && hf92.hidden == YES) {
            hf93.hidden = YES;
        }
        if(hf92.hidden == NO && hf91.hidden == YES){
            hf92.hidden = YES;
        }
        if(hf91.hidden == NO){
            hf91.hidden = YES;
        }
    }
}
- (IBAction) bph10{
    if (mainStop.hidden == NO) {
        if (hf103.hidden == NO && hf101.hidden == YES && hf102.hidden == YES) {
            hf103.hidden = YES;
        }
        if(hf102.hidden == NO && hf101.hidden == YES){
            hf102.hidden = YES;
        }
        if(hf101.hidden == NO){
            hf101.hidden = YES;
        }
    }
}
- (IBAction) bph11{
    if (mainStop.hidden == NO) {
        if (hf113.hidden == NO && hf111.hidden == YES && hf112.hidden == YES) {
            hf113.hidden = YES;
        }
        if(hf112.hidden == NO && hf111.hidden == YES){
            hf112.hidden = YES;
        }
        if(hf111.hidden == NO){
            hf111.hidden = YES;
        }
    }
}
- (IBAction) bph12{
    if (mainStop.hidden == NO) {
        if (hf123.hidden == NO && hf121.hidden == YES && hf122.hidden == YES) {
            hf123.hidden = YES;
        }
        if(hf122.hidden == NO && hf121.hidden == YES){
            hf122.hidden = YES;
        }
        if(hf121.hidden == NO){
            hf121.hidden = YES;
        }
    }
}
- (IBAction) bph13{
    if (mainStop.hidden == NO) {
        if (hf133.hidden == NO && hf131.hidden == YES && hf132.hidden == YES) {
            hf133.hidden = YES;
        }
        if(hf132.hidden == NO && hf131.hidden == YES){
            hf132.hidden = YES;
        }
        if(hf131.hidden == NO){
            hf131.hidden = YES;
        }
    }
}
- (IBAction) bph14{
    if (mainStop.hidden == NO) {
        if (hf143.hidden == NO && hf141.hidden == YES && hf142.hidden == YES) {
            hf143.hidden = YES;
        }
        if(hf142.hidden == NO && hf141.hidden == YES){
            hf142.hidden = YES;
        }
        if(hf141.hidden == NO){
            hf141.hidden = YES;
        }
    }
}

- (IBAction) bmh1{
    if (hf13.hidden == YES && hf11.hidden == YES && hf12.hidden == YES) {
        hf13.hidden = NO;
    }
    else if(hf13.hidden == NO && hf11.hidden == YES && hf12.hidden == YES){
        hf12.hidden = NO;
    }
    else if(hf11.hidden == YES && hf13.hidden == NO && hf12.hidden == NO){
        hf11.hidden = NO;
    }
}
- (IBAction) bmh2{
    if (hf23.hidden == YES && hf21.hidden == YES && hf22.hidden == YES) {
        hf23.hidden = NO;
    }
    else if(hf23.hidden == NO && hf21.hidden == YES && hf22.hidden == YES){
        hf22.hidden = NO;
    }
    else if(hf21.hidden == YES && hf23.hidden == NO && hf22.hidden == NO){
        hf21.hidden = NO;
    }

}
- (IBAction) bmh3{
    if (hf33.hidden == YES && hf31.hidden == YES && hf32.hidden == YES) {
        hf33.hidden = NO;
    }
    else if(hf33.hidden == NO && hf31.hidden == YES && hf32.hidden == YES){
        hf32.hidden = NO;
    }
    else if(hf31.hidden == YES && hf33.hidden == NO && hf32.hidden == NO){
        hf31.hidden = NO;
    }
}
- (IBAction) bmh4{
    if (hf43.hidden == YES && hf41.hidden == YES && hf42.hidden == YES) {
        hf43.hidden = NO;
    }
    else if(hf43.hidden == NO && hf41.hidden == YES && hf42.hidden == YES){
        hf42.hidden = NO;
    }
    else if(hf41.hidden == YES && hf43.hidden == NO && hf42.hidden == NO){
        hf41.hidden = NO;
    }
}
- (IBAction) bmh5{
    if (hf53.hidden == YES && hf51.hidden == YES && hf52.hidden == YES) {
        hf53.hidden = NO;
    }
    else if(hf53.hidden == NO && hf51.hidden == YES && hf52.hidden == YES){
        hf52.hidden = NO;
    }
    else if(hf51.hidden == YES && hf53.hidden == NO && hf52.hidden == NO){
        hf51.hidden = NO;
    }
}
- (IBAction) bmh6{
    if (hf63.hidden == YES && hf61.hidden == YES && hf62.hidden == YES) {
        hf63.hidden = NO;
    }
    else if(hf63.hidden == NO && hf61.hidden == YES && hf62.hidden == YES){
        hf62.hidden = NO;
    }
    else if(hf61.hidden == YES && hf63.hidden == NO && hf62.hidden == NO){
        hf61.hidden = NO;
    }
}
- (IBAction) bmh7{
    if (hf73.hidden == YES && hf71.hidden == YES && hf72.hidden == YES) {
        hf73.hidden = NO;
    }
    else if(hf73.hidden == NO && hf71.hidden == YES && hf72.hidden == YES){
        hf72.hidden = NO;
    }
    else if(hf71.hidden == YES && hf73.hidden == NO && hf72.hidden == NO){
        hf71.hidden = NO;
    }
}
- (IBAction) bmh8{
    if (hf83.hidden == YES && hf81.hidden == YES && hf82.hidden == YES) {
        hf83.hidden = NO;
    }
    else if(hf83.hidden == NO && hf81.hidden == YES && hf82.hidden == YES){
        hf82.hidden = NO;
    }
    else if(hf81.hidden == YES && hf83.hidden == NO && hf82.hidden == NO){
        hf81.hidden = NO;
    }
}
- (IBAction) bmh9{
    if (hf93.hidden == YES && hf91.hidden == YES && hf92.hidden == YES) {
        hf93.hidden = NO;
    }
    else if(hf93.hidden == NO && hf91.hidden == YES && hf92.hidden == YES){
        hf92.hidden = NO;
    }
    else if(hf91.hidden == YES && hf93.hidden == NO && hf92.hidden == NO){
        hf91.hidden = NO;
    }
}
- (IBAction) bmh10{
    if (hf103.hidden == YES && hf101.hidden == YES && hf102.hidden == YES) {
        hf103.hidden = NO;
    }
    else if(hf103.hidden == NO && hf101.hidden == YES && hf102.hidden == YES){
        hf102.hidden = NO;
    }
    else if(hf101.hidden == YES && hf103.hidden == NO && hf102.hidden == NO){
        hf101.hidden = NO;
    }
}
- (IBAction) bmh11{
    if (hf113.hidden == YES && hf111.hidden == YES && hf112.hidden == YES) {
        hf113.hidden = NO;
    }
    else if(hf113.hidden == NO && hf111.hidden == YES && hf112.hidden == YES){
        hf112.hidden = NO;
    }
    else if(hf111.hidden == YES && hf113.hidden == NO && hf112.hidden == NO){
        hf111.hidden = NO;
    }
}
- (IBAction) bmh12{
    if (hf123.hidden == YES && hf121.hidden == YES && hf122.hidden == YES) {
        hf123.hidden = NO;
    }
    else if(hf123.hidden == NO && hf121.hidden == YES && hf122.hidden == YES){
        hf122.hidden = NO;
    }
    else if(hf121.hidden == YES && hf123.hidden == NO && hf122.hidden == NO){
        hf121.hidden = NO;
    }
}
- (IBAction) bmh13{
    if (hf133.hidden == YES && hf131.hidden == YES && hf132.hidden == YES) {
        hf133.hidden = NO;
    }
    else if(hf133.hidden == NO && hf131.hidden == YES && hf132.hidden == YES){
        hf132.hidden = NO;
    }
    else if(hf131.hidden == YES && hf133.hidden == NO && hf132.hidden == NO){
        hf131.hidden = NO;
    }
}
- (IBAction) bmh14{
    if (hf143.hidden == YES && hf141.hidden == YES && hf142.hidden == YES) {
        hf143.hidden = NO;
    }
    else if(hf143.hidden == NO && hf141.hidden == YES && hf142.hidden == YES){
        hf142.hidden = NO;
    }
    else if(hf141.hidden == YES && hf143.hidden == NO && hf142.hidden == NO){
        hf141.hidden = NO;
    }
}

- (IBAction) bpa1{
    if (mainStop.hidden == NO) {
        if (af13.hidden == NO && af11.hidden == YES && af12.hidden == YES) {
            af13.hidden = YES;
        }
        if(af12.hidden == NO && af11.hidden == YES){
            af12.hidden = YES;
        }
        if(af11.hidden == NO){
            af11.hidden = YES;
        }
    }
}
- (IBAction) bpa2{
    if (mainStop.hidden == NO) {
        if (af23.hidden == NO && af21.hidden == YES && af22.hidden == YES) {
            af23.hidden = YES;
        }
        if(af22.hidden == NO && af21.hidden == YES){
            af22.hidden = YES;
        }
        if(af21.hidden == NO){
            af21.hidden = YES;
        }
    }
}
- (IBAction) bpa3{
    if (mainStop.hidden == NO) {
        if (af33.hidden == NO && af31.hidden == YES && af32.hidden == YES) {
            af33.hidden = YES;
        }
        if(af32.hidden == NO && af31.hidden == YES){
            af32.hidden = YES;
        }
        if(af31.hidden == NO){
            af31.hidden = YES;
        }
    }
}
- (IBAction) bpa4{
    if (mainStop.hidden == NO) {
        if (af43.hidden == NO && af41.hidden == YES && af42.hidden == YES) {
            af43.hidden = YES;
        }
        if(af42.hidden == NO && af41.hidden == YES){
            af42.hidden = YES;
        }
        if(af41.hidden == NO){
            af41.hidden = YES;
        }
    }
}
- (IBAction) bpa5{
    if (mainStop.hidden == NO) {
        if (af53.hidden == NO && af51.hidden == YES && af52.hidden == YES) {
            af53.hidden = YES;
        }
        if(af52.hidden == NO && af51.hidden == YES){
            af52.hidden = YES;
        }
        if(af51.hidden == NO){
            af51.hidden = YES;
        }
    }
}
- (IBAction) bpa6{
    if (mainStop.hidden == NO) {
        if (af63.hidden == NO && af61.hidden == YES && af62.hidden == YES) {
            af63.hidden = YES;
        }
        if(af62.hidden == NO && af61.hidden == YES){
            af62.hidden = YES;
        }
        if(af61.hidden == NO){
            af61.hidden = YES;
        }
    }
}
- (IBAction) bpa7{
    if (mainStop.hidden == NO) {
        if (af73.hidden == NO && af71.hidden == YES && af72.hidden == YES) {
            af73.hidden = YES;
        }
        if(af72.hidden == NO && af71.hidden == YES){
            af72.hidden = YES;
        }
        if(af71.hidden == NO){
            af71.hidden = YES;
        }
    }
}
- (IBAction) bpa8{
    if (mainStop.hidden == NO) {
        if (af83.hidden == NO && af81.hidden == YES && af82.hidden == YES) {
            af83.hidden = YES;
        }
        if(af82.hidden == NO && af81.hidden == YES){
            af82.hidden = YES;
        }
        if(af81.hidden == NO){
            af81.hidden = YES;
        }
    }
}
- (IBAction) bpa9{
    if (mainStop.hidden == NO) {
        if (af93.hidden == NO && af91.hidden == YES && af92.hidden == YES) {
            af93.hidden = YES;
        }
        if(af92.hidden == NO && af91.hidden == YES){
            af92.hidden = YES;
        }
        if(af91.hidden == NO){
            af91.hidden = YES;
        }
    }
}
- (IBAction) bpa10{
    if (mainStop.hidden == NO) {
        if (af103.hidden == NO && af101.hidden == YES && af102.hidden == YES) {
            af103.hidden = YES;
        }
        if(af102.hidden == NO && af101.hidden == YES){
            af102.hidden = YES;
        }
        if(af101.hidden == NO){
            af101.hidden = YES;
        }
    }
}
- (IBAction) bpa11{
    if (mainStop.hidden == NO) {
        if (af113.hidden == NO && af111.hidden == YES && af112.hidden == YES) {
            af113.hidden = YES;
        }
        if(af112.hidden == NO && af111.hidden == YES){
            af112.hidden = YES;
        }
        if(af111.hidden == NO){
            af111.hidden = YES;
        }
    }
}
- (IBAction) bpa12{
    if (mainStop.hidden == NO) {
        if (af123.hidden == NO && af121.hidden == YES && af122.hidden == YES) {
            af123.hidden = YES;
        }
        if(af122.hidden == NO && af121.hidden == YES){
            af122.hidden = YES;
        }
        if(af121.hidden == NO){
            af121.hidden = YES;
        }
    }
}
- (IBAction) bpa13{
    if (mainStop.hidden == NO) {
        if (af133.hidden == NO && af131.hidden == YES && af132.hidden == YES) {
            af133.hidden = YES;
        }
        if(af132.hidden == NO && af131.hidden == YES){
            af132.hidden = YES;
        }
        if(af131.hidden == NO){
            af131.hidden = YES;
        }
    }
}
- (IBAction) bpa14{
    if (mainStop.hidden == NO) {
        if (af143.hidden == NO && af141.hidden == YES && af142.hidden == YES) {
            af143.hidden = YES;
        }
        if(af142.hidden == NO && af141.hidden == YES){
            af142.hidden = YES;
        }
        if(af141.hidden == NO){
            af141.hidden = YES;
        }
    }
}

- (IBAction) bma1{
    if (af13.hidden == YES && af11.hidden == YES && af12.hidden == YES) {
        af13.hidden = NO;
    }
    else if(af13.hidden == NO && af11.hidden == YES && af12.hidden == YES){
        af12.hidden = NO;
    }
    else if(af11.hidden == YES && af13.hidden == NO && af12.hidden == NO){
        af11.hidden = NO;
    }
}
- (IBAction) bma2{
    if (af23.hidden == YES && af21.hidden == YES && af22.hidden == YES) {
        af23.hidden = NO;
    }
    else if(af23.hidden == NO && af21.hidden == YES && af22.hidden == YES){
        af22.hidden = NO;
    }
    else if(af21.hidden == YES && af23.hidden == NO && af22.hidden == NO){
        af21.hidden = NO;
    }
    
}
- (IBAction) bma3{
    if (af33.hidden == YES && af31.hidden == YES && af32.hidden == YES) {
        af33.hidden = NO;
    }
    else if(af33.hidden == NO && af31.hidden == YES && af32.hidden == YES){
        af32.hidden = NO;
    }
    else if(af31.hidden == YES && af33.hidden == NO && af32.hidden == NO){
        af31.hidden = NO;
    }
}
- (IBAction) bma4{
    if (af43.hidden == YES && af41.hidden == YES && af42.hidden == YES) {
        af43.hidden = NO;
    }
    else if(af43.hidden == NO && af41.hidden == YES && af42.hidden == YES){
        af42.hidden = NO;
    }
    else if(af41.hidden == YES && af43.hidden == NO && af42.hidden == NO){
        af41.hidden = NO;
    }
}
- (IBAction) bma5{
    if (af53.hidden == YES && af51.hidden == YES && af52.hidden == YES) {
        af53.hidden = NO;
    }
    else if(af53.hidden == NO && af51.hidden == YES && af52.hidden == YES){
        af52.hidden = NO;
    }
    else if(af51.hidden == YES && af53.hidden == NO && af52.hidden == NO){
        af51.hidden = NO;
    }
}
- (IBAction) bma6{
    if (af63.hidden == YES && af61.hidden == YES && af62.hidden == YES) {
        af63.hidden = NO;
    }
    else if(af63.hidden == NO && af61.hidden == YES && af62.hidden == YES){
        af62.hidden = NO;
    }
    else if(af61.hidden == YES && af63.hidden == NO && af62.hidden == NO){
        af61.hidden = NO;
    }
}
- (IBAction) bma7{
    if (af73.hidden == YES && af71.hidden == YES && af72.hidden == YES) {
        af73.hidden = NO;
    }
    else if(af73.hidden == NO && af71.hidden == YES && af72.hidden == YES){
        af72.hidden = NO;
    }
    else if(af71.hidden == YES && af73.hidden == NO && af72.hidden == NO){
        af71.hidden = NO;
    }
}
- (IBAction) bma8{
    if (af83.hidden == YES && af81.hidden == YES && af82.hidden == YES) {
        af83.hidden = NO;
    }
    else if(af83.hidden == NO && af81.hidden == YES && af82.hidden == YES){
        af82.hidden = NO;
    }
    else if(af81.hidden == YES && af83.hidden == NO && af82.hidden == NO){
        af81.hidden = NO;
    }
}
- (IBAction) bma9{
    if (af93.hidden == YES && af91.hidden == YES && af92.hidden == YES) {
        af93.hidden = NO;
    }
    else if(af93.hidden == NO && af91.hidden == YES && af92.hidden == YES){
        af92.hidden = NO;
    }
    else if(af91.hidden == YES && af93.hidden == NO && af92.hidden == NO){
        af91.hidden = NO;
    }
}
- (IBAction) bma10{
    if (af103.hidden == YES && af101.hidden == YES && af102.hidden == YES) {
        af103.hidden = NO;
    }
    else if(af103.hidden == NO && af101.hidden == YES && af102.hidden == YES){
        af102.hidden = NO;
    }
    else if(af101.hidden == YES && af103.hidden == NO && af102.hidden == NO){
        af101.hidden = NO;
    }
}
- (IBAction) bma11{
    if (af113.hidden == YES && af111.hidden == YES && af112.hidden == YES) {
        af113.hidden = NO;
    }
    else if(af113.hidden == NO && af111.hidden == YES && af112.hidden == YES){
        af112.hidden = NO;
    }
    else if(af111.hidden == YES && af113.hidden == NO && af112.hidden == NO){
        af111.hidden = NO;
    }
}
- (IBAction) bma12{
    if (af123.hidden == YES && af121.hidden == YES && af122.hidden == YES) {
        af123.hidden = NO;
    }
    else if(af123.hidden == NO && af121.hidden == YES && af122.hidden == YES){
        af122.hidden = NO;
    }
    else if(af121.hidden == YES && af123.hidden == NO && af122.hidden == NO){
        af121.hidden = NO;
    }
}
- (IBAction) bma13{
    if (af133.hidden == YES && af131.hidden == YES && af132.hidden == YES) {
        af133.hidden = NO;
    }
    else if(af133.hidden == NO && af131.hidden == YES && af132.hidden == YES){
        af132.hidden = NO;
    }
    else if(af131.hidden == YES && af133.hidden == NO && af132.hidden == NO){
        af131.hidden = NO;
    }
}
- (IBAction) bma14{
    if (af143.hidden == YES && af141.hidden == YES && af142.hidden == YES) {
        af143.hidden = NO;
    }
    else if(af143.hidden == NO && af141.hidden == YES && af142.hidden == YES){
        af142.hidden = NO;
    }
    else if(af141.hidden == YES && af143.hidden == NO && af142.hidden == NO){
        af141.hidden = NO;
    }
}

- (IBAction)incLength{
    if (len < 10 && qt == 1) {
        len++;
        [[NSUserDefaults standardUserDefaults] setInteger:len forKey:@"gameLength"];
        length.text = [NSString stringWithFormat:@"%ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"gameLength"]];
        //mainTimer.text = [NSString stringWithFormat:@"%d:0%d",mainMinutes,currentTime];
        if (currentTime < 10){
            if (mainMinutes == 0){
                mainTimer.text = [NSString stringWithFormat:@"%ld:00",(long)len];
            }
            else{
                mainTimer.text = [NSString stringWithFormat:@"%d:0%d",mainMinutes,currentTime];
            }
        }
        else{
            mainTimer.text = [NSString stringWithFormat:@"%d:%d",mainMinutes,currentTime];
        }
    }
}

- (IBAction)decLength{
    if (len > 4 && qt == 1) {
        len--;
        [[NSUserDefaults standardUserDefaults] setInteger:len forKey:@"gameLength"];
        length.text = [NSString stringWithFormat:@"%ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"gameLength"]];
        //mainTimer.text = [NSString stringWithFormat:@"%d:0%d",mainMinutes,currentTime];
        if (currentTime < 10){
            if (mainMinutes == 0){
                mainTimer.text = [NSString stringWithFormat:@"%ld:00",(long)len];
            }
            else{
                mainTimer.text = [NSString stringWithFormat:@"%d:0%d",mainMinutes,currentTime];
            }
        }
        else{
            mainTimer.text = [NSString stringWithFormat:@"%d:%d",mainMinutes,currentTime];
        }
    }
}

- (IBAction)saveNames{
    [[NSUserDefaults standardUserDefaults] setObject:homeName.text forKey:@"TeamName"];
    homeTeam.text = homeName.text;
    awayTeam.text = awayName.text;
            length.hidden = YES;
        lengthp.hidden = YES;
        lengthm.hidden = YES;
        saveName.hidden = YES;
        homeName.hidden = YES;
        awayName.hidden = YES;
        backSet.hidden = YES;
        menuLength.hidden = YES;
        menuHome.hidden = YES;
        menuAway.hidden = YES;
    [homeName resignFirstResponder];
    [awayName resignFirstResponder];
}

- (IBAction)setting{
    if (length.hidden == YES) {
        length.hidden = NO;
        lengthp.hidden = NO;
        lengthm.hidden = NO;
        saveName.hidden = NO;
        homeName.hidden = NO;
        awayName.hidden = NO;
        backSet.hidden = NO;
        menuLength.hidden = NO;
        menuHome.hidden = NO;
        menuAway.hidden = NO;
    }
    else{
        length.hidden = YES;
        lengthp.hidden = YES;
        lengthm.hidden = YES;
        saveName.hidden = YES;
        homeName.hidden = YES;
        awayName.hidden = YES;
        backSet.hidden = YES;
        menuLength.hidden = YES;
        menuHome.hidden = YES;
        menuAway.hidden = YES;
    }
    [homeName resignFirstResponder];
    [awayName resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
