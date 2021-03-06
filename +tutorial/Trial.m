%{
# white noise movie frames and related information
-> tutorial.Sample
trial_id : int
-----
stimulus_onset: float   # onset of the stimulus from the beginning of the recording session in seconds
fps: float  # frames per second
n_frames: int  # number of frames
pixel_size: float # pixel size on the retina in um/pixel
stim_width: int   # the width of the stimulus (movie) in pixels
stim_height: int  # the height of the stimulus (movie) in pixels
x_block_size: tinyint # size of x (horizontal) blocks in pixels
y_block_size: tinyint # size of y (horizontal) blocks in pixels
movie: longblob  # An array containing the movie stimulus presented to the mouse retina. The array is shaped as(horizontal blocks, vertical blocks, frames)
%}

classdef Trial < dj.Imported

	methods(Access=protected)

		function makeTuples(self, key)
			self.insert(key)
		end
	end

end