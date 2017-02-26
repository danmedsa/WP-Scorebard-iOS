//
//  Water_Polo_MarkerViewController.h
//  Water Polo Marker
//
//  Created by Daniel Medina on 8/24/13.
//  Copyright (c) 2013 Medalabs Development. All rights reserved.
//

#import "infoViewController.h"
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface Water_Polo_MarkerViewController : UIViewController <AVAudioPlayerDelegate,UITextFieldDelegate>
{
    IBOutlet UIButton *resetGame;
    IBOutlet UIButton *settings;
    
    BOOL newqtr;
    BOOL AwayFoulRunning;
    BOOL HomeFoulRunning;
    
    IBOutlet UIButton *lengthp;
    IBOutlet UIButton *lengthm;
    IBOutlet UIButton *saveName;

    IBOutlet UILabel *homeTeam;
    IBOutlet UILabel *awayTeam;
    
    IBOutlet UILabel *Hposper;
    IBOutlet UILabel *Aposper;
    
    float Homeposp;
    float Awayposp;
    int posTime;
    
    IBOutlet UIImageView *backSet;
    
    IBOutlet UITextField *homeName;
    IBOutlet UITextField *awayName;

    IBOutlet UILabel *menuHome;
    IBOutlet UILabel *menuAway;
    IBOutlet UILabel *length;
    IBOutlet UILabel *menuLength;
    
    int currentTime;

    IBOutlet UILabel *mainTimer;
    IBOutlet UILabel *Quarter;
        
    IBOutlet UILabel *thirtysec;
    
    float pauseTime;
    
    IBOutlet UILabel * hftimerlbl;
    IBOutlet UILabel * aftimerlbl;
    
    IBOutlet UILabel *HomeScorelbl;
    IBOutlet UILabel *AwayScorelbl;
    
    int HomeScore;
    int AwayScore;
    NSDate *lostTime;
    
    AVAudioPlayer *quartedbuzz;
    AVAudioPlayer *thirtybuzz;
    
    NSDate *startDate;
    NSDate *currentDate;
    NSDate *pauseDate;
    float timeElapsing;
    
    int thirty;
    
    int mainMinutes;
    float timeStart;
    
    int thirtytimer;
    
    
    int hmftimer;
    int awftimer;
    int h1;
    int h2;
    int h3;
    int h4;
    int h5;
    int h6;
    int h7;
    int h8;
    int h9;
    int h10;
    int h11;
    int h12;
    int h13;
    int h14;
    
    int a1;
    int a2;
    int a3;
    int a4;
    int a5;
    int a6;
    int a7;
    int a8;
    int a9;
    int a10;
    int a11;
    int a12;
    int a13;
    int a14;
    
    IBOutlet UIButton *HomeScp;
    IBOutlet UIButton *HomeScm;
    
    IBOutlet UIButton *AwayScp;
    IBOutlet UIButton *AwayScm;
    
    IBOutlet UIButton *hposbtn;
    IBOutlet UIButton *aposbtn;
//    
//    IBOutlet UIButton *info;
    
    IBOutlet UIButton *ph1;
    IBOutlet UIButton *ph2;
    IBOutlet UIButton *ph3;
    IBOutlet UIButton *ph4;
    IBOutlet UIButton *ph5;
    IBOutlet UIButton *ph6;
    IBOutlet UIButton *ph7;
    IBOutlet UIButton *ph8;
    IBOutlet UIButton *ph9;
    IBOutlet UIButton *ph10;
    IBOutlet UIButton *ph11;
    IBOutlet UIButton *ph12;
    IBOutlet UIButton *ph13;
    IBOutlet UIButton *ph14;
    
    IBOutlet UIButton *mh1;
    IBOutlet UIButton *mh2;
    IBOutlet UIButton *mh3;
    IBOutlet UIButton *mh4;
    IBOutlet UIButton *mh5;
    IBOutlet UIButton *mh6;
    IBOutlet UIButton *mh7;
    IBOutlet UIButton *mh8;
    IBOutlet UIButton *mh9;
    IBOutlet UIButton *mh10;
    IBOutlet UIButton *mh11;
    IBOutlet UIButton *mh12;
    IBOutlet UIButton *mh13;
    IBOutlet UIButton *mh14;
    
    IBOutlet UIButton *pa1;
    IBOutlet UIButton *pa2;
    IBOutlet UIButton *pa3;
    IBOutlet UIButton *pa4;
    IBOutlet UIButton *pa5;
    IBOutlet UIButton *pa6;
    IBOutlet UIButton *pa7;
    IBOutlet UIButton *pa8;
    IBOutlet UIButton *pa9;
    IBOutlet UIButton *pa10;
    IBOutlet UIButton *pa11;
    IBOutlet UIButton *pa12;
    IBOutlet UIButton *pa13;
    IBOutlet UIButton *pa14;
    
    IBOutlet UIButton *ma1;
    IBOutlet UIButton *ma2;
    IBOutlet UIButton *ma3;
    IBOutlet UIButton *ma4;
    IBOutlet UIButton *ma5;
    IBOutlet UIButton *ma6;
    IBOutlet UIButton *ma7;
    IBOutlet UIButton *ma8;
    IBOutlet UIButton *ma9;
    IBOutlet UIButton *ma10;
    IBOutlet UIButton *ma11;
    IBOutlet UIButton *ma12;
    IBOutlet UIButton *ma13;
    IBOutlet UIButton *ma14;
//    IBOutlet UIButton *hftimerbtn;
//    IBOutlet UIButton *aftimerbtn;
    
    NSTimer *countDown;
    NSTimer *thirtyCdown;
    NSTimer *hftimer;
    NSTimer *aftimer;
    
    IBOutlet UIButton *mainStartbtn;
    IBOutlet UIButton *mainStop;
    IBOutlet UIButton *resumeMain;
    IBOutlet UIButton *resetThirty;
    
    IBOutlet UIImageView *buzLight;
    
    IBOutlet UIImageView *hpos;
    IBOutlet UIImageView *apos;
    
    IBOutlet UIImageView *hf11;
    IBOutlet UIImageView *hf12;
    IBOutlet UIImageView *hf13;
    
    IBOutlet UIImageView *hf21;
    IBOutlet UIImageView *hf22;
    IBOutlet UIImageView *hf23;
    
    IBOutlet UIImageView *hf31;
    IBOutlet UIImageView *hf32;
    IBOutlet UIImageView *hf33;
    
    IBOutlet UIImageView *hf41;
    IBOutlet UIImageView *hf42;
    IBOutlet UIImageView *hf43;
    
    IBOutlet UIImageView *hf51;
    IBOutlet UIImageView *hf52;
    IBOutlet UIImageView *hf53;
    
    IBOutlet UIImageView *hf61;
    IBOutlet UIImageView *hf62;
    IBOutlet UIImageView *hf63;
    
    IBOutlet UIImageView *hf71;
    IBOutlet UIImageView *hf72;
    IBOutlet UIImageView *hf73;

    IBOutlet UIImageView *hf81;
    IBOutlet UIImageView *hf82;
    IBOutlet UIImageView *hf83;

    IBOutlet UIImageView *hf91;
    IBOutlet UIImageView *hf92;
    IBOutlet UIImageView *hf93;

    IBOutlet UIImageView *hf101;
    IBOutlet UIImageView *hf102;
    IBOutlet UIImageView *hf103;
    
    IBOutlet UIImageView *hf111;
    IBOutlet UIImageView *hf112;
    IBOutlet UIImageView *hf113;
    
    IBOutlet UIImageView *hf121;
    IBOutlet UIImageView *hf122;
    IBOutlet UIImageView *hf123;

    IBOutlet UIImageView *hf131;
    IBOutlet UIImageView *hf132;
    IBOutlet UIImageView *hf133;
    
    IBOutlet UIImageView *hf141;
    IBOutlet UIImageView *hf142;
    IBOutlet UIImageView *hf143;
    
    IBOutlet UIImageView *af11;
    IBOutlet UIImageView *af12;
    IBOutlet UIImageView *af13;
    
    IBOutlet UIImageView *af21;
    IBOutlet UIImageView *af22;
    IBOutlet UIImageView *af23;
    
    IBOutlet UIImageView *af31;
    IBOutlet UIImageView *af32;
    IBOutlet UIImageView *af33;
    
    IBOutlet UIImageView *af41;
    IBOutlet UIImageView *af42;
    IBOutlet UIImageView *af43;
    
    IBOutlet UIImageView *af51;
    IBOutlet UIImageView *af52;
    IBOutlet UIImageView *af53;
    
    IBOutlet UIImageView *af61;
    IBOutlet UIImageView *af62;
    IBOutlet UIImageView *af63;
    
    IBOutlet UIImageView *af71;
    IBOutlet UIImageView *af72;
    IBOutlet UIImageView *af73;
    
    IBOutlet UIImageView *af81;
    IBOutlet UIImageView *af82;
    IBOutlet UIImageView *af83;
    
    IBOutlet UIImageView *af91;
    IBOutlet UIImageView *af92;
    IBOutlet UIImageView *af93;
    
    IBOutlet UIImageView *af101;
    IBOutlet UIImageView *af102;
    IBOutlet UIImageView *af103;
    
    IBOutlet UIImageView *af111;
    IBOutlet UIImageView *af112;
    IBOutlet UIImageView *af113;
    
    IBOutlet UIImageView *af121;
    IBOutlet UIImageView *af122;
    IBOutlet UIImageView *af123;
    
    IBOutlet UIImageView *af131;
    IBOutlet UIImageView *af132;
    IBOutlet UIImageView *af133;
    
    IBOutlet UIImageView *af141;
    IBOutlet UIImageView *af142;
    IBOutlet UIImageView *af143;
}


