local status_ok, gitconflict = pcall(require, "git-conflict")
if not status_ok then
    return
end

gitconflict.setup({
  default_mappings = true, -- disable buffer local mapping created by this plugin
  disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
  highlights = { -- They must have background color, otherwise the default color will be used
    incoming = 'MyDiffText',
    current = 'MyDiffAdd',
    ancestor = 'MyDiffBase',
    CURRENT_LABEL_HL = '#FFFFFF',
    INCOMING_LABEL_HL = '#FFFFFF',
    ANCESTOR_LABEL_HL = '#FFFFFF',
  }
})
