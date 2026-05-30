package mvc.portlet.portlet;

import mvc.portlet.constants.MvcPortletKeys;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import jakarta.portlet.Portlet;

import org.osgi.service.component.annotations.Component;

/**
 * @author andreychernenko
 */
@Component(
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.header-portlet-css=/css/main.css",
		"com.liferay.portlet.instanceable=true",
		"jakarta.portlet.display-name=Mvc",
		"jakarta.portlet.init-param.template-path=/",
		"jakarta.portlet.init-param.view-template=/view.jsp",
		"jakarta.portlet.name=" + MvcPortletKeys.MVC,
		"jakarta.portlet.resource-bundle=content.Language",
		"jakarta.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class MvcPortlet extends MVCPortlet {
}