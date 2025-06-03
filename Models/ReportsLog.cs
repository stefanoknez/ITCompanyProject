using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ITCompanyProject.Models
{
    public class ReportsLog
    {
        public int LogID { get; set; }
        public string ReportName { get; set; }
        public DateTime GeneratedAt { get; set; }
    }
}
