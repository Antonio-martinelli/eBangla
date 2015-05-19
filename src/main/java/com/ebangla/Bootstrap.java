package com.ebangla;

import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.web.servlet.DispatcherServlet;

public class Bootstrap extends DispatcherServlet {

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        super.onApplicationEvent(event);
    }

}
