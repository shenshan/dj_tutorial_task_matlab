%{
# sample
-> tutorial.Session
sample_id                     : tinyint                       # id of the sample
---
sample_notes = null           : char(128)                     # 
sample_ts = CURRENT_TIMESTAMP : timestamp                     # 
%}

classdef Sample < dj.Manual
end
