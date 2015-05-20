package com.ebangla.controllers;

import com.ebangla.models.Supplier;
        import com.ebangla.models.SupplierRepository;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Controller;
        import org.springframework.ui.ModelMap;
        import org.springframework.validation.BindingResult;
        import org.springframework.web.bind.annotation.ModelAttribute;
        import org.springframework.web.bind.annotation.PathVariable;
        import org.springframework.web.bind.annotation.RequestMapping;
        import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SupplierController {

    @Autowired
    private SupplierRepository supplierRepository;

    @RequestMapping(value = "/supplier", method = RequestMethod.GET)
    public String listSupplier(ModelMap model) {
        model.addAttribute("supplier", new Supplier());
        model.addAttribute("suppliers", supplierRepository.findAll());
        return "supplier/index";
    }

    @RequestMapping(value = "/supplier/add", method = RequestMethod.POST)
    public String addSupplier(@ModelAttribute("supplier") Supplier supplier, BindingResult result) {

        supplierRepository.save(supplier);

        return "redirect:/supplier";
    }

    @RequestMapping("/supplier/delete/{supplierId}")
    public String deleteSupplier(@PathVariable("supplierId") Long supplierId) {

        supplierRepository.delete(supplierRepository.findOne(supplierId));

        return "redirect:/supplier";
    }





}
