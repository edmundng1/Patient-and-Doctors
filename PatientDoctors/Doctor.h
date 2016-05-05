//
//  Doctor.h
//  PatientDoctors
//
//  Created by Enoch Ng on 2016-05-05.
//  Copyright © 2016 Enoch Ng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HistoryEntry;
@class Patient;

@interface Doctor : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *specialization;
@property (nonatomic) NSMutableSet *patientList;

-(instancetype)initWithName:(NSString *)name andSpecialization:(NSString *)specialization;

-(BOOL)checkHealthCardof:(Patient *)patient;

-(void)updatePatientList:(Patient *)patient;

-(BOOL)existInPatientList:(Patient *)patient;

-(NSString *)checkSymtomsAndPrescribe:(Patient *)patient with:(NSDictionary *)guidelinesForPrescription;

-(void)updatePatientHistoryOf:(Patient *)patient withEntry:(HistoryEntry *)newEntry;

@end