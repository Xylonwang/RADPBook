function cvx_save_prefs( varargin )

%CVX_SAVE_PREFS   Saves current CVX settings for future MATLAB sessions.
%   CVX_SAVE_PREFS saves the the current global CVX settings to a special
%   prefences file (stored in the "prefdir" directory). This enables CVX to
%   remember your preferred settings (solver, precision, etc.) between
%   MATLAB sessions.

global cvx___
if ~isfield( cvx___, 'pfile' ),
    cvx_throw( 'CVX is not currently loaded; there are no preferences to save.' );
elseif nargin == 0,
    fprintf( 'Saving prefs...' );
end
outp.path      = cvx___.path;
outp.license   = cvx___.license;
outp.solvers   = cvx___.solvers;
outp.broadcast = cvx___.broadcast;
outp.expert    = cvx___.expert;
outp.precision = cvx___.precision;
outp.precflag  = cvx___.precflag;
outp.quiet     = cvx___.quiet;
outp.profile   = cvx___.profile;
outp.solvers.map.default = cvx___.solvers.selected;
[ outp.solvers.list.check, outp.solvers.list.solve, outp.solvers.list.eargs ] = deal( {} );
outp.solvers.active = 0;
save(cvx___.pfile,'-struct','outp');
if nargin == 0,
    fprintf( 'done.\n' );
end

% Copyright 2005-2014 CVX Research, Inc.
% See the file LICENSE.txt for full copyright information.
% The command 'cvx_where' will show where this file is located.
