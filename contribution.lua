function Image(img)
    if img.classes:find('contribution', 1) then
        local f = io.open("comment/" .. img.src, 'r')
        local doc = pandoc.read(f:read('*a'))
        f:close()
        local contribution = pandoc.utils.stringify(doc.meta.contribution) or "contribution has not been set"
        local student = pandoc.utils.stringify(doc.meta.student) or "student has not been set"
        local id = pandoc.utils.stringify(doc.meta.id) or "id has not been set"
        local credentials = "Student: " .. student .. " (" .. id .. ")"
        local text = "\n\n> " .. contribution .. " \n\n>" .. "" .. credentials .. ""
        return pandoc.RawInline('markdown', text)
    end
end