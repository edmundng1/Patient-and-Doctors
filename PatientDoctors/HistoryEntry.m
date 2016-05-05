//
//  HistoryEntry.m
//  PatientDoctors
//
//  Created by Enoch Ng on 2016-05-05.
//  Copyright © 2016 Enoch Ng. All rights reserved.
//

#import "HistoryEntry.h"
#import "Doctor.h"

@implementation HistoryEntry

-(instancetype)initWithDoctor:(Doctor *)doctor andPrescription:(NSString *)prescription{
    self = [super init];
    if(self){
        _doctorWhoPrescribed = doctor;
        _prescription = prescription;
    }
    return self;
}

@end
