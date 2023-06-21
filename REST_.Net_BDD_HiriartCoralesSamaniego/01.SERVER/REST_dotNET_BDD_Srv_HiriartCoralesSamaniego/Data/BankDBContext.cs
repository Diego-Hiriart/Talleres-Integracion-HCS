using REST_dotNET_BDD_Srv_HiriartCoralesSamaniego.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace REST_dotNET_BDD_Srv_HiriartCoralesSamaniego.Data
{
    public class BankDBContext : DbContext
    {
        //Instantiate with DB options from base class
        public BankDBContext(DbContextOptions options) : base(options) { }
        //Must be called the same as table in database
        public DbSet<Movimiento> Movimiento { get; set; }
    }
}
