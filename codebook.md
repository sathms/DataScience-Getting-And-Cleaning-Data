# Code Book

## Data collection method from the original source: 

a) The features come from the accelerometer and gyroscope 3-axial raw signals in a smartphone.
b) The time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
c) The acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
d) The body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. 
e) Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals. 
f) '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## Following is brief Summary of data fields `tidy_dataset.txt`.

## Identifiers

* `activityType` - Type of activity performed when the corresponding measurements were taken
* `subjectId` -    ID of the test subject

## Measurements

* 'FrequencyDomainBodyAccJerk-std-Z'
* 'FrequencyDomainBodyAccJerk-meanFreq-X'
* 'FrequencyDomainBodyAccJerk-meanFreq-Y'
* 'FrequencyDomainBodyAccJerk-meanFreq-Z'
* 'FrequencyDomainBodyGyro-mean-X'
* 'FrequencyDomainBodyGyro-mean-Y'
* 'FrequencyDomainBodyGyro-mean-Z'
* 'FrequencyDomainBodyGyro-std-X'
* 'FrequencyDomainBodyGyro-std-Y'
* 'FrequencyDomainBodyGyro-std-Z'
* 'FrequencyDomainBodyGyro-meanFreq-X'
* 'FrequencyDomainBodyGyro-meanFreq-Y'
* 'FrequencyDomainBodyGyro-meanFreq-Z'
* 'FrequencyDomainBodyAccMagnitude-mean'
* 'FrequencyDomainBodyAccMagnitude-std'
* 'FrequencyDomainBodyAccMagnitude-meanFrequency'
* 'FrequencyDomainBodyBodyAccJerkMagnitude-mean'
* 'FrequencyDomainBodyBodyAccJerkMagnitude-std'
* 'FrequencyDomainBodyBodyAccJerkMagnitude-meanFrequency'
* 'FrequencyDomainBodyBodyGyroMagnitude-mean'
* 'FrequencyDomainBodyBodyGyroMagnitude-std'
* 'FrequencyDomainBodyBodyGyroMagnitude-meanFrequency'
* 'FrequencyDomainBodyBodyGyroJerkMagnitude-mean'
* 'FrequencyDomainBodyBodyGyroJerkMagnitude-std'
* 'FrequencyDomainBodyBodyGyroJerkMagnitude-meanFrequency'
* 'angletBodyAccMean,gravity'
* 'angletBodyAccJerkMean,gravityMean'
* 'angletBodyGyroMean,gravityMean'
* 'angletBodyGyroJerkMean,gravityMean'
* 'angleX,gravityMean'
* 'angleY,gravityMean'
* 'angleZ,gravityMean'
