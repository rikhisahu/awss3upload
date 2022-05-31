
<cfset aws = new aws(awsKey = 'AKIAYVNLSRZ7R6NDGWPQ', awsSecretKey = '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', defaultRegion = 'us-east-2')>


<!---<cfset obj = aws.s3.putObject( "bikeweek/2023", #fn#, "FileReadBinary('form.file_path')",'pdf','public-read') >--->
	
<!---<cfset S3Bucket = "bikeweek">
<cffile action="upload" source="2112081322474168_2390_11003.pdf" destination="s3://AKIAYVNLSRZ7R6NDGWPQ:pqZ8nUyEsJBHHFNNFGbtg0TmCoZkFfWnN4f301M0@bikeweek" nameconflict="makeunique" charset="utf-8">--->

	
<!---<cfset obj = aws.s3.putObject( "bikeweek", '2112081322474168_2390_11003.pdf', "#strDir#2112081322474168_2390_11003.pdf",'pdf','public-read') >--->
<!---<cffile action="copy" 
      source = "2112081322474168_2390_11003.pdf" 
      destination = "s3://AKIAYVNLSRZ7R6NDGWPQ:pqZ8nUyEsJBHHFNNFGbtg0TmCoZkFfWnN4f301M0@bikeweek/" 
      nameconflict="makeunique" 
>--->
		
<cfoutput>
	
	<!---#IsBinary("2112081322474168_2390_11003.pdf")#	
	<cffile action="write" file="2112081322474168_2390_11003.pdf" output="#thefile#" addnewline="No" />
	#IsBinary(ToBase64(thefile))#
	1: #IsBinary("2112081322474168_2390_11003.pdf")#<br>--->
	<cffile action="readbinary" file="#expandPath('2112081322474168_2390_11003.pdf')#" variable="thefile"/>
	<!---2: #IsBinary(thefile)#<br>
	<cfdump var="#theFile#">--->
	<cfset obj = aws.s3.putObject( "bikeweek", "2023/2112081322474168_2390_11003.pdf", thefile,"application/pdf",'public-read') >
	<cffile action = "delete" file = "#expandPath('2112081322474168_2390_11003.pdf')#">
	<!---<cffile action="write" file="#expandPath('./randy.pdf')#" output="#string2#" addnewline="No" />
	<a href="randy.pdf">click</a>--->
</cfoutput>
    
    
    
    
    
    
    
    
    