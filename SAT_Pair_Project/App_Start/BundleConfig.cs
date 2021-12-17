using System.Web.Optimization;

namespace SAT_Pair_Project.UI.MVC
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {


            bundles.Add(new ScriptBundle("~/bundles/js").Include(
                "~/Content/assets/js/jquery.min.js",
                "~/Scripts/jquery.validate*",
                "~/Content/assets/js/popper.min.js",
                "~/Content/assets/js/bootstrap.min.js",
                "~/Content/assets/plugins/simplebar/js/simplebar.js",
                "~/Content/assets/js/sidebar-menu.js",
                "~/Content/assets/plugins/Chart.js/Chart.min.js",
                "~/Content/assets/js/app-script.js",
                "~/Content/assets/js/index.js"
                        ));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            //bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
            //          "~/Scripts/bootstrap.js",
            //          "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                "~/Content/assets/plugins/vectormap/jquery-jvectormap-2.0.2.css",
                "~/Content/assets/plugins/simplebar/css/simplebar.css",
                      "~/Content/assets/css/bootstrap.min.css",
                      "~/Content/assets/css/animate.css",
                      "~/Content/assets/css/icons.css",
                      "~/Content/assets/css/sidebar-menu.css",
                      "~/Content/assets/css/app-style.css",
                      "~/Content/site.css"));




        }
    }
}