- (void)timerStart;
- (void)setstarterTimer;

- (IBAction)resetGameSet;

- (IBAction)mainStart;
- (IBAction)mainStoptime;
- (IBAction)resumeMainTimer;

- (void)thirtyQreset;
- (IBAction)resetThirtytimer;

-(IBAction)HomeScoreplus;
-(IBAction)HomeScoreminus;

-(IBAction)AwayScoreplus;
-(IBAction)AwayScoreminus;

- (void)positionchange;
- (IBAction)homepos;
- (IBAction)awaypos;

- (IBAction)bph1;
- (IBAction)bph2;
- (IBAction) bph3;
- (IBAction) bph4;
- (IBAction) bph5;
- (IBAction) bph6;
- (IBAction) bph7;
- (IBAction) bph8;
- (IBAction) bph9;
- (IBAction) bph10;
- (IBAction) bph11;
- (IBAction) bph12;
- (IBAction) bph13;
- (IBAction) bph14;

- (IBAction) bmh1;
- (IBAction) bmh2;
- (IBAction) bmh3;
- (IBAction) bmh4;
- (IBAction) bmh5;
- (IBAction) bmh6;
- (IBAction) bmh7;
- (IBAction) bmh8;
- (IBAction) bmh9;
- (IBAction) bmh10;
- (IBAction) bmh11;
- (IBAction) bmh12;
- (IBAction) bmh13;
- (IBAction) bmh14;

- (IBAction) bpa1;
- (IBAction) bpa2;
- (IBAction) bpa3;
- (IBAction) bpa4;
- (IBAction) bpa5;
- (IBAction) bpa6;
- (IBAction) bpa7;
- (IBAction) bpa8;
- (IBAction) bpa9;
- (IBAction) bpa10;
- (IBAction) bpa11;
- (IBAction) bpa12;
- (IBAction) bpa13;
- (IBAction) bpa14;

- (IBAction) bma1;
- (IBAction) bma2;
- (IBAction) bma3;
- (IBAction) bma4;
- (IBAction) bma5;
- (IBAction) bma6;
- (IBAction) bma7;
- (IBAction) bma8;
- (IBAction) bma9;
- (IBAction) bma10;
- (IBAction) bma11;
- (IBAction) bma12;
- (IBAction) bma13;
- (IBAction) bma14;
- (IBAction)hftimer;
- (IBAction)aftimer;

- (IBAction)incLength;
- (IBAction)decLength;
- (IBAction)saveNames;
- (IBAction)setting;

- (void)possesionStat:(float)currTime;
- (BOOL)homePossession;

@end
