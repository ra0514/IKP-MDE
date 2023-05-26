The following files are used to generate the data present in "Inverse Kinematics: An Alternative Solution Approach Applying Metaheuristics, a brief description accompanies the name of each of them."
All the files must be in the same folder and were run in MATLAB R2020a.

PlotPath-If executed, plots the solutions for the random path. Requires (pathcircledata.xlsx, test.xlsx,L5DOF10Full)
PlothPathCircle-If executed, plots the solutions for the close path. Requires (patientdata.xlsx, historico.xlsx,L5DOF10Full)
PlotSol-If executed, plots the solutions with the traditional approach for a point.
PlotSol2Full-If executed, plots the solutions with the proposal for a point following a line
PlotLine, If executed, plots a test run with the result generated with L5DOF10Exp2Multi01
L5DOF10-The forward Kinematic of the case study
L5DOF10Full-The forward Kinematic of the case study, is used to plot.
eucdistance-A simple function that calculated the euclidean distance between two vectors
L5DOF10Exp2Multi01-If executed, solve the IKP for a point following a line. Requires (eucdistance,L5DOF10F)
L5DOF10Exp2Multi02-If executed, solve the IKP for a random path. Requires (patientdata.xlsx,eucdistance,L5DOF10F)
L5DOF10Exp2Multi03-If executed, solve the IKP for a close path. Requires (pathcircledata.xlsx,eucdistance,L5DOF10F)
pathcircledata.xlsx - Data of a close trajectorie
patientdata.xlsx - Data of a random path
test. xlsx - Solution for a random path
historico.xlsx - Solution for a close trajectorie