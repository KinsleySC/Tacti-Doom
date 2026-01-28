using System;
using System.Net;
using System.Reflection.Metadata.Ecma335;

namespace Doom
{
    class Program
    {
        public static int Save_System()
        {
            string path = "SaveProfile.txt";

            if (!File.Exists(path))
            {
                using (FileStream fs = File.Create(path))
                {
                    Byte[] info = new UTD8Encoding(true).GetBytes(FunctionAttribesO);

                    fs.Write(info, 0, info.Length);
                }
            }
            using (FileS)
        }
    }
}
    