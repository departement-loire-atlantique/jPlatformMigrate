<%@page import="com.jalios.util.*"%><%
%><%@ include file='/jcore/doInitPage.jsp' %><%
    
response.setHeader("Content-Encoding", "UTF-8");
response.setContentType("text/csv; charset=UTF-8");
response.setHeader("Content-Disposition","inline; filename=wysiwygBlock.csv");


Set<WysiwygBlock> wysiwygBlockSet = channel.getPublicationSet(WysiwygBlock.class, loggedMember);

out.clear();


%>ID;URL de la pub qui utilise;youtube;dm cloud;calameo;slideshare;flick;soundcloud;html;transcript;liste sites;liste documents;sous titre;portlet;total
<jalios:foreach collection="<%= wysiwygBlockSet %>" name="itBloc" type="WysiwygBlock"><%
        Set<Publication> pubReferrerSet = new HashSet<Publication>(itBloc.getWeakReferrerSet());
        Set<Publication> pubReferrerVisibleSet = (Set<Publication>) JcmsUtil.applyDataSelector(pubReferrerSet, Publication.getVisibleStateSelector());
    %><%
    %><jalios:if predicate="<%= Util.notEmpty(pubReferrerVisibleSet) %>"><%
    
        int cptYoutube = Util.notEmpty(itBloc.getYoutubeUrls()) ? itBloc.getYoutubeUrls().length : 0;
    
        int cptDmCloud = Util.notEmpty(itBloc.getDmCloudIds()) ? itBloc.getDmCloudIds().length : 0;
        
        int cptTitreCalameo = Util.notEmpty(itBloc.getTitreLivreCalameo()) ? 1 : 0;
        int cptLivreCalameo = Util.notEmpty(itBloc.getCalameoUrls()) ? itBloc.getCalameoUrls().length : 0;
        
        int cptTitreSlide = Util.notEmpty(itBloc.getTitreDiaporamaSlideShare()) ? 1 : 0;
        int cptCodeSlide = Util.notEmpty(itBloc.getSlideshareUrls()) ? itBloc.getSlideshareUrls().length : 0;
        int cptLienSlide = Util.notEmpty(itBloc.getLienDirectSlideShare()) ? 1 : 0;
        
        int cptFlick = Util.notEmpty(itBloc.getFlickrUrls()) ? itBloc.getFlickrUrls().length : 0;
        
        int cptSoundcloud = Util.notEmpty(itBloc.getSoundCloudUrls()) ? itBloc.getSoundCloudUrls().length : 0;
        
        int cptHtml = Util.notEmpty(itBloc.getHtmlBlock()) ? itBloc.getHtmlBlock().length : 0;
    
        boolean hasTranscipt = Util.notEmpty(itBloc.getDocumentTranscriptDBID());
        
        int cptEncartSite = Util.notEmpty(itBloc.getWebsitesPartTitle()) ? 1 : 0;
        int cptNomSites = Util.notEmpty(itBloc.getWebsiteNames()) ? itBloc.getWebsiteNames().length : 0;
        int cptUrlSites = Util.notEmpty(itBloc.getWebsiteUrls()) ? itBloc.getWebsiteUrls().length : 0;
        
        int cptTitreDoc = Util.notEmpty(itBloc.getDocumentsPartTitle()) ? 1 : 0;
        int cptDoc = Util.notEmpty(itBloc.getDocuments()) ? itBloc.getDocuments().length : 0;
        
        boolean hasSousTitre = Util.notEmpty(itBloc.getSoustitreDBID());
        
        int cptPortlet = Util.notEmpty(itBloc.getInsetPortlet()) ? itBloc.getInsetPortlet().length : 0;
        
        int cptTotal = cptYoutube + cptDmCloud + cptTitreCalameo + cptLivreCalameo + cptTitreSlide + cptCodeSlide + cptLienSlide + cptFlick + cptSoundcloud + cptHtml + cptEncartSite + cptNomSites + cptUrlSites + cptTitreDoc + cptDoc + cptPortlet;
        
        %><%= itBloc.getId() %>;<%= /*Util.getFirst(pubReferrerSet).getDisplayUrl(userLocale)*/ Util.getFirst(pubReferrerSet).getId() %>;<%= cptYoutube > 0 ? cptYoutube : "" %>;<%= cptDmCloud > 0 ? cptDmCloud : "" %>;<%= (cptTitreCalameo + cptLivreCalameo) > 0 ? cptTitreCalameo + cptLivreCalameo : "" %>;<%= (cptTitreSlide + cptCodeSlide + cptLienSlide) > 0 ? (cptTitreSlide + cptCodeSlide + cptLienSlide) : "" %>;<%= cptFlick > 0 ? cptFlick : "" %>;<%= cptSoundcloud > 0 ? cptSoundcloud : "" %>;<%= cptHtml > 0 ? cptHtml : "" %>;<%= hasTranscipt ? "oui" : "" %>;<%= (cptEncartSite + cptNomSites + cptUrlSites) > 0 ? (cptEncartSite + cptNomSites + cptUrlSites) : "" %>;<%= (cptTitreDoc + cptDoc) > 0 ? (cptTitreDoc + cptDoc) : "" %>;<%= hasSousTitre ? "oui" : "" %>;<%= cptPortlet > 0 ? cptPortlet : "" %>;<%= cptTotal > 0 ? cptTotal : "" %><%       
        		%>
        		</jalios:if><%
%></jalios:foreach>

