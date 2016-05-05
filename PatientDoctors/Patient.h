//
//  Patient.h
//  PatientDoctors
//
//  Created by Enoch Ng on 2016-05-05.
//  Copyright © 2016 Enoch Ng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Doctor;

@interface Patient : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) int *age;
@property (nonatomic) BOOL hasValidHealthCard;
@property (nonatomic) NSString *symptom;
@property (nonatomic) NSMutableSet *patientHistory;

-(instancetype)initWithName:(NSString *)name andAge:(int)age andSymptom:(NSString *)symptom andHasValidHealthCard:(BOOL)hasValidHealthCard;

-(void)visitDoctor:(Doctor *)doctor;

-(void)requestMedicationFrom:(Doctor *)doctor whoAdheresToGuidelines:(NSDictionary *)guidelinesForPrescription;

-(void)getSickAgain;

@end
