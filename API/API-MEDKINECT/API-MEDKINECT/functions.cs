using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_MEDKINECT
{
    public class functions
    {
        public functions() { }

        public Object loggin(string username, string password)
        {
            Object result;
            User user =new User();
            user.username = username;
            user.password = password;
            main rest = new main();
            result = rest.conexion_rest("get", "validation", user, -1);
            return result;
        }

    }
}
