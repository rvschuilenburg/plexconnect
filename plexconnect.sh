#!/bin/bash
# Check if existing config file exist, if so will use it.
  
 echo "*** Check if previous config exist, if so will use it..."  
  if [ -f /config/Settings.cfg ]; then   
    ln -s /config/Settings.cfg /opt/plexconnect/Settings.cfg
  else
    /usr/bin/python /opt/plexconnect/Settings.py 
    ln -s /opt/plexconnect/Settings.cfg /config/Settings.cfg 
    ln -s /opt/plexconnect/ATVSettings.cfg /config/ATVSettings.cfg 
  fi

 echo "*** Check if previous ATVconfig exist, if so will use it..."  
  if [ -f /config/ATVSettings.cfg ]; then   
    ln -s /config/ATVSettings.cfg /opt/plexconnect/ATVSettings.cfg
  else
    echo "*** Copy Done."
  fi

# Run the PlexConnect  
echo "*** Launching PlexConnect..."
exec /usr/bin/python /opt/plexconnect/PlexConnect.py

