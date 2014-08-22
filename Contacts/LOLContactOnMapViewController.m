//
//  LOLContactOnMapViewController.m
//  Contacts
//
//  Created by ios4609 on 20/08/14.
//  Copyright (c) 2014 Rafael França. All rights reserved.
//

#import "LOLContactOnMapViewController.h"

@interface LOLContactOnMapViewController ()

@end

@implementation LOLContactOnMapViewController

-(id)init
{
    self = [super init];
    if (self) {
        UIImage *img = [UIImage imageNamed:@"mapa_contatos"];
        UITabBarItem *tbi = [[UITabBarItem alloc] initWithTitle:@"Maps" image:img tag:0];
        self.tabBarItem = tbi;
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
    MKUserTrackingBarButtonItem *trackingButton = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.mapView];
    self.navigationItem.leftBarButtonItem = trackingButton;
    self.mapView.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.mapView addAnnotations:self.contacts];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [self.mapView removeAnnotations:self.contacts];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    } else {
        static NSString *pool = @"annotation";
        MKPinAnnotationView *pin = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:pool];

        if (!pin) {
            pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pool];
        } else {
            pin.annotation = annotation;
        }
        
        pin.pinColor = MKPinAnnotationColorPurple;
        pin.canShowCallout = YES;
        LOLContact *contact = (LOLContact *) annotation;
        
        if (contact.photo) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
            imageView.image = contact.photo;
            pin.leftCalloutAccessoryView = imageView;
        }
        
        return pin;
    }
}

@end
