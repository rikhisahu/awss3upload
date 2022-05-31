
<cfset aws = new aws(awsKey = 'AKIAYVNLSRZ7R6NDGWPQ', awsSecretKey = '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', defaultRegion = 'us-east-2')>

<cfif isdefined("form.submit_upload") AND len( trim( form.file_path ?: "" ) )>
	<cfset fext = listlast(#form.FILENAME#,".")>
	<cfif IsImageFile(form.FILE_PATH)>
		<cfset cont_type = "image/" & #fext# >
	<cfelse>
		<cfset cont_type = "application/" & #fext# >
	</cfif>
    <cfset fn = listlast(form.filename,"\")>
	<br><br>File name = <cfoutput>#fn#</cfoutput><br><br>
    <cfset obj = aws.s3.putObject( "aftw", #fn#, FileReadBinary(form.file_path),#cont_type#,'public-read') >
		
	<cfoutput>	
		<cfset objects2 = aws.s3.generatePresignedURL( "aftw",#fn#)>
		<cfdump var="#objects2#" label="obj2">
		<img src="https://#objects2#">
	</cfoutput> 
</cfif>
		
   
<form action="" method="POST" name="frmupload" enctype="multipart/form-data" onsubmit="WriteClientFileName();">
    <input type="file" name="file_path" id="file_path">
    <input type="hidden" name="filename" id="filename" value="">
    <input type="submit" name="submit_upload" value="upload">
</form>   
    
<script>
    function WriteClientFileName(){
        document.getElementById("filename").value = document.getElementById("file_path").value;
    }
</script>

    
    
    
    
    
    
    
    
    
    
    
    