using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_MEDKINECT
{
   public  class Sicks
    {
        ApiMedkinect apiMedkinect = new ApiMedkinect();
        public Sicks() { }

        public int id;
        public string title;
        public string description;


        public Object update_sicks()
        {
            Object result;
            result = apiMedkinect.conexion_rest("put", "api/sicks", this, this.id);
            return result;
        }

        public Object create_sicks()
        {
            Object result;
            result = apiMedkinect.conexion_rest("post", "api/sicks", this, 0);
            return result;
        }

        public Object delete_sicks()
        {
            Object result;
            result = apiMedkinect.conexion_rest("delete", "api/sicks", null, this.id);
            return result;
        }

        public Object get_sicks()
        {
            Object result;
            result = apiMedkinect.conexion_rest("get", "api/sicks", null, this.id);
            return result;
        }

        public Object get_all_sicks()
        {
            Object result;
            result = apiMedkinect.conexion_rest("getall", "api/sicks", null, 0);
            return result;
        }
    }
}
