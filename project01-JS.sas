DATA project01gradesds;

INPUT SID 4. Student_Name $17. Gender $2. Status $2.  Course_Name $19. Stipend DOLLAR12.2 
CourseDate MMDDYY11. Quiz1 Quiz2 Exam1 Exam2 Exam3 Exam4 Exam5 Lab1 Lab2 Final AvgWeighted 
AvgWeightless;

IF CourseDate = . THEN DELETE;

DATALINES;           
9250 Jay Alford       F J  CSC-152-030 (SAS)    $500.00 05/12/2011 75 88 88 96 74 99 33 88 75 80 79 80 .
1234 Lisa Davis       F J  CSC-152-030 (SAS)     $75.00 05/12/2011 85 92 88 95 75 98 82 86 100 86 79 80 .
8792 Bobby Tillman    M J  CSC-152-030 (SAS)            05/12/2011 90 100 95 94 100 97 81 96 100 84 79 80 .
8842 Justin Albright  M F  CSC-152-030 (SAS)                       . . . . . . . . . . . . .
6321 Deborah Waterlou F S  CSC-152-030 (SAS)    $250.00 05/12/2011 50 40 75 93 81 96 80 95 75 86 79 80 .
4950 Tom Brady        M F  CSC-152-030 (SAS)            05/12/2011 95 60 86 92 82 95 89 75 72 84 79 80 .
7213 Sarah Vaughn     F F  CSC-152-030 (SAS)            05/12/2011 75 90 70 71 83 74 87 75 82 70 79 80 .
5431 George Jenkins   M F  CSC-152-030 (SAS)    $100.00 05/12/2011 59 60 58 68 89 39 88 29 58 28 79 80 .
4759 Roberta Hassles  F J  CSC-152-030 (SAS)                       . . . . . . . . . . . . .
1345 Brandy Hillside  F F  CSC-152-030 (SAS)            05/12/2011 57 57 80 80 85 80 80 80 57 57 79 80 .
2800 Helen Smith      F F  CSC-152-030 (SAS)            05/12/2011 70 80 69 58 78 29 57 39 48 90 79 80 .
9272 Eli Manning      M S  CSC-152-030 (SAS)            05/12/2011 65 67 83 84 88 91 78 100 89 91 79 80 .
1468 Henry Matthews   M S  CSC-152-030 (SAS)            05/12/2011 80 89 82 87 84 85 79 72 87 93 79 80 .
5493 Pierre Southerns M F  CSC-152-030 (SAS)            05/12/2011 57 40 90 80 85 80 80 95 57 60 79 80 .
1236 Candy Southerns  F J  CSC-152-030 (SAS)                       . . . . . . . . . . . . .
6596 Tina Sheppard    F S  CSC-152-030 (SAS)  $1,000.00 05/12/2011 100 100 100 100 100 100 100 100 100 100 79 80 .
3750 Shannon Hill     F S  CSC-152-030 (SAS)            05/12/2011 70 65 81 89 86 100 88 77 80 90 79 80 .
7702 Elijah Downing   M S  CSC-152-030 (SAS)                       . . . . . . . . . . . . .
3217 April Greenhand  F F  CSC-152-030 (SAS)                       . . . . . . . . . . . . .
4736 Otis Landing     M S  CSC-152-030 (SAS)    $175.00 05/12/2011 40 50 50 50 60 65 70 70 70 70 79 80 .
6799 Harold Kaufman   M F  CSC-152-030 (SAS)            05/12/2011 50 75 100 87 94 88 88 79 97 100 79 80 .
8954 Marie Fitzgerald F J  CSC-152-030 (SAS)            05/12/2011 50 85 80 82 88 85 80 70 83 82 79 80 .
7136 Troy Evans       M S  CSC-152-030 (SAS)            05/12/2011 70 75 75 75 75 75 80 80 78 82 79 80 .
6374 Danielle Brother F F  CSC-152-030 (SAS)                       . . . . . . . . . . . . .
5665 Alexandra Bevel  F J  CSC-152-030 (SAS)            05/12/2011 70 40 97 80 90 92 95 92 57 60 79 80 .
2077 Gregory Anderson M S  CSC-152-030 (SAS)            05/12/2011 70 75 40 40 90 90 90 90 90 90 79 80 .
3945 Ivy Caldwell     F S  CSC-152-030 (SAS)     $25.00 05/12/2011 75 85 85 85 85 85 92 85 88 87 79 80 .
4865 Casey Jackson    F J  CSC-152-030 (SAS)            05/12/2011 75 95 62 75 75 80 95 80 75 82 79 80 .
8865 Julie Parker     F J  CSC-152-030 (SAS)            05/12/2011 70 45 97 90 90 92 95 92 62 60 79 80 .
9574 Jordan Blanding  F J  CSC-152-030 (SAS)            05/12/2011 88 75 89 80 88 83 84 83 70 88 79 80 .
5703 Serena Lisiki    F F  CSC-152-030 (SAS)            05/12/2011 82 75 84 82 100 100 76 92 73 84 79 80 .
2297 Joseph Holiday   M F  CSC-152-030 (SAS)     $25.00 05/12/2011 84 75 88 82 100 100 86 92 84 71 79 80 .
;
RUN;

