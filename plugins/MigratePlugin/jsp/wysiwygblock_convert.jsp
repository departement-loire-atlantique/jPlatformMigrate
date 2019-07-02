<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file="/jcore/doInitPage.jspf" %><%--
--%><%@ include file='/admin/doAdminHeader.jspf' %>

<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>


<%!

Pattern p = Pattern.compile("<a(.*?) href=\"(.*?)\"(.*?)</a>");

public void replaceWysiwygBlock(String fieldName, String text, Publication pubOri) throws Exception {

	Matcher m = p.matcher(text);
	
	String url = null;
	StringBuffer sb =  new StringBuffer() ;  
	
	boolean trouve = false;
	
	while (m.find()) {

		
	    // Variable contentant l'URL
	    url = m.group(2);

	    // Récupère l'id de la publication dans le lien
	    String idPub = "";	
	    Publication itWysiwygPub = null;
	    
	    if(url.split("/").length >= 2) {
	    	idPub = url.split("/")[1];
	    	itWysiwygPub = channel.getPublication(idPub);
	    } 
	    
	    if (Util.isEmpty(itWysiwygPub) && url.lastIndexOf('-') != -1) {
	    	idPub = url.substring(url.lastIndexOf('-') + 1);
	    	itWysiwygPub = channel.getPublication(idPub);
	    } 	  	    
	    
	    
	    if(Util.notEmpty(itWysiwygPub) && itWysiwygPub instanceof WysiwygBlock) {
	    	   	
	    	trouve = true;
	        WysiwygBlock itWysiwygBlock = (WysiwygBlock) itWysiwygPub;        
	        
	        // Youtube
	        if(Util.notEmpty(itWysiwygBlock.getYoutubeUrls())) {
	            String youtubeString = "";
	        	for(String itYoutube : itWysiwygBlock.getYoutubeUrls()) {
	        		youtubeString += "<jalios:media data-jalios-source=\"" + itYoutube + "\"/>";
	            }
	        	m.appendReplacement(sb, youtubeString); 
	        }
	        
	        // Flickr
	        if(Util.notEmpty(itWysiwygBlock.getFlickrUrls())) {
	        	String flickrString = "";
	            for(String itFlickr : itWysiwygBlock.getFlickrUrls() ) {
	            	flickrString += "<jalios:media data-jalios-source=\"" + itFlickr + "\"/>";
	            }
	            m.appendReplacement(sb, flickrString); 
	        }	        	        
	    }	    
	}
	m.appendTail(sb);
	
	if(trouve) {
		Publication itPubClone = (Publication) pubOri.getUpdateInstance();
	    itPubClone.setFieldValue(fieldName, sb.toString());
	    itPubClone.performUpdate(channel.getCurrentLoggedMember());
	}

}

%>



<%


Set<Publication> pubSet = channel.getPublicationSet(Publication.class, loggedMember);

for (Publication itPub : pubSet) {
    	
    TypeFieldEntry[] fieldTab = channel.getAllTypeFieldEntries(itPub.getClass());
    for(TypeFieldEntry itField : fieldTab) {
       if(itField.isWysiwyg()) {
    	   String itText = itField.getFieldValueAsString(itPub, userLang);
    	   if(Util.notEmpty(itText)) {
    		    replaceWysiwygBlock(itField.getName(), itText, itPub);    		    
    	   }
       }
    }  
    
} 


%>


OK <%= new Date() %>

<%@ include file='/admin/doAdminFooter.jspf' %>


