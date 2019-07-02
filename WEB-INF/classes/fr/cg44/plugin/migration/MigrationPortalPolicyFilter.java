package fr.cg44.plugin.migration;

import com.jalios.jcms.policy.BasicPortalPolicyFilter;
import com.jalios.util.Util;

public class MigrationPortalPolicyFilter extends BasicPortalPolicyFilter {
  

  
  @Override
  public String getDescriptiveURLId(String descriptiveURL, String id) {
    if (Util.notEmpty(id)) {
      return id;
    }
    int lastDotPos = descriptiveURL.lastIndexOf("-");
    if (lastDotPos == -1) {
      return null;
    }
    return descriptiveURL.substring(lastDotPos+1);
  }
}