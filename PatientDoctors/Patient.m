//
//  Patient.m
//  PatientDoctors
//
//  Created by Enoch Ng on 2016-05-05.
//  Copyright © 2016 Enoch Ng. All rights reserved.
//

#import "Patient.h"
#import "Doctor.h"
#import "HistoryEntry.h"

@implementation Patient

-(instancetype)initWithName:(NSString *)name andAge:(int)age andSymptom:(NSString *)symptom andHasValidHealthCard:(BOOL)hasValidHealthCard{
    self = [super init];
    if(self){
        _name = name;
        _age = age;
        _hasValidHealthCard = hasValidHealthCard;
        _patientHistory = [[NSMutableSet alloc] init];
        _symptom = symptom;
    }
    return self;
}

-(void)visitDoctor:(Doctor *)doctor{
    
//    [doctor intakePatient:self];
    
    
    if([doctor checkHealthCardof:self]){
        [doctor updatePatientList:self];
        NSLog(@"%@ visited %@ and was accepted. Doctor %@'s patient ist was updated as well",self.name,doctor.name,doctor.name);
    } else {
        NSLog(@"%@ visited %@ and was denied because health card wasn't valid",self.name,doctor.name);
    }
}

-(void)requestMedicationFrom:(Doctor *)doctor whoAdheresToGuidelines:(NSDictionary *)guidelinesForPrescription{
    if([doctor existInPatientList:self]){
        NSLog(@"%@ checked that %@ was accepted in his list previously",doctor.name,self.name);
        
        NSString *prescription = [doctor checkSymtomsAndPrescribe:self with:(NSDictionary *)guidelinesForPrescription];
        
        NSLog(@"%@ checked %@ who had %@ and gave him %@ according to the guidelines of prescription",doctor.name,self.name,self.symptom,[guidelinesForPrescription valueForKey:self.symptom]);
        
        HistoryEntry *newHistoryEntry = [[HistoryEntry alloc] initWithDoctor:doctor andPrescription:prescription];
        
        [doctor updatePatientHistoryOf:self withEntry:newHistoryEntry];
        
        NSLog(@"%@ also updated %@'s presciption history so that other doctors could see.",doctor.name,self.name);
        
    } else {
        
        NSLog(@"%@ checked that %@ wasn't accepted in his list previously so no medication was prescribed",doctor.name,self.name);
    }
}

-(void)getSickAgain{
    int luck = arc4random_uniform(2);
    
    if(luck == 0){
        self.symptom = @"flu";
        NSLog(@"%@ caught the %@ again",self.name,self.symptom);
    } else if (luck == 1){
        self.symptom = @"cold";
        NSLog(@"%@ caught the %@ again",self.name,self.symptom);
    } else if(luck == 2){
        self.symptom = @"fever";
        NSLog(@"%@ caught the %@ again",self.name,self.symptom);
    }
    
    
}


@end
