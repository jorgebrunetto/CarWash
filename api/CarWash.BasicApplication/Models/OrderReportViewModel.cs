using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BasicDDD.BasicApplication.Models
{
    public class OrderReportViewModel
    {
        public int OrderId { get; set; }
        public DateTime Created { get; set; }
        public DateTime ScheduledDateTime { get; set; }
        public decimal TotalPrice { get; set; }
        public int Status { get; set; }
        public int UserId { get; set; }
        public string UserName { get; set; }
        public int WasherId { get; set; }
        public string WasherName { get; set; }

        public int? Evaluation { get; set; }
        public decimal? UserScoreAverage { get; set; }
        public decimal? WasherScoreAverage { get; set; }

        public List<OrderItemReportViewModel> Itens { get; set; }
    }
}