package com.ebangla.controllers.admin;

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
@RequestMapping(value = "/admin/supplier")
public class SupplierController {

    @Autowired
    private SupplierRepository supplierRepository;

    @RequestMapping(method = RequestMethod.GET)
    public String listSupplier(ModelMap model) {
        model.addAttribute("supplier", new Supplier());
        model.addAttribute("suppliers", supplierRepository.findAll());
        return "admin/supplier";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String addSupplier(@ModelAttribute("supplier") Supplier supplier, BindingResult result) {
        supplierRepository.save(supplier);
        return "redirect:/admin/supplier";
    }

    @RequestMapping("/delete/{supplierId}")
    public String deleteSupplier(@PathVariable("supplierId") Long supplierId) {

        supplierRepository.delete(supplierRepository.findOne(supplierId));

        return "redirect:/admin/supplier";
    }

}
