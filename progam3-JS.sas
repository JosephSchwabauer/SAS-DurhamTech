OPTIONS NODATE PAGESIZE=40 LINESIZE = 256;

DATA LIST nflds;
	INPUT FootballString $25.; 
	City = SUBSTR(FootballString, 1, ANYDIGIT(FootballString)-1);
	Year = SUBSTR(FootballString, ANYDIGIT(FootballString), 4);
	Team = SUBSTR(FootballString, INDEX(FootballString,'2012') +5);
	IF INDEX(TRIM(City), " ") THEN Spacec = '1';
		ELSE Spacec = '0';
	IF INDEX(TRIM(Team), " ") THEN Spacet = '1';
		ELSE Spacet = '0';
	IF ANYDIGIT(Team) THEN Numbert = '1';
		ELSE Numbert = '0';
		
	 ARRAY numArr(3) Spacec Spacet Numbert;       
     ARRAY charArr(3) $ SpacecC SpacetC NumbertC;
     DO i = 1 TO 3;
     	IF numArr(i) = '1' THEN  charArr(i) = "Yes";
     	ELSE charArr(i)= "No";
     END;
	
	CityTeam = CATX('-',City,Team);
	
 
	LENGTH Superbowl $25;
	IF Team = 'Giants' THEN Superbowl = 'Winner';
	ELSE IF Team = 'Patriots' THEN Superbowl = 'Runner Up';
	ELSE Superbowl = 'Not a Contender';
	
			
	LENGTH Conference $16.;	
    IF Team = 'Ravens' THEN Conference = 'AFC-NORTH';
    IF Team = 'Browns' THEN Conference = 'AFC-NORTH';
    IF Team = 'Bengals' THEN Conference = 'AFC-NORTH';
    IF Team = 'Steelers' THEN Conference = 'AFC-NORTH';
    IF Team = 'Texans' THEN Conference = 'AFC-SOUTH';
    IF Team = 'Colts' THEN Conference = 'AFC-SOUTH';
    IF Team = 'Jaguars' THEN Conference = 'AFC-SOUTH';
    IF Team = 'Titans' THEN Conference = 'AFC-SOUTH';
    IF Team = 'Bills' THEN Conference = 'AFC-EAST';
    IF Team = 'Dolphins' THEN Conference = 'AFC-EAST';
    IF Team = 'Patriots' THEN Conference = 'AFC-EAST';
    IF Team = 'Jets' THEN Conference = 'AFC-EAST';
    IF Team = 'Broncos' THEN Conference = 'AFC-WEST';
    IF Team = 'Chiefs' THEN Conference = 'AFC-WEST';
    IF Team = 'Raiders' THEN Conference = 'AFC-WEST';
    IF Team = 'Chargers' THEN Conference = 'AFC-WEST';
    IF Team = 'Bears' THEN Conference = 'NFC-NORTH';
    IF Team = 'Lions' THEN Conference = 'NFC-NORTH';
    IF Team = 'Packers' THEN Conference = 'NFC-NORTH';
    IF Team = 'Vikings' THEN Conference = 'NFC-NORTH';
    IF Team = 'Falcons' THEN Conference = 'NFC-SOUTH';
    IF Team = 'Panthers' THEN Conference = 'NFC-SOUTH';
    IF Team = 'Saints' THEN Conference = 'NFC-SOUTH';
    IF Team = 'Buccaneers' THEN Conference = 'NFC-SOUTH';
   	IF Team = 'Cowboys' THEN Conference = 'NFC-EAST';
    IF Team = 'Giants' THEN Conference = 'NFC-EAST';
    IF Team = 'Eagles' THEN Conference = 'NFC-EAST';
    IF Team = 'Redskins' THEN Conference = 'NFC-EAST';
    IF Team = 'Cardinals' THEN Conference = 'NFC-WEST';
    IF Team = '49ers' THEN Conference = 'NFC-WEST';
    IF Team = 'Seahawks' THEN Conference = 'NFC-WEST';
    IF Team = 'Rams' THEN Conference = 'NFC-WEST';
     		
     		
      		
	
	
	City = UPCASE(City);
	Team = UPCASE(Team);
	City = TRANSLATE(City, 'a', 'A');
	Team = TRANSLATE(Team, 'a', 'A');
	City = TRANSLATE(City, 'i', 'I');
	Team = TRANSLATE(Team, 'i', 'I');
	City = TRANSLATE(City, 'e', 'E');
	Team = TRANSLATE(Team, 'e', 'E');
	City = TRANSLATE(City, 'o', 'O');
	Team = TRANSLATE(Team, 'o', 'O');
	City = TRANSLATE(City, 'u', 'U');
	Team = TRANSLATE(Team, 'u', 'U');

DATALINES;
Baltimore 2012 Ravens
Cincinnati 2012 Bengals
Cleveland 2012 Browns
Pittsburgh 2012 Steelers
Chicago 2012 Bears
Detroit 2012 Lions
Green Bay 2012 Packers
Minnesota 2012 Vikings
Houston 2012 Texans
Indianapolis 2012 Colts
Jacksonville 2012 Jaguars
Tennessee 2012 Titans
Atlanta 2012 Falcons
Carolina 2012 Panthers
New Orleans 2012 Saints
Tampa Bay 2012 Buccaneers
Buffalo 2012 Bills
Miami 2012 Dolphins
New England 2012 Patriots
New York 2012 Jets
Dallas 2012 Cowboys
New York 2012 Giants
Philadelphia 2012 Eagles
Washington 2012 Redskins
Denver 2012 Broncos
Kansas City 2012 Chiefs
Oakland 2012 Raiders
San Diego 2012 Chargers
Arizona 2012 Cardinals
San Francisco 2012 49ers
Seattle 2012 Seahawks
St. Louis 2012 Rams
;
RUN;

PROC PRINT DATA=nflds;
	TITLE "NFL Team Analysis Report";
	TITLE2 "Program Exercise 03";
	FOOTNOTE 'SAS Programming(Online)';
	FOOTNOTE2 'submitted by Joseph Schwabauer';
	
RUN;