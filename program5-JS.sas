OPTIONS NODATE PAGESIZE= 20 NONUMBER LINESIZE=max PAGESIZE=37;


DATA Maleds;
INPUT Name $15. School $5. Gender $2. Major$7. GPA 5. Degree $4. Stipend COMMA12.2 Graduation MMDDYY10. ;
DATALINES;
George Harvest  NCSU M CHEM   3.60 BS  $2,200.00 12/15/2009
Gregory Daniels NCSU M COMPSC 2.80 BS      $0.00 12/15/2009
Harold Doggs    YALE M PSYCH  3.60 BA      $0.00 12/15/2010 
Aaron Jones     UNC  M PSYCH  3.95 BA      $0.00 08/01/2008
Carl Franks     PSU  M MATH   2.94 PHD $1,500.00 12/15/2010
Henry Todd      PSU  M PSYCH  3.09 BA    $250.00 12/15/2008
;
RUN;

PROC PRINT DATA = Maleds;
FORMAT Graduation MMDDYY10. Stipend DOLLAR12.2;
TITLE "Male College Data";
TITLE2 "Programe Exercise 05";
FOOTNOTE 'SAS Programming(Online)';
FOOTNOTE2 'Verify Input Data';
FOOTNOTE3 'submitted by Joseph Schwabauer';

DATA Femaleds;
INPUT Name $15. School $5. Gender $2. Major$7. GPA 5. Degree $4. Stipend DOLLAR12.2 Graduation MMDDYY10. ;
DATALINES;
Lisa Adams      PSU  F MATH   2.50 BS  $1,500.00 08/01/2009
Sharon Boone    PSU  F MATH   3.20 BS  $1,500.00 12/15/2010
Tanya Redding   UNC  F CHEM   1.50 BS  $1,000.00 08/01/2012
Denise Austin   NCSU F BUSADM 2.00 MBA     $0.00 08/01/2008
Julia Mann      LSU  F COMPSC 2.74 PHD     $0.00 12/15/2009
Joyce Johnson   YALE F MATH   3.65 PHD $3,000.00 12/15/2012
Tanya Jacks     LSU  F BUSADM 3.10 MBA   $500.00 08/01/2012
Beverly Hook    YALE F MATH   4.00 BA      $0.00 08/01/2008
Elise Booker    PSU  F COMPSC 2.77 BS      $0.00 12/15/2008
;
RUN;

PROC PRINT DATA = Femaleds;
FORMAT Graduation MMDDYY10. Stipend DOLLAR12.2;
TITLE "Female College Data";
TITLE2 "Programe Exercise 05";
FOOTNOTE 'SAS Programming(Online)';
FOOTNOTE2 'Verify Input Data';
FOOTNOTE3 'submitted by Joseph Schwabauer';

OPTIONS NODATE PAGESIZE= 30 NONUMBER ORIENTATION= landscape;

DATA AllStudentsds;
INPUT Name $15. School $5. Gender $2. Major$7. GPA 5. Degree $4. Stipend DOLLAR12.2 Graduation MMDDYY10. GenderDesc $7. ;
IF Gender = 'M' THEN GenderDesc = 'Male';
ELSE IF Gender = 'F' THEN GenderDesc = 'Female';
ELSE GenderDesc = "Missing";

DATALINES;
George Harvest  NCSU M CHEM   3.60 BS  $2,200.00 12/15/2009
Gregory Daniels NCSU M COMPSC 2.80 BS      $0.00 12/15/2009
Harold Doggs    YALE M PSYCH  3.60 BA      $0.00 12/15/2010 
Aaron Jones     UNC  M PSYCH  3.95 BA      $0.00 08/01/2008
Carl Franks     PSU  M MATH   2.94 PHD $1,500.00 12/15/2010
Henry Todd      PSU  M PSYCH  3.09 BA    $250.00 12/15/2008
Lisa Adams      PSU  F MATH   2.50 BS  $1,500.00 08/01/2009
Sharon Boone    PSU  F MATH   3.20 BS  $1,500.00 12/15/2010
Tanya Redding   UNC  F CHEM   1.50 BS  $1,000.00 08/01/2012
Denise Austin   NCSU F BUSADM 2.00 MBA     $0.00 08/01/2008
Julia Mann      LSU  F COMPSC 2.74 PHD     $0.00 12/15/2009
Joyce Johnson   YALE F MATH   3.65 PHD $3,000.00 12/15/2012
Tanya Jacks     LSU  F BUSADM 3.10 MBA   $500.00 08/01/2012
Beverly Hook    YALE F MATH   4.00 BA      $0.00 08/01/2008
Elise Booker    PSU  F COMPSC 2.77 BS      $0.00 12/15/2008
;
RUN;
PROC SORT;
  BY GPA;

PROC PRINT DATA = AllStudentsds;
FORMAT Graduation MMDDYY10. Stipend DOLLAR12.2;
TITLE "All Students College Data";
TITLE2 "Programe Exercise 05";
FOOTNOTE 'SAS Programming(Online)';
FOOTNOTE2 'Combine Maleds and Femaleds Data Sets';
FOOTNOTE3 'submitted by Joseph Schwabauer';

PROC MEANS DATA = AllStudentsds;
OUTPUT OUT = Statisticsds
SUM(Stipend) = Sumstipend;
proc print data = Statisticsds;

