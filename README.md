# Feature-Model-History-of-Linux

This repository contains feature models of the linux history from version 3.12 to version 4.15.
The original KConfig files were translated into boolean logic by using KConfigreader. 
The output files of KConfigReader (*.dimacs, *.features, *.model, *.rsf) are provided for each Linux version in this repository. Addtionally a FeatureIDE feature model (model.xml) is provided for each version.
The files are archived as ZIP archive to save disk space. 

## Selection of approproate commits ######
KConfig files represent the feature models of the Linux product line. So, for this repository only those Linux versions are of interest, which change the kConfig files of a Linux architecture. Hence, only those commits of the original Linux Git repository were analysed, which change the kConfig files. To choose the respective Linux versions, a script based analysis was used. At first Linux Git repository was cloned. Thereafter, the oldest version of the analysis time was checked out. The respective commit is analysed, whether one of the KConfig files was changed or not. If a kConfig file was changed, the KConfigReader is used to extract the feature. Afterwards, the next commit is checked out. If the commit did not change a kConfig file, the commit is skiped and the next one is checked out. This process repeats, until all commits in the defined time frame are analysed.  

## File format description ############
*.rsf       Intermediate xml file format, created by KConfigReader (dumpconf). Contains raw dump of the original KConfig model file
*.features  Simple text file containing all feature names contained in the original variability model
*.model     Text file that contains boolean constraints, which represent the original KConfig model
*.dimacs    Text file that contains CNF constraints, which represent the original KConfig model. Created by KConfigReader by using Tseitin transformation.
*.xml       FeatureIDE feature model created by importing the *.dimacs file into FeatureIDE
 
