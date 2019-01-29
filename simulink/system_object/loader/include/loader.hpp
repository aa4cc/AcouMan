// Put this in setup impl. Loads variables from binary files
void loadUp(const char* corrFile, const char* HUnrotFile, const char* heightFile);

// Put these in step impl. 
// Returns the loaded correction
double getCorrection();
// Returns the rotation matrix
void copyHUnrot(double *destination);
// Returns the platform height
double getHeight();

// // Execute at termination
// void loaderTerminate();