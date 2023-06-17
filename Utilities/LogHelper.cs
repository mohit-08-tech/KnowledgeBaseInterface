using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using log4net;
using log4net.Repository.Hierarchy;

[assembly: log4net.Config.XmlConfigurator(Watch = true)]
[assembly: log4net.Config.Repository()]
namespace Utilities
{
    public class LogHelper
    {
        public static readonly ILog log = LogManager.GetLogger("KnowledgeBaseInterfaceLogs");
        public LogHelper() { 
        }
        public static void Info(string message)
        {
            log.Info(message);
        }
        public static void Error(string message)
        {
            log.Error(message);
        }
        public static void Error(string message,Exception ex)
        {
            log.Error(message,ex);
        }

        public static void InfoFormat(string format, params object[] args)
        {
            log.InfoFormat(format, args);
        }

        public static void ErrorFormat(string format, params object[] args)
        {
            log.ErrorFormat(format, args);
        }
    }
}
