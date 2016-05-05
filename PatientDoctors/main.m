//
//  main.m
//  PatientDoctors
//
//  Created by Enoch Ng on 2016-05-05.
//  Copyright © 2016 Enoch Ng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Doctor.h"
#import "Patient.h"
#import "HistoryEntry.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary *guidelinesForPrescription = @{@"flu" : @"Drug A",@"cold" : @"Drug B",@"fever":@"Drug C"};
        
        Doctor *drDre = [[Doctor alloc] initWithName:@"Dr.Dre" andSpecialization:@"interal"];
        Doctor *drPepper = [[Doctor alloc] initWithName:@"Dr.Pepper" andSpecialization:@"external"];
        
        Patient *myPatient = [[Patient alloc] initWithName:@"Humpty" andAge:10 andSymptom:@"flu"  andHasValidHealthCard:YES];
     
        Patient *deadPatient = [[Patient alloc] initWithName:@"NoCardMan" andAge:91 andSymptom:@"flu"  andHasValidHealthCard:NO];
        
        [deadPatient visitDoctor:drDre];
        
        [myPatient visitDoctor:drDre];
        [myPatient requestMedicationFrom:drDre whoAdheresToGuidelines:guidelinesForPrescription];
        
        [myPatient getSickAgain];
        [myPatient requestMedicationFrom:drPepper whoAdheresToGuidelines:guidelinesForPrescription];
        
        [myPatient visitDoctor:drPepper];
        [myPatient requestMedicationFrom:drPepper whoAdheresToGuidelines:guidelinesForPrescription];
        
        NSLog(@"\nFinal patient history of %@:",myPatient.name);
        for(HistoryEntry *entries in myPatient.patientHistory){
            NSLog(@"%@   %@", entries.doctorWhoPrescribed.name, entries.prescription);
        
        }
        
    }
    return 0;
}
