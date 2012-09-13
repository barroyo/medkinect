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
            user.fullname = "pedro123";
            user.password = "123";
            user.role_id = 0;
            user.status = "en";
            user.username = "juan123";
            user.id = 4;
            ApiMedkinect apiMedkinect = new ApiMedkinect();


            Specialisms lol = new Specialisms();
            lol.description = "lol1";
            lol.title = "lol1";
            lol.id = 1;
            Specialisms lol2 = new Specialisms();
            lol2.description = "lol1";
            lol2.title = "lol1";
            lol2.id = 2;
            Specialisms lol3 = new Specialisms();
            lol3.id = 3;
            Specialisms lol4 = new Specialisms();
            lol4.description = "lol1";
            lol4.title = "lol1";
            lol3.id = 4;
            Specialisms lol5 = new Specialisms();
            lol5.description = "lol1";
            lol5.title = "lol1";
            lol5.id = 5;

            List<Specialisms> specialisms = new List<Specialisms>();
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
         Object test1 = user.create_user();
         
            /*delete user*/
          //Object test1 = user.delete_user();

            /*get user by id*/
          // Object test1 = user.get_user();
            
            /*get all users*/
        // Object test2 = user.get_all_user();

           
            Console.WriteLine(test1);
            Console.ReadKey();
        }

    }
}
