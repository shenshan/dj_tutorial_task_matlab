%{
# session
-> tutorial.Animal
session_date: date   
-----
session_notes = null: char(128)
session_ts = CURRENT_TIMESTAMP: timestamp  # time stamp
%}

classdef Session < dj.Manual
end