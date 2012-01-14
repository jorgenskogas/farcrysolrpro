<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Spellings --->
<!--- @@author: Sean Coyne (www.n42designs.com), Jeff Coughlin (jeff@jeffcoughlin.com) --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />
<cfimport taglib="/farcry/core/tags/admin" prefix="admin" />

<cfset filePath = application.fapi.getConfig(key = 'solrserver', name = 'instanceDir') & "/conf/spellings.txt" />

<ft:processForm action="Save">
	<cfset fileWrite(filePath,trim(form.contents)) />
	<skin:bubble title="Spellings" message="Updated spellings.txt" />
</ft:processForm>

<cfset contents = fileRead(filePath) />

<admin:header title="Spellings" />

<ft:form>
	
	<ft:fieldset legend="Spellings">
		
		<ft:field for="contents" label="File Contents:" hint="No reindex is required. This file is read by Solr at query time.">
			<cfoutput>
			<textarea class="textareaInput" name="contents" id="contents" style="min-height: 400px;">#contents#</textarea>
			</cfoutput>
		</ft:field>
		
		<ft:buttonPanel>
			<ft:button value="Save" />
		</ft:buttonPanel>
	
	</ft:fieldset>
	
</ft:form>

<admin:footer />

<cfsetting enablecfoutputonly="false" />