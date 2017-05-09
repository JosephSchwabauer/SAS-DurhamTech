DATA FORMATTED promotionsds;
	INPUT SID $4. Name $19. @22 Team $ Start_Weight $4. End_Weight $5. Date_Joined DATE11. Dues DOLLAR14.2;
	WeightDiff = Start_Weight - End_Weight;
	PromotionDate = 17347;
	
	
	IF WeightDiff < -24 THEN DiscountPercentage = .10;
	IF Date_Joined < PromotionDate THEN DiscountPercentage = .15;
	IF (WeightDiff < -24) AND (Date_Joined < PromotionDate) THEN DiscountPercentage = .25; 
	IF (WeightDiff > -24) AND (Date_Joined > PromotionDate) THEN DiscountPErcentage = 0;

	LENGTH Promo $4.;
	IF DiscountPercentage = '.10' THEN Promo = "WL";
	ELSE IF DiscountPercentage = '.15' THEN Promo = 'DJ';
	Else IF DiscountPercentage = '.25' THEN Promo = 'BOTH';
	ELSE Promo = 'NONE';


	DiscountAmount = Dues * DiscountPercentage;
	AdjustedDues = Dues - DiscountAmount;
	FORMAT AdjustedDues DOLLAR12.2;
	FORMAT DiscountAmount DOLLAR12.2;
	FORMAT DiscountPercentage PERCENT5.;
	FORMAT PromotionDate DATE7.;
	FORMAT Dues DOLLAR12.2;
	FORMAT Date_Joined DATE7.;

DATALINES;
9250 Jay Alford           Red  185  210  01JAN2006  $1,500.00 
1234 Lisa Davis           Red  200  195  14JUN2003  $1,125.32
8792 Bobby Tillman       Blue  150  150  01JAN2008  $1,750.45
6321 Deborah Waterlou  Yellow  175  150  23MAR2005  $1,175.99
4950 Tom Brady          Green  189  180  18OCT2007  $1,675.99
7213 Sarah Vaughn        Blue  160  142  07FEB2006    $725.75
5431 George Jenkins     Green  208  188  16MAY2003  $1,125.00
2800 Helen Smith          Red  215  196  04DEC2005    $999.99
9272 Eli Manning       Yellow  230  200  12NOV2004    $899.99
1468 Henry Matthews    Yellow  125  115  28JAN2008  $1,750.99
3750 Shannon Hill       Green  183  175  16SEP2004  $1,000.00
;
RUN;

PROC PRINT DATA = promotionsds;
	TITLE "Fitness Club Promotions";
	TITLE2 "Exam 01";
	FOOTNOTE "CSC-152-090(SAS)";
	FOOTNOTE2 "submitted by Joseph Schwabauer";
RUN;