// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package au.gov.nsw.records.digitalarchives.dashboard.web;

import au.gov.nsw.records.digitalarchives.dashboard.model.Agency;
import au.gov.nsw.records.digitalarchives.dashboard.web.AgencyController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect AgencyController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AgencyController.create(@Valid Agency agency, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, agency);
            return "agencies/create";
        }
        uiModel.asMap().clear();
        agency.persist();
        return "redirect:/agencies/" + encodeUrlPathSegment(agency.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AgencyController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Agency());
        return "agencies/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AgencyController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("agency", Agency.findAgency(id));
        uiModel.addAttribute("itemId", id);
        return "agencies/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AgencyController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("agencys", Agency.findAgencyEntries(firstResult, sizeNo));
            float nrOfPages = (float) Agency.countAgencys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("agencys", Agency.findAllAgencys());
        }
        return "agencies/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AgencyController.update(@Valid Agency agency, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, agency);
            return "agencies/update";
        }
        uiModel.asMap().clear();
        agency.merge();
        return "redirect:/agencies/" + encodeUrlPathSegment(agency.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AgencyController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Agency.findAgency(id));
        return "agencies/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AgencyController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Agency agency = Agency.findAgency(id);
        agency.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/agencies";
    }
    
    void AgencyController.populateEditForm(Model uiModel, Agency agency) {
        uiModel.addAttribute("agency", agency);
    }
    
    String AgencyController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}