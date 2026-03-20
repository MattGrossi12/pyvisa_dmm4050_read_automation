import time
import pyvisa

IP = "10.128.15.200"
PORT = 3490

rm = pyvisa.ResourceManager("@py")
dmm = rm.open_resource(f"TCPIP0::{IP}::{PORT}::SOCKET")
dmm.timeout = 5000
dmm.write_termination = "\n"
dmm.read_termination = "\n"

dmm.write("SYST:REM")

for i in range(25):
    v = dmm.query("MEAS:VOLT:DC?")
    print(i, v)
    time.sleep(0.5)