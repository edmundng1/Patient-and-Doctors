//
//  Doctor.m
//  PatientDoctors
//
//  Created by Enoch Ng on 2016-05-05.
//  Copyright © 2016 Enoch Ng. All rights reserved.
//

#import "Doctor.h"
#import "Patient.h"
#import "HistoryEntry.h"

@implementation Doctor

-(instancetype)initWithName:(NSString *)name andSpecialization:(NSString *)specialization{
    self = [super init];
    if(self){
        _name = name;
        _specialization = specialization;
        _patientList = [[NSMutableSet alloc] init];
    }
    return self;
}

-(BOOL)checkHealthCardof:(Patient *)patient{
    if(patient.hasValidHealthCard){
        return YES;
    } else {
        return NO;
    }
}

-(void)updatePatientList:(Patient *)patient{
    if(![self.patientList containsObject:patient]){
        [_patientList addObject:patient];
    }else {
    
    }
    
}

-(BOOL)existInPatientList:(Patient *)patient{
    return [_patientList containsObject:patient];
}


-(NSString *)checkSymtomsAndPrescribe:(Patient *)patient with:(NSDictionary *)guidelinesForPrescription{
    return [guidelinesForPrescription valueForKey:patient.symptom];
}

-(void)updatePatientHistoryOf:(Patient *)patient withEntry:(HistoryEntry *)newEntry{
    [patient.patientHistory addObject:newEntry];
}


@end
