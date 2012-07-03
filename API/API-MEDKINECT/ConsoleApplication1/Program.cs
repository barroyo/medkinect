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
            user.email = "diego@lol.com";
            user.fullname = "pedro";
            user.password = "123";
            user.role_id = 1;
            user.status = "en";
            user.username = "123";
            user.id = 46;
            ApiMedkinect apiMedkinect = new ApiMedkinect();


            specialisms lol = new specialisms();
            lol.description = "lol1";
            lol.title = "lol1";
            lol.id = 1;
            specialisms lol2 = new specialisms();
            lol2.description = "lol1";
            lol2.title = "lol1";
            lol2.id = 2;
            specialisms lol3 = new specialisms();
            lol3.id = 3;
            specialisms lol4 = new specialisms();
            lol4.description = "lol1";
            lol4.title = "lol1";
            lol3.id = 4;
            specialisms lol5 = new specialisms();
            lol5.description = "lol1";
            lol5.title = "lol1";
            lol5.id = 5;

            List<specialisms> specialisms = new List<specialisms>();
            specialisms.Add(lol);
            specialisms.Add(lol2);
            specialisms.Add(lol3);
            specialisms.Add(lol4);
            specialisms.Add(lol5);
            user.specialisms = specialisms;
            /*update user*/
         // Object test1 = user.update_user();
            
            /*validate user*/
         // Object test1 = user.loggin(); 
            
            /*create user*/
         // Object test1 = user.create_user();
            
            /*delete user*/
          //Object test1 = user.delete_user();
             
            /*get user by id*/
          // Object test1 = user.get_user();
            
            /*get all users*/
           Object test1 = user.get_all_user();

           
           
            Console.WriteLine(test1);
            Console.ReadKey();
        }

    }
}
