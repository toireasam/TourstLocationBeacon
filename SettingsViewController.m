//
//  SettingsViewController.m
//  TouristLocationBeacon
//
//  Created by Toireasa Moley on 05/12/2015.
//  Copyright © 2015 jaalee. All rights reserved.
//
#import "JLEDistance.h"
#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UIButton *myButton;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property (weak, nonatomic) IBOutlet UITextField *myText;


@end

@implementation SettingsViewController
@synthesize prefs;
NSString * text;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.mySwitch addTarget:self
                      action:@selector(stateChanged:) forControlEvents:UIControlEventValueChanged];

    
    
    prefs = [NSUserDefaults standardUserDefaults];
    
    NSString *myString = [prefs stringForKey:@"NewString"];
    NSLog(myString);
    NSLog(@"hi");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(UIButton *)sender {
    if ([self.mySwitch isOn]) {
        self.myText.text = @"The Switch is Off";
        NSLog(@"Switch is off");
        // saving an NSString
        [self.mySwitch setOn:NO animated:YES];
        
    } else {
        self.myText.text = @"The Switch is On";
        [self.mySwitch setOn:YES animated:YES];
    }
}

- (void)stateChanged:(UISwitch *)switchState
{
    if ([switchState isOn]) {
        self.myText.text = @"The Switch is On";
        text = @"on";
    } else {
        self.myText.text = @"The Switch is Off";
        text = @"off";
        [self setPrefs];
    }
}

-(void)setPrefs
{
    prefs = [NSUserDefaults standardUserDefaults];
    
    [prefs setObject:@"Offhere" forKey:@"NewString"];
    [prefs synchronize];
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"distance"]) {
        JLEDistance *nextVC = (JLEDistance *)[segue destinationViewController];
        nextVC.hallPreference = text;
        
        
    }
}


@end
