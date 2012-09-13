using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API_MEDKINECT
{
   public  class Sicks : ApiMedkinect
    {
      
        public Sicks() { }

        public int id;
        public string title;
        public string description;


        public Object update_sicks()
        {
            return this.conexion_rest("post", "api/sicks/#/update", this, this.id);
        }

        public Object create_sicks()
        {
            return this.conexion_rest("post", "api/sicks/new", this, -1);
        }

        public Object delete_sicks()
        {
            return this.conexion_rest("post", "api/sicks/#/delete", this, this.id);
        }

        public Object get_sicks()
        {
            return this.conexion_rest("get", "api/sicks/#", null, this.id);

        }

        public Object get_all_sicks()
        {
            return this.conexion_rest("get", "api/sicks", null, -1);

        }
    }
}
