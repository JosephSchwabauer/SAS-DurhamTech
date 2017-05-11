
DATA FORMATTED COLUMNAR TABLE oscars;
  INPUT Oscardate ANYDTDTE8. Oscaryear 5. +1 Budget COMMA12. Gross COMMA12. Title $23. Asofdate $ Rating;
  Profit = Gross - Budget;
  PBPercent = Profit/Budget;
  LENGTH Message1 $29;
  LENGTH Message2 $29;
  IF PBPercent LT 1 THEN DO;
     Message1 = 'Less Than 100%';  
     Message2 = 'Impressive'; 
  END;
  ELSE IF PBPercent GE 1 AND PBPercent LE 10 THEN DO;
          Message1 = 'Between 100% and 1000%';
          Message2 = 'More Impressive';
  END;
  ELSE IF PBPercent GT 10 THEN DO;
  		  Message1 = 'More than 1,000%';
  		  Message2 = 'Even More Impressive';
  END;
DATALINES;
27Feb11 2011  $15,000,000 $373,700,000 The Kings Speech       02/26/2012  8.2
07Mar10 2010  $11,000,000  $12,647,089 The Hurt Locker        02/26/2012  7.2
22Feb09 2009  $15,000,000 $141,319,195 Slumdog Millionaire    02/26/2012  8.2
24Feb08 2008  $25,000,000  $74,273,505 No Country for Old Men 02/26/2012  8.2
25Feb07 2007  $90,000,000 $289,800,000 The Departed           02/26/2012  8.5
05Mar06 2006   $6,500,000  $98,410,061 Crash                  02/26/2012  8.0
;
RUN;
	

PROC PRINT DATA= oscars;
	FORMAT Oscardate MMDDYY8.; 
	FORMAT Budget DOLLAR14.0;
	FORMAT Gross DOLLAR14.0;
	FORMAT Profit DOLLAR14.0;
	FORMAT PBPercent PERCENT9.4;
	TITLE 'Oscar Winners';
	TITLE2 'Program Exercise 02';
	FOOTNOTE 'SAS Programming(Online)';
	FOOTNOTE2 'submitted by Joseph Schwabauer';
	

RUN;


