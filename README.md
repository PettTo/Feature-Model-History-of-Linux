# Feature-Model-History-of-Linux

This repository contains feature models of the linux history from version 3.12 to version 4.15.
The original KConfig files were translated into boolean logic by using KConfigreader. 
The output files of KConfigReader (*.dimacs, *.features, *.model, *.rsf) are provided for each Linux version in this repository. Addtionally a FeatureIDE feature model (model.xml) is provided for each version.
The files are archived as ZIP archive to save disk space. 

############# File format description #############
*.rsf       Intermediate xml file format, created by KConfigReader (dumpconf). Contains raw dump of the original KConfig model file
*.features  Simple text file containing all feature names contained in the original variability model
*.model     Text file that contains boolean constraints, which represent the original KConfig model
*.dimacs    Text file that contains CNF constraints, which represent the original KConfig model. Created by KConfigReader by using Tseitin transformation.
*.xml       FeatureIDE feature model created by importing the *.dimacs file into FeatureIDE
