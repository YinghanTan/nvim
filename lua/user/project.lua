local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
	return
end
project.setup({
  --@usage set to false to disable project.nvim
  -- This is on by default since it's currently the expected behaviour.
  active = true,

  on_config_done = nil,

  --@usage set to true to disable setting the current-working directory
  -- Manual mode doesn't automatically change your root directory, so you have 
  -- the option to manually do so using `:ProjectRoot` command
  --

})
