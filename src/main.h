/*******************************************************************************
Main code for communication with the web browser and run the program in Python.

Python swimming Copyright (C) 2012 Jesús Hernández Gormaz
 This program is free software; you can redistribute it and/or modify it under
  the terms of the GNU General Public License as published by the Free Software
  Foundation; either version 3, or (at your option) any later version.
 This program is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
  FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with
  this program; if not, write to the Free Software Foundation, Inc., 675 Mass
  Ave, Cambridge, MA 02139, USA.
*******************************************************************************/

#ifndef MAIN_H
#define MAIN_H

// This just needs to include NPAPI headers, change the path to whatever works
// for you. Note that "XP_UNIX=1" is defined in the makefile so that the NPAPI
// headers know we're compiling for unix.
#include <npapi.h>
#include <npfunctions.h>

NPError NP_Initialize(NPNetscapeFuncs* bFuncs, NPPluginFuncs* pFuncs);
NPError NP_Shutdown();

NPError NPP_New(NPMIMEType pluginType, NPP instance, uint16_t mode, int16_t argc, char* argn[], char* argv[], NPSavedData* saved);
NPError NPP_Destroy(NPP instance, NPSavedData** save);
NPError NPP_SetWindow(NPP instance, NPWindow* window);
NPError NPP_NewStream(NPP instance, NPMIMEType type, NPStream* stream, NPBool seekable, uint16_t* stype);
NPError NPP_DestroyStream(NPP instance, NPStream* stream, NPReason reason);
int32_t NPP_WriteReady(NPP instance, NPStream* stream);
int32_t NPP_Write(NPP instance, NPStream* stream, int32_t offset, int32_t len, void* buffer);
void    NPP_StreamAsFile(NPP instance, NPStream* stream, const char* fname);
void    NPP_Print(NPP instance, NPPrint* platformPrint);
int16_t NPP_HandleEvent(NPP instance, void* event);
void    NPP_URLNotify(NPP instance, const char* URL, NPReason reason, void* notifyData);
NPError NPP_GetValue(NPP instance, NPPVariable variable, void *value);
NPError NPP_SetValue(NPP instance, NPNVariable variable, void *value);

#define MIME_TYPE_DESCRIPTION "application/basic-plugin:bsp:Basic Example Plug-in"
const char* NP_GetMIMEDescription(void)
{
  return(MIME_TYPES_DESCRIPTION);
}

#endif // MAIN_H