PROC PRINT DATA = project01gradesds (RENAME =(Quiz1 = Exam_1) RENAME = (Quiz2 = Exam_2)
RENAME =(Exam1 = Quiz_1) RENAME = (Exam2 = Quiz_2) RENAME = (Exam3 = Exam_3) RENAME=(Exam4 = Lab_1)
RENAME =(Exam5 = Lab_2) RENAME =(Lab1 = Exam_4) RENAME=(Lab2 = Exam_5));
FORMAT Stipend DOLLAR12.2 CourseDate MMDDYY10. ; 
RUN;


DATA project01gradesdsAnalysis;
	SET project01gradesds;
	KEEP SID Student_Name Score_Weightless Score_Weighted Grade_Type Course_Grade Compare_Value Distinction LetterGrade  
AdjustedScore_Weighted  WeightedScoreAdjustment AdjustedGrade_Type GradeTypeAdjustment AdjustedCourse_Grade 
AdjustedDistinction AdjustedLetterGrade;

Score_Weightless = ROUND((Quiz1 + Quiz2 + Exam1 + Exam2 + Exam3 + Exam4 + Exam5 + Lab1 + Lab2 + Final) / 10);

Score_Weighted = ROUND(((Quiz1 + Quiz2) * .05) + ((Exam1 + Exam2 + Exam3 + Exam4 + Exam5) * .1) +
((Lab1 + Lab2) * .05) + (Final *.3));

IF Score_Weighted > Score_Weightless then Grade_Type = 'Weighted';
ELSE Grade_Type = "Weightless";

IF Grade_Type = "Weighted" THEN Course_Grade = Score_Weighted;
ELSE Course_Grade = Score_Weightless;

IF Grade_Type = "Weighted" THEN Compare_Value = AvgWeighted;
ELSE Compare_Value = AvgWeightless;

IF Course_Grade = Compare_Value THEN Distinction = "Equal to Average";
ELSE IF Course_Grade > Compare_Value THEN Distinction = "Above Average";
ELSE Distinction = "Below Average";

IF Course_Grade >= 90 THEN LetterGrade = "A";
ELSE IF Course_Grade >= 80 THEN LetterGrade = "B";
ELSE IF Course_Grade >= 70 THEN LetterGrade = "C";
ELSE IF Course_Grade >= 60 THEN LetterGrade = "D";
ELSE LetterGrade = "F";

AdjustedScore_Weighted = ROUND(((Exam1 + Exam2) * .05) + ((Quiz1 + Quiz2 + Exam3 + Lab1 + Lab2) * .1) +
((Exam4 + Exam5) * .05) + (Final *.3));

IF AdjustedScore_Weighted > Score_Weighted THEN WeightedScoreAdjustment = "Positive Change";
ELSE IF AdjustedScore_Weighted < Score_Weighted THEN WeightedScoreAdjustment = "Negative Change";
ELSE WeightedScoreAdjustment = "No Change";

