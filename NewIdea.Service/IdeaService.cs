using NewIdea.Model;
using ServiceStack.OrmLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ServiceBase = ServiceStack.ServiceInterface.Service;

namespace NewIdea.Service
{
    public class IdeaService : ServiceBase
    {
        private readonly IDbConnectionFactory _dbSessionFactory;

        public IdeaService(IDbConnectionFactory dbSessionFactory)
        {
            _dbSessionFactory = dbSessionFactory;
        }

        public object Post(New @new)
        {
            using(var session = _dbSessionFactory.OpenDbConnection())
            {
                session.Insert(@new);
            }

            return new NewResponse { Success = true };
        }

    }
}
