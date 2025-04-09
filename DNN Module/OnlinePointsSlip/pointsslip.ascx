<%@ Control Language="C#" ClassName="AriCummings.OnlinePointsSlip.pointsslip" Inherits="DotNetNuke.Entities.Modules.PortalModuleBase" %>
<%@ Import Namespace="System.IO" %>

<script runat="server">
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        // Ensure jQuery and DNN Services Framework are available
        jQuery.RequestRegistration();
        ServicesFramework.Instance.RequestAjaxScriptSupport();
    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        const string ModulePath = @"DesktopModules\AriCummings\OnlinePointsSlip";

        if (!Page.IsPostBack)
        {
            // Dynamically load the HTML file
            var path = Path.Combine(Server.MapPath(ModulePath), "pointsslip.html");
            if (File.Exists(path))
            {
                var content = File.ReadAllText(path);
                ctlContent.Text = content;
            }
        }
    }
</script>

<asp:Localize id="ctlContent" runat="server" />
