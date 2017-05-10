DATA furniture;
	INPUT Item $ Quantity Cost PurchaseAmount 4.;
	PurchaseAmount = Quantity * Cost;
DATALINES;
Sofa 1 1300.00
Chair 2 250.00
Table 3 750.00
Cabinet 2 450.00
Chaise 0 325.00
Loveseat 1 800.00
Bookcase 2 200.00
Recliner 0 1000.00
Ottoman 0 375.00
Armoire 1 4000.00
;
RUN;

PROC PRINT DATA = furniture;
  TITLE 'Furniture Purchase Order';
  TITLE2 'Homework 01';
  FOOTNOTE 'CSC-152-090 (SAS Online)';
  FOOTNOTE2 'submitted by Joseph Schwabauer';
RUN;



DATA COLUMN exam;
	Input Name $16. Class Code $2. Return Date $10. Candy Type $2. Quantity $2.;

DATALINES;
Adriana Jackson 2103/21/2000MP07
Nathan Henderson1403/21/2000CD19
Jason Smith     2104/01/2000MP12
Matthew Taylor  1403/21/2000CD14
Claire Williams 1403/22/2000CD11
Caitlin Day     2103/24/2000CD09
;
RUN;

PROC PRINT DATA = exam;