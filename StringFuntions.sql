--	use sqlpractice

--SQL String Functions (Transact-SQL)

--ASCII

	--Return type is int & returns int output

	Select ASCII('a') as a,ASCII('A') as A
--------------------------------------------
--CHAR 
	--Returns the single-byte character with the specified integer code, 
--as defined by the character set and encoding of the default collation of the current database.

--Return types
	--char(1)

--Syntax

	--CHAR ( integer_expression ) 
	
--------------------------------------------
--CONCAT
	Select concat ('a','r','u','l') as MyName --o/p - arul

	Select concat ('ar','ul') as MyName --o/p - arul

	Select concat ('a','/','b') as MyName --o/p - a/b

	Select concat ('a',null,'b') as MyName --o/p - a/b --null values are converted into empty strings

--------------------------------------------
	-- Returns a DIFFERENCE value of 4, the least possible difference.  
	SELECT SOUNDEX('Green'), SOUNDEX('Greene'), DIFFERENCE('Green','Greene');  

	SELECT DIFFERENCE('Green','Greene');

-- Returns a DIFFERENCE value of 0, the highest possible difference.  
	SELECT SOUNDEX('Blotchet-Halls'), SOUNDEX('Greene'), DIFFERENCE('Blotchet-Halls', 'Greene');  
--------------------------------------------
--LEFT

	Select Left('arul',2) --o/p - ar
	Select Left('arul',3) --o/p - aru
	Select Left('Thuraiyur',2) --o/p - Th

--We can use Left fn with table column also as below,
--The below example only fetch the first 4 character from lname column values
	Select * from Student
	Select left(lname,4) as lName from Student
-----------------
--RIGHT
	--Returns the right part of a character string with the specified number of characters.

	Select right('arul',2) --o/p - ul
	Select right('arul',3) --o/p - llur
	Select right('Thuraiyur',2) --o/p - ur

--------------------------------------------
--LEN
	--Returns the number of characters of the specified string expression, excluding trailing spaces
	Select Len(123456) as MnLength -- o/p - 6
	Select Len('aRuL') as MnLength -- o/p - 4

	--We can use Len fn with table column also as below,

	Select * from Student
	Select Len(lname) as LenOflName from Student
	--If the cell or specific row is blank - result will be 0
	--If the cell or specific row is NULL - result will be NULL

--------------------------------------------
--LOWER
	--Returns a character expression after converting uppercase character data to lowercase
	Select Lower('Arul') as IamLowered --o/p - arul
	Select Lower('EMERALD') as IamLowered --o/p - emerald
---------------
--UPPER 
	--Returns a character expression with lowercase character data converted to uppercase.
	Select UPPER('Arul') as IamUppered --o/p - ARUL
	Select UPPER('emerald') as IamUppered --o/p - EMERALD
--------------------------------------------
--LTRIM 
	--Returns a character expression after it removes leading blanks from the left side 

	--Simple example
	SELECT LTRIM('     Five spaces are at the beginning of this string.');

	--Example using a variable
	DECLARE @string_to_ltrim VARCHAR(60);  
	SET @string_to_ltrim = '     5 spaces are at the beginning of this string.';  
	SELECT 
		@string_to_ltrim AS 'Original string',
		LTRIM(@string_to_ltrim) AS 'Without spaces';  
------------------
--RTRIM 
	--Returns a character string after truncating all trailing spaces.
	--Return Types
		--varchar or nvarchar

	--Simple example
	SELECT RTRIM('Removes trailing spaces.   ');  --op - Removes trailing spaces.

	--Example using a variable
	DECLARE @string_to_trim VARCHAR(60);  
	SET @string_to_trim = 'Four spaces are after the period in this sentence.    ';  
	SELECT @string_to_trim + ' Next string.';  
	SELECT RTRIM(@string_to_trim) + ' Next string.';
--------------------------------------------
--PATINDEX 
	--Returns the starting position of the first occurrence of a pattern in a specified expression,
	-- or zeros if the pattern is not found, on all valid text and character data types.
	--Syntax
	--PATINDEX ( '%pattern%' , expression )  

--Remarks
	
--If either pattern or expression is NULL, PATINDEX returns NULL.
--The starting position for PATINDEX is 1.
--PATINDEX performs comparisons based on the collation of the input. 
--To perform a comparison in a specified collation, you can use COLLATE to apply an explicit collation to the input.

	SELECT position = PATINDEX('%ter%', 'interesting data'); --position is column name 
	SELECT Strpositionis = PATINDEX('%int%', 'interesting data') --starting position is 1 & Strpositionis is column name
	SELECT PATINDEX('%ing%', 'interesting data'); --starting position is 9
	SELECT PATINDEX('%at%', 'interesting data')-- o/p - 14
--Important
	--PATINDEX works just like LIKE, so you can use any of the wildcards. 
	--You do not have to enclose the pattern between percents. PATINDEX('a%', 'abc') returns 1 and PATINDEX('%a', 'cba') returns 3.
	--Unlike LIKE, PATINDEX returns a position, similar to what CHARINDEX does.

	SELECT position = PATINDEX('a%', 'abc') --o/p - 1
	SELECT position = PATINDEX('%a', 'swda') --o/p - 3
--Using complex wildcard expressions with PATINDEX

--The following example uses the [^] string operator to find the position of a character that is not a number, letter, or space.
	SELECT position = PATINDEX('%[^ 0-9A-Za-z]%', 'Please ensure !the door is locked!'); 
	--In the above case first occurance of ! is at 15th position
--------------------------------------------
--REPLACE 
	--Replaces all occurrences of a specified string value with another string value

	SELECT REPLACE('abcdefghicde','cde','xyz') as ReplacedVal  --op - abxyzfghixyz
	SELECT REPLACE('abcdefghicde','cde','15a') as ReplacedVal  --op - ab15afghi15a
	--Whereever cde is occured in the string which is replaced by xxx
--------------------------------------------
--REPLICATE 
	--Repeats a string value a specified number of times.

	select replicate ('00',3) --op - 000000	 
--------------------------------------------
--REVERSE 
	--Returns the reverse order of a string value.

	--The following example makes an implicit conversion from an int data type into varchar data type 
	--and then reverses the result.
	select reverse(1234) --op - 4321 

	select reverse('Arul') --op - lurA

	DECLARE @myvar VARCHAR(10);  
	SET @myvar = 'sdrawkcaB';  
	SELECT REVERSE(@myvar) AS Reversed 
--------------------------------------------	
--SOUNDEX 
	--Returns a four-character (SOUNDEX) code to evaluate the similarity of two strings.

	--Return Types
		--varchar
		
		--Snytax
			--SOUNDEX ( character_expression )

--------------------------------------------	
--STR 
	--Not getting

--------------------------------------------	
--STUFF 
	--The STUFF function inserts a string into another string. 
	--It deletes a specified length of characters in the first string at the start position 
	--and then inserts the second string into the first string at the start position.

	--Syntax
		--STUFF ( character_expression , start , length , replaceWith_expression ) 

		--The following example returns a character string created by deleting three characters from the first string, abcdef, 
		--starting at position 2, at b, and inserting the second string at the deletion point.


	SELECT STUFF('abcdef', 2, 3, 'ijklmn'); --ip: abcdef op: aijklmnef
				--starting from 2 position of the string of abcdef: i.e. - b
				--and from 2 position deleting 3 characters in the string: .i.e. - bcd
				--finally inserting the another string (ijklmn) into the deleted string (abcdef)

	SELECT STUFF('abcdef', 3, 4, 'ijklmn'); --ip: abcdef op: abijklmn

	SELECT STUFF('abcdef', 3, 5, 'ijklmn'); --ip: abcdef op: abijklmn

--------------------------------------------	
--SUBSTRING 
	--Returns part of a character, binary, text, or image expression in SQL Server.

	--Syntax
		--SUBSTRING ( expression ,start , length ) 

		SELECT x = SUBSTRING('abcdef', 2, 3);  --here x is a column name & op is: bcd
		SELECT SUBSTRING('abcdef', 2, 3) as x; --here also x is a column name & op is: bcd

		select MyName = SUBSTRING('123456789',5,2) --op - 56
		select SUBSTRING('arulemerald',4,5) --op - lemer

--------------------------------------------	



--------------------------------------------


--------------------------------------------	



--------------------------------------------


--------------------------------------------	



--------------------------------------------

--------------------------------------------	



--------------------------------------------


