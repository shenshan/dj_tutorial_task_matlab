%{
# spatial-temporal receptive field
-> tutorial.SpkTrain
-----
sta: blob  # spike triggered average
%}

classdef Strf < dj.Computed

	methods(Access=protected)

		function makeTuples(self, key)
            
            spk_train = fetch1(tutorial.SpkTrain & key, 'spk_train');
            [stim_onset, fps, n_frames, movie] = fetch1(tutorial.Trial & key, 'stimulus_onset', 'fps','n_frames', 'movie');
            
            % define time bins as 
            time_bins = ((0:n_frames-1)+0.5)/fps;
            
            % restrict spk trains to the time range of the movie 
            spk_train = spk_train - stim_onset;
            spk_train_rel = spk_train(spk_train < n_frames/fps);
    
            % compute spks in the time bin of each frame
            spk_idx = interp1(time_bins, 1:length(time_bins), spk_train_rel, 'nearest');
            spks = zeros(length(time_bins),1);
            
            for i = 1:length(time_bins)
                spks(i) = sum(spk_idx == i);
            end
            
            % compute sta
            nsp = sum(spks);
            movie_vec = reshape(movie, [size(movie,1)*size(movie,2), size(movie,3)]);
            key.sta = reshape(movie_vec*spks/nsp, [size(movie,1), size(movie,2)]);
            
			self.insert(key)
		end
	end

end