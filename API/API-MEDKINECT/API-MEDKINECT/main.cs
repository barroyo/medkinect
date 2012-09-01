using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace API_MEDKINECT
{
    public class main
    {
        public main(){     
        }


        public object  conexion_rest(string type_request,string controller,object jsonObject,int id)
        {
            string json = JsonConvert.SerializeObject(jsonObject);
            string host = "http://localhost:3000/";
            HttpWebRequest request;

            request = (HttpWebRequest)WebRequest.Create(host + controller + ".json");
            if (type_request == "post")
            {
                request.Method = WebRequestMethods.Http.Post;
                byte[] data = Encoding.UTF8.GetBytes(json);

                request.ContentType = "application/json";
                request.Accept = "application/json";
                request.ContentLength = data.Length;
                StreamWriter postStream = new StreamWriter(request.GetRequestStream(), System.Text.Encoding.ASCII);
                postStream.Write(json);
                postStream.Close();
            }
            if (type_request == "get")
            {  
                if (id != -1)
                {
                    request = (HttpWebRequest)WebRequest.Create(host + controller + "/"+id);
                }
                request.Method = WebRequestMethods.Http.Get;

            }
            if (type_request == "Put")
            {
                request = (HttpWebRequest)WebRequest.Create(host + controller + "/"+id);
                request.Method = WebRequestMethods.Http.Put;
                request.ContentType = "application/json";
                request.Accept = "application/json";
                byte[] data = Encoding.UTF8.GetBytes(json);
                request.ContentLength = data.Length;
                StreamWriter postStream = new StreamWriter(request.GetRequestStream(), System.Text.Encoding.ASCII);
                postStream.Write(json);
                postStream.Close();

            }
            NetworkCredential credentials = new NetworkCredential("username", "123");
            CredentialCache cache = new CredentialCache();
            cache.Add(new Uri(host),"Basic", credentials);
            cache.Add(new Uri(host),"Negotiate",credentials);
            request.Credentials = cache;
            

            HttpWebResponse  response = (HttpWebResponse)request.GetResponse();

            StreamReader sr = new StreamReader(response.GetResponseStream(),  Encoding.UTF8);
            string html = sr.ReadToEnd();

           object json_respond = JsonConvert.DeserializeObject(html);

           return json;
            //return html;
   

        }

    }
}
