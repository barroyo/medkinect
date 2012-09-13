using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_MEDKINECT
{
    public class User
    {
        ApiMedkinect apiMedkinect = new ApiMedkinect();
        public User() { }

        public string email;


        public string username;


        public string fullname;


        public string password;


        public int role_id;


        public string status;

        public int id;

        public List<Specialisms> specialisms = new List<Specialisms>();




        public Object loggin()
        {
            Object result;
            result = apiMedkinect.conexion_rest("post", "api/users/login", this, 0);
            return result;
        }

        public Object update_user()
        {
            Object result;
            result = apiMedkinect.conexion_rest("put", "api/users", this, this.id);
            return result;
        }

        public Object create_user()
        {
            Object result;
            result = apiMedkinect.conexion_rest("post", "api/users/new", this, 0);
            return result;
        }

        public Object delete_user()
        {
            Object result;
            result = apiMedkinect.conexion_rest("delete", "api/users/", null, this.id);
            return result;
        }

        public Object get_user()
        {
            Object result;
            result = apiMedkinect.conexion_rest("get", "api/users", null, this.id);
            return result;
        }

        public Object get_all_user()
        {
            Object result;
            result = apiMedkinect.conexion_rest("getall", "api/users", null, 0);
            return result;
        }


    }
}
