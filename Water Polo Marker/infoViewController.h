//
//  infoViewController.h
//  Water Polo ScoreBoard
//
//  Created by Daniel Medina on 1/28/14.
//  Copyright (c) 2014 Medalabs Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface infoViewController : UIViewController{
    IBOutlet UIButton *pagina;
    IBOutlet UIButton *loopeight;
    IBOutlet UIButton *Donation;
    IBOutlet UIButton *back_btn;
}

-(IBAction) back;
-(IBAction) appWebsite;
-(IBAction) webloopeight;
-(IBAction) Donations;

@end
