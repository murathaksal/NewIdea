using ServiceStack.ServiceHost;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewIdea.Model
{
    [Route("/Ideas/New")]
    public class New
    {
        public string Idea { get; set; }
        public string[] Tags { get; set; }
        public DateTime CreationDate { get; set; }
    }

    public class NewResponse
    {
        public bool Success { get; set; }
    }
}
