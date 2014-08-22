//
//  LOLContactOnMapViewController.h
//  Contacts
//
//  Created by ios4609 on 20/08/14.
//  Copyright (c) 2014 Rafael França. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "LOLContact.h"

@interface LOLContactOnMapViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) NSMutableArray *contacts;

@end
