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
            Specialisms specialisms = new Specialisms();
            Sicks sicks = new Sicks();
            Roles roles = new Roles();
            Patients patients = new Patients();
            Calendars calendars = new Calendars();

            #region user test
            user.email = "diego3@lol.com";
            user.fullname = "pedro3";
            user.password = "123";
            user.role_id = 2;
            user.status = "en";
            user.username = "juan123";
            user.new_password = "1234";
            user.id = 9;
            user.kinect_angle = 2;
            /*update user*/
       //  Object test1 = user.update_user();
            
            /*validate user*/
       //   Object test1 = user.loggin(); 
            
            /*create user*/
      
            Object test1 = user.create_user();
         
            /*delete user*/
       //  Object test1 = user.delete_user();

            /*get user by id*/
      
           //Object test1 = user.get_user();
            
            /*get all users*/
      // Object test1 = user.get_all_user();
          
            /*change password users*/
            //  Object test1 = user.change_password();

            #endregion
            #region specialisms test
            
         /*   specialisms.description = "ophthalmologist2";
            specialisms.title = "ophthalmologist2";
            specialisms.id = 4;*/

            /*update Specialisms*/
          //     Object test1 = specialisms.update_specialism();

            /*create Specialisms*/
           // Object test1 = specialisms.create_specialism();

            /*delete Specialisms*/
           //Object test1 = specialisms.delete_specialism();

            /*get user by id*/

            //Object test1 = specialisms.get_specialism();

            /*get all users*/
            //  Object test1 = specialisms.get_all_specialism();
            #endregion
           #region sicks test

            sicks.description = "anorexy1234";
           sicks.title = "anorexy1234";
           sicks.id = 2;

           /*update Specialisms*/
             //Object test1 = sicks.update_sicks();

           /*create Specialisms*/
         //   Object test1 = sicks.create_sicks();

           /*delete Specialisms*/
        //  Object test1 = sicks.delete_sicks();
          
            /*get user by id*/
          // Object test1 = sicks.get_sicks();

           /*get all users*/
         //  Object test1 = sicks.get_all_sicks();
           #endregion
           #region Roles test

           roles.description = "admin";
           roles.title = "jojo";
           roles.id = 3;
           roles.access = "All";

           /*update roles*/
        //   Object test1 = roles.update_roles();

           /*create roles*/
          //  Object test1 = roles.create_roles();

           /*delete roles*/
           //  Object test1 = roles.delete_roles();

           /*get roles by id*/
          //  Object test1 = roles.get_roles();

           /*get all roles*/
          //  Object test1 = roles.get_all_roles();
           #endregion
           #region Patients test

            patients.id = 2;
            patients.firstname = "juan";
            patients.lastname = "jimenez545564";
            patients.dni = "212154855";
            patients.birthdate = "1989-09-12";
            patients.blood_id = "1";
            patients.historical_id = "2";
            patients.sex = "male";
            patients.marital_status = "lol";
            patients.address = "lol";
            patients.mobile = "13241";
            patients.phone = "4567";
            patients.weight = "54";
            patients.height = "76";

            /*update Patients*/
           //  Object test1 = patients.update_patients();

            /*create Patients*/
          //  Object test1 = patients.create_patients();

            /*delete Patients*/
           //  Object test1 = patients.delete_patients();

            /*get Patients by id*/
         //   Object test1 = patients.get_patients();

            /*get all Patients*/
          //  Object test1 = patients.get_all_patients();
           #endregion
            #region Calendars test

            calendars.id = 2;
            calendars.user_id = 7;
            calendars.patient_id = 7;
            calendars.date = Convert.ToDateTime("2012-09-13");
            calendars.date_type = "mc";
            calendars.result = "mal";
            calendars.status = " bien 1234";

            /*update Calendars*/
            // Object test1 = calendars.update_calendars();

            /*create Calendars*/
           //  Object test1 = calendars.create_calendars();

            /*delete Calendars*/
           //   Object test1 = calendars.delete_calendars();

            /*get Calendars by id*/
            //   Object test1 = calendars.get_calendars();

            /*get all Calendars*/
           //   Object test1 = calendars.get_all_calendars();
             
            /*get  calendar by user*/
           
            //Object test1 = calendars.get_by_user();
            #endregion

            Console.WriteLine(test1);
            Console.ReadKey();
        }

    }
}
