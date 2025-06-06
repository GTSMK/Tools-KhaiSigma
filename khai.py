import os
import sys

NAMA_ASLI = "khai.py"

if os.path.basename(__file__) != NAMA_ASLI:
    print("❌ Nama file sudah diganti. Keluar...")
    sys.exit()


import os
import sys

print("\033[1;32mSilahkan Masukkan Key")
print("\033[1;32matau silahkan Hubungi Khai Atau Zannnyx")

key = "KhaiSigma"

def restart():
    ngulang = sys.executable
    os.execl(ngulang, ngulang, *sys.argv)

def main():
    keynya = input("Key : ")
    if keynya == key:
        print("\033[1;32mAlhamdulillah sudah masuk juga..")
        os.system('bash info.sh')
    else:
        print("\033[1;32mMaaf key salah... [?]\033[00m")
        print("Silahkan segera login kembali...!!\n")
        restart()

try:
    main()
except KeyboardInterrupt:
    os.system('clear')
    restart()