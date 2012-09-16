using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_MEDKINECT
{
    public class User : ApiMedkinect
    {
      
        public User() { }

        public string email;

        public string username;

        public string fullname;

        public string password;

        public int role_id;

        public string status;

        public int id;

        public List<Specialisms> specialisms = new List<Specialisms>();

        public String new_password;

        public float kinect_angle;
   

        public Object loggin()
        {
            return this.conexion_rest("post", "api/users/login", this, -1);
        }

        public Object update_user()
        {
            return this.conexion_rest("post", "api/users/#/update", this, this.id);
        }

        public Object create_user()
        {
            return this.conexion_rest("post", "api/users/new", this, -1);
        }

        public Object delete_user()
        {
            return this.conexion_rest("post", "api/users/#/delete", this, this.id);
        }

        public Object get_user()
        {
           return this.conexion_rest("get", "api/users/#", null, this.id);
           
        }

        public Object get_all_user()
        {
             return  this.conexion_rest("get", "api/users", null, -1);
           
        }

        public Object change_password()
        {
            return this.conexion_rest("post", "/api/users/#/change_password", this, this.id);

        }



    }
}
