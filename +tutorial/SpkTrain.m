%{
# spike train of a particular cell on a trial
-> tutorial.Cell
-> tutorial.Trial
-----
spk_train: longblob  # spike times of a cell during a trial
%}

classdef SpkTrain < dj.Imported

	methods(Access=protected)

		function makeTuples(self, key)
		%!!! compute missing fields for key here
			 self.insert(key)
		end
	end

end