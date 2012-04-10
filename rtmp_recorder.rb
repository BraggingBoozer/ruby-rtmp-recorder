# -*- coding: utf-8 -*-
#
#= The library for frontend of rtmpdump.
#
#Authors::   Bragging Boozer<bragging.boozer@gmail.com>
#Version::   0.1
#License::   GPL Ver. 2.0
#Copyright:: Copyright (C) 2012 BraggingBoozer<bragging.boozer@gmail.com>. All rights reserved.
#
#This program is free software; you can redistribute it and/or modify it under
#the terms of the GNU General Public License as published by the Free Software
#Foundation; either version 2 of the License, or (at your option) any later
#version.
#        
#This program is distributed in the hope that it will be useful, but WITHOUT
#ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
#FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
#details.
#        
#You should have received a copy of the GNU General Public License along with
#this program; if not, see <http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt>.

#= Frontend class for rtmpdump
#
#You can record stream to file with this class.
class RtmpRecorder
  #File name of recorded stream
  attr_reader :filename

  #== Initializer
  #
  #=== Parameters
  #option:: comand line options for rtmpdump
  #extension:: stream file extention
  #station_id:: identifier of streamer station
  #=== Returns
  #none
  #=== Note
  #Set instance variables.
  def initialize(option, extension, station_id)
    @opts = option
    @ext = extension
    @sid = station_id
  end

  #== Record stream
  #
  #=== Parameters
  #minutes:: recording time in minutes
  #=== Returns
  #none
  #=== Note
  #Run rtmpdump command with specified information.
  def rec(minutes)
    minutes *= 60

    @filename = Time.now.strftime("%Y-%m-%d_%H:%M:%S_") + @sid + "." + @ext

    system("rtmpdump " + @opts + " -B " + minutes.to_s + " -o " + @filename)
  end
end