FORMAT AdjustedGrade_Type $12. AdjustedDistinction $16.;

IF AdjustedScore_Weighted > Score_Weightless THEN AdjustedGrade_Type= "Weighted";
ELSE AdjustedGrade_Type = "Weightless";

IF Grade_Type ~= AdjustedGrade_Type THEN GradeTypeAdjustment = "Changed";

IF AdjustedGrade_Type = "Weighted" THEN AdjustedCourse_Grade = AdjustedScore_Weighted;
ELSE AdjustedCourse_Grade = Score_Weightless;

IF AdjustedCourse_Grade < Compare_Value THEN AdjustedDistinction = "Below Average";
ELSE IF AdjustedCourse_Grade > Compare_Value THEN AdjustedDistinction = "Above Average";
ELSE AdjustedDistinction = "Equal to Average";

IF AdjustedCourse_Grade >= 90 THEN AdjustedLetterGrade = "A";
ELSE IF AdjustedCourse_Grade >= 80 THEN AdjustedLetterGrade = "B";
ELSE IF AdjustedCourse_Grade >= 70 THEN AdjustedLetterGrade = "C";
ELSE IF AdjustedCourse_Grade >= 60 THEN AdjustedLetterGrade = "D";
ELSE AdjustedLetterGrade = "F";
	
	TITLE "CSC-121-090(SAS)";
	TITLE2 "Joseph Schwabauer Project01";
	FOOTNOTE "Analysis for project01gradesds";
	FOOTNOTE2 "as of Spring 2012";
RUN;







PROC PRINT DATA = project01gradesdsAnalysis;
OPTIONS NODATE PAGENO = 1 ORIENTATION= landscape LINESIZE=max PAGESIZE=37;



PROC SORT DATA = project01gradesds;
	BY Gender;
PROC MEANS NOPRINT DATA = project01gradesds;
	BY Gender;
	OUTPUT OUT = stipendtotals SUM(Stipend) =  SUMStipend;
		
	

PROC PRINT DATA = stipendtotals;
	TITLE "Stipend Totals";
	TITLE2 "Project 01";
	FOOTNOTE "CSC 152-090 (SAS)";
	FOOTNOTE2 "submitted by Joseph Schwabauer";
	
RUN;


 DATA project01finalgradesds;
	MERGE project01gradesds stipendtotals;
	BY Gender;
	KEEP SID Student_Name Gender Stipend SUMStipend StipendPercent;
	IF Stipend= . THEN DELETE;
	StipendPercent = Stipend/SUMStipend;
 	FORMAT Stipend DOLLAR7.2 SUMStipend DOLLAR9.2 StipendPercent PERCENT9.2;

	
RUN;

PROC PRINT DATA= project01finalgradesds;
	BY Gender;
	ID Gender;
	SUM Stipend;
	TITLE "Student Grades - Stipend Analysis";
	TITLE2 "Project 01";
	FOOTNOTE "CSC 152-090 (SAS)";
	FOOTNOTE2 "submitted by Joseph Schwabauer";
	FOOTNOTE3 "used project01finalgradesds";
	FORMAT Stipend DOLLAR7.2;
RUN;


PROC REPORT DATA=project01finalgradesds;
	DEFINE Gender/ORDER;
	BREAK AFTER Gender/SUMMARIZE;

	

	
DATA projectFREQ;
	MERGE project01gradesds project01gradesdsAnalysis;
RUN;

PROC FREQ DATA =  projectFREQ;
	TABLE Status * LetterGrade;
	BY Gender;
	*OUTPUT OUT=projectFREQ;
	TITLE "Student Grades-Grade by Gender and Status";
	TITLE2 "Project 01";
	FOOTNOTE "CSC -152-090(SAS)";
	FOOTNOTE2 "submitted by Joseph Schwabauer";
	FOOTNOTE3 "used project01gradesds";
	
RUN;

/*
PROC PRINT DATA = project01gradesds;
BY Gender;
	ID Gender;
	run;
	*/




