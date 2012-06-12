using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using API_MEDKINECT;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            User user = new User();
            user.email = "lel@lol.com";
            user.fullname = "lol";
            user.password = "123";
            user.role_id = 1;
            user.status = "en";
            user.username = "lel";
            //user.id = 1;
            functions function = new functions();
            main lol = new main();
            

           // Object test1 = lol.conexion_rest("get", "users", user, -1);

            Object test1 = function.loggin("lol", "132"); 
            Console.WriteLine(test1);
            Console.ReadKey();
        }

    }
}
