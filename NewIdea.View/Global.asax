<%@ Application Language="C#" %>
<%@ Import Namespace="ServiceStack.Common.Utils" %>
<%@ Import Namespace="ServiceStack.OrmLite" %>
<%@ Import Namespace="ServiceStack.OrmLite.Sqlite" %>
<%@ Import Namespace="ServiceStack.WebHost.Endpoints" %>

<script RunAt="server">

    public class IdeaServiceAppHost : ServiceStack.WebHost.Endpoints.AppHostBase
    {
        
        public IdeaServiceAppHost()
            : base("Idea Service", typeof(NewIdea.Service.IdeaService).Assembly)
        {   
        }

        public override void Configure(Funq.Container container)
        {
            var dbFactory = new ServiceStack.OrmLite.OrmLiteConnectionFactory(
                "~/ideadb.sqlite".MapHostAbsolutePath(), false, ServiceStack.OrmLite.SqliteDialect.Provider);

            using (var connection = dbFactory.CreateDbConnection())
            {
                connection.Open();
                connection.CreateTableIfNotExists<NewIdea.Model.New>();
            } 
            container.Register<ServiceStack.OrmLite.IDbConnectionFactory>(dbFactory);
            
            Routes
              .Add<NewIdea.Model.New>("/Ideas/New");
        }
    }

    void Application_Start(object sender, EventArgs e)
    {
        
        // Code that runs on application startup
        new IdeaServiceAppHost().Init();
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
