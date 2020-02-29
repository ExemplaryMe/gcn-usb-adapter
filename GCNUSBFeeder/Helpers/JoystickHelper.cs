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

        public static void setTurntable(ref vJoy joystick, TurntableState input, uint joystickID, ControllerDeadZones deadZones, bool sepTableButtons)
        {
            bool res;
            int multiplier = 128;
            //32767
            //left stick - left table on X, right table on Y
            res = joystick.SetAxis(multiplier * input.tableL, joystickID, HID_USAGES.HID_USAGE_X);
            res = joystick.SetAxis(multiplier * input.tableR, joystickID, HID_USAGES.HID_USAGE_Y);

            //right stick - effect on X, crossfader on Y
            res = joystick.SetAxis(multiplier * input.effects, joystickID, HID_USAGES.HID_USAGE_RX);
            res = joystick.SetAxis(multiplier * input.crossfader, joystickID, HID_USAGES.HID_USAGE_RY);

            //buttons
            if (sepTableButtons)
            {
                res = joystick.SetBtn(input.gL, joystickID, 1);
                res = joystick.SetBtn(input.rL, joystickID, 2);
                res = joystick.SetBtn(input.bL, joystickID, 3);
                res = joystick.SetBtn(input.gR, joystickID, 4);
                res = joystick.SetBtn(input.rR, joystickID, 5);
                res = joystick.SetBtn(input.bR, joystickID, 6);
                res = joystick.SetBtn(input.triangle, joystickID, 7);
                res = joystick.SetBtn(input.select, joystickID, 8);
                res = joystick.SetBtn(input.start, joystickID, 9);
                res = joystick.SetBtn(input.ps, joystickID, 11);
            }
            else
            {
                res = joystick.SetBtn(input.cross, joystickID, 1);
                res = joystick.SetBtn(input.circle, joystickID, 2);
                res = joystick.SetBtn(input.square, joystickID, 3);
                res = joystick.SetBtn(input.triangle, joystickID, 4);
                res = joystick.SetBtn(input.select, joystickID, 7);
                res = joystick.SetBtn(input.start, joystickID, 8);
                res = joystick.SetBtn(input.ps, joystickID, 11);
            }

            // dpad
            res = joystick.SetContPov(input.POVstate * 4500, joystickID, 1);
        }

        public static void setJoystick(ref vJoy joystick, GCNState input, uint joystickID, ControllerDeadZones deadZones)
        {
            bool res;
            int multiplier = 127;
            //32767
            //analog stick
            if(!deadZones.analogStick.inDeadZone(input.analogX, input.analogY))
            {
                res = joystick.SetAxis(multiplier * input.analogX, joystickID, HID_USAGES.HID_USAGE_X);
                res = joystick.SetAxis(multiplier * (255 - input.analogY), joystickID, HID_USAGES.HID_USAGE_Y);
            }
            else
            {
                res = joystick.SetAxis(multiplier * 129, joystickID, HID_USAGES.HID_USAGE_X);
                res = joystick.SetAxis(multiplier * 129, joystickID, HID_USAGES.HID_USAGE_Y);
            }
            
            //c stick
            if (!deadZones.cStick.inDeadZone(input.cstickX, input.cstickY))
            {
                res = joystick.SetAxis(multiplier * input.cstickX, joystickID, HID_USAGES.HID_USAGE_RX);
                res = joystick.SetAxis(multiplier * (255 - input.cstickY), joystickID, HID_USAGES.HID_USAGE_RY);
            }
            else
            {
                res = joystick.SetAxis(multiplier * 129, joystickID, HID_USAGES.HID_USAGE_RX);
                res = joystick.SetAxis(multiplier * 129, joystickID, HID_USAGES.HID_USAGE_RY);
            }

            //triggers
            if (!deadZones.LTrigger.inDeadZone(input.analogL))
            {
                res = joystick.SetAxis(multiplier * input.analogL, joystickID, HID_USAGES.HID_USAGE_Z);
            }
            else
            {
                res = joystick.SetAxis(0, joystickID, HID_USAGES.HID_USAGE_Z);
            }
            if (!deadZones.RTrigger.inDeadZone(input.analogR))
            {
                res = joystick.SetAxis(multiplier * input.analogR, joystickID, HID_USAGES.HID_USAGE_RZ);
            }
            else
            {
                res = joystick.SetAxis(0, joystickID, HID_USAGES.HID_USAGE_RZ);
            }

            //dpad button mode for DDR pad support
            res = joystick.SetBtn(input.up,    joystickID, 9);
            res = joystick.SetBtn(input.down,  joystickID, 10); 
            res = joystick.SetBtn(input.left,  joystickID, 11);
            res = joystick.SetBtn(input.right, joystickID, 12);

            //buttons
            res = joystick.SetBtn(input.A,     joystickID, 1);
            res = joystick.SetBtn(input.B,     joystickID, 2);
            res = joystick.SetBtn(input.X,     joystickID, 3);
            res = joystick.SetBtn(input.Y,     joystickID, 4);
            res = joystick.SetBtn(input.Z,     joystickID, 5);
            res = joystick.SetBtn(input.R,     joystickID, 6);
            res = joystick.SetBtn(input.L,     joystickID, 7);
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
                        Log(null, new Driver.LogEventArgs(string.Format("Port {0} is not detected.", id)));
                        checker = false;
                        return checker;
                    default:
                        Log(null, new Driver.LogEventArgs(string.Format("Port {0} general error, cannot continue.", id)));
                        checker = false;
                        return checker;
                }

                //fix missing buttons, if the count is off.
                if (joystick.GetVJDButtonNumber(id) != 12) 
                {
                    SystemHelper.CreateJoystick(id);
                }
            }
            return checker;
        }
    }
}
