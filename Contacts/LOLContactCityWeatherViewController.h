//
//  LOLContactCityWeaterViewController.h
//  Contacts
//
//  Created by ios4609 on 25/08/14.
//  Copyright (c) 2014 Rafael França. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <AFNetworking/AFNetworking.h>
#import "LOLContact.h"

@interface LOLContactCityWeatherViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *iconWeatherImage;
@property (weak, nonatomic) IBOutlet UILabel *minTemperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxTemperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *conditionLabel;
@property (weak, nonatomic) LOLContact *contact;

@end
