function plotSTA(varargin)
% plotSTA plot the spatial temporal receptive field of a given cell

keys = fetch(tutorial.Strf & varargin);

for key = keys'
    sta = fetch1(tutorial.Strf & key, 'sta');
  
    figure; imagesc(sta); colormap('bone')
end