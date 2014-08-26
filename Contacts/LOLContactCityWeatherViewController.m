//
//  LOLContactCityWeaterViewController.m
//  Contacts
//
//  Created by ios4609 on 25/08/14.
//  Copyright (c) 2014 Rafael França. All rights reserved.
//

#import "LOLContactCityWeatherViewController.h"

@interface LOLContactCityWeatherViewController ()

@end

@implementation LOLContactCityWeatherViewController

static NSString const *BASE_URL = @"http://api.openweathermap.org/data/2.5/weather?";
static NSString const *BASE_URL_IMAGE = @"http://openweathermap.org/img/w/";

- (id)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Weather";
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *url = [NSString stringWithFormat:@"%@lat=%@&lon=%@&units=metric", BASE_URL, self.contact.latitude, self.contact.longitude];
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:url parameters:nil error:nil];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"application/json"]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *response = (NSDictionary *)responseObject;
        NSDictionary *main = response[@"main"];
        NSArray *weathers = response[@"weather"];
        NSDictionary *weather = weathers[0];
        self.minTemperatureLabel.text = [main[@"temp_min"] stringValue];
        self.maxTemperatureLabel.text = [main[@"temp_max"] stringValue];
        self.conditionLabel.text = weather[@"main"];
        [self fetchImage: weather[@"icon"]];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
    [operation start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchImage:(NSString *)iconCode
{
    NSString *iconURL = [NSString stringWithFormat:@"%@%@.png", BASE_URL_IMAGE, iconCode];
    NSURL *url = [NSURL URLWithString:iconURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.iconWeatherImage setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        self.iconWeatherImage.image = image;
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        NSLog(@"%@", error);
    }];
}

@end
