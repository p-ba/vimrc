return {
    "tobyS/pdv",
    dependencies = {
        "tobyS/vmustache",
    },
    config = function ()
        vim.g.pdv_template_dir = vim.fn.stdpath("data") .. "/lazy/pdv/templates_snip";
        vim.keymap.set("n", "<Leader>dl", ":call pdv#DocumentCurrentLine()<CR>", { silent = true })
    end
}
