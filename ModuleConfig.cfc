component {

    this.name           = "contentbox-cbcommerce";
    this.title          = "cbCommerce for ContentBox"
    this.description    = "cbCommerce module for the ContentBox CMS"
    this.version        = "1.0.0-alpha1"
    this.author         = "Jon Clausen <jclausen@ortussolutions.com>";
    this.webUrl         = "https://github.com/contentbox-modules/cbcommerce";
    this.cfmapping      = "contentboxCommerce";
    this.modelNamespace	= "contentboxCommerce";
    this.entryPoint     = "contentbox-cbcommerce";
    this.viewParentLookup = true;
    this.layoutParentLookup = true;
    this.dependencies   = [
        "cbcommerce-api",
        "cbcommerce-admin",
        "cbcommerce-ui"
    ];

	/**
	 * Configure Module
	 */
    function configure() {}

    function onLoad() {

        /**
        * Overload for ContentBox default Sitemap Routing
        */
        appRouter.prepend()
                    .route( "sitemap" )
                    .to( "cbCommerce:Sitemap.index" );

                    // Add our menu item
        var menuService = controller.getWireBox().getInstance( "AdminMenuService@cb" );
        
        menuService.addSubMenu(
            topMenu=menuService.MODULES,
            name="cbCommerce",
            label="Store Admin",
            href=menuService.buildModuleLink( 'store', 'admin' )
        );

	}

}