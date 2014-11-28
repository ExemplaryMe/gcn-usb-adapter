﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using vJoyInterfaceWrap;

namespace GCNUSBFeeder
{
    public class JoystickHelper
    {
        public static event EventHandler<Driver.LogEventArgs> Log;
        public static void setJoystick(ref vJoy joystick, GCNState input, uint joystickID)
        {
            bool res;
            
            //analog stick
            res = joystick.SetAxis(input.analogX, joystickID, HID_USAGES.HID_USAGE_X);
            res = joystick.SetAxis((255-input.analogY), joystickID, HID_USAGES.HID_USAGE_Y);

            //c-stick
            res = joystick.SetAxis(input.cstickX, joystickID, HID_USAGES.HID_USAGE_RX);
            res = joystick.SetAxis(255-input.cstickY, joystickID, HID_USAGES.HID_USAGE_RY);

            //triggers
            res = joystick.SetAxis(input.analogL, joystickID, HID_USAGES.HID_USAGE_Z);
            res = joystick.SetAxis(input.analogR, joystickID, HID_USAGES.HID_USAGE_RZ);

            //dpad
            res = joystick.SetDiscPov(input.POVstate, joystickID, 1);

            //buttons
            res = joystick.SetBtn(input.A, joystickID, 1);
            res = joystick.SetBtn(input.B, joystickID, 2);
            res = joystick.SetBtn(input.X, joystickID, 3);
            res = joystick.SetBtn(input.Y, joystickID, 4);
            res = joystick.SetBtn(input.Z, joystickID, 5);
            res = joystick.SetBtn(input.R, joystickID, 6);
            res = joystick.SetBtn(input.L, joystickID, 7);
            res = joystick.SetBtn(input.start, joystickID, 8);
        }

        public static bool checkJoystick(ref vJoy joystick, uint id)
        {
            bool checker = false;
            if (joystick.vJoyEnabled())
            {
                VjdStat status = joystick.GetVJDStatus(id);
                switch (status)
                {
                    case VjdStat.VJD_STAT_OWN:
                        Log(null, new Driver.LogEventArgs(string.Format("Port {0} is already owned by this feeder (OK).", id)));
                        checker = true;
                        break;
                    case VjdStat.VJD_STAT_FREE:
                        Log(null, new Driver.LogEventArgs(string.Format("Port {0} is detected (OK).", id)));
                        checker = true;
                        break;
                    case VjdStat.VJD_STAT_BUSY:
                        Log(null, new Driver.LogEventArgs(string.Format("Port {0} is already owned by another feeder, cannot continue.", id)));
                        checker = false;
                        return checker;
                    case VjdStat.VJD_STAT_MISS:
                        Log(null, new Driver.LogEventArgs(string.Format("Port {0} is not installed or disabled, cannot continue.", id)));
                        checker = false;
                        return checker;
                    default:
                        Log(null, new Driver.LogEventArgs(string.Format("Port {0} general error, cannot continue.", id)));
                        checker = false;
                        return checker;
                }

                int numPOVs = joystick.GetVJDDiscPovNumber(id);
                if (numPOVs != 1) { checker = false; }
                int numButtons = joystick.GetVJDButtonNumber(id);
                if (numButtons != 8) { checker = false; }

                //analog stick
                checker = joystick.GetVJDAxisExist(id, HID_USAGES.HID_USAGE_X);
                checker = joystick.GetVJDAxisExist(id, HID_USAGES.HID_USAGE_Y);

                //c stick
                checker = joystick.GetVJDAxisExist(id, HID_USAGES.HID_USAGE_RX);
                checker = joystick.GetVJDAxisExist(id, HID_USAGES.HID_USAGE_RY);

                //triggers
                checker = joystick.GetVJDAxisExist(id, HID_USAGES.HID_USAGE_Z);
                checker = joystick.GetVJDAxisExist(id, HID_USAGES.HID_USAGE_RZ);
            }

            return checker;
        }
    }
}
