#!/bin/bash
# Check if existing config file exist, if so will use it.
  
 echo "*** Check if previous config exist, if so will use it..."  
  if [ -f /config/Settings.cfg ]; then   
    ln -s /config/Settings.cfg /opt/plexconnect/Settings.cfg
  else
    /usr/bin/python /opt/plexconnect/Settings.py 
    mv /opt/plexconnect/Settings.cfg /config/Settings.cfg
    mv /opt/plexconnect/ATVSettings.cfg /config/ATVSettings.cfg
    ln -s /config/Settings.cfg /opt/plexconnect/Settings.cfg 
    ln -s /config/ATVSettings.cfg /opt/plexconnect/ATVSettings.cfg
  fi

 echo "*** Check if previous ATVconfig exist, if so will use it..."  
  if [ -f /config/ATVSettings.cfg ]; then   
    ln -s /config/ATVSettings.cfg /opt/plexconnect/ATVSettings.cfg
  fi

echo "*** Copy Done."

# Run the PlexConnect  
echo "*** Launching PlexConnect..."
exec /usr/bin/python /opt/plexconnect/PlexConnect.py

