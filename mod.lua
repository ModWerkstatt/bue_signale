﻿function data()
return {
	info = {
		minorVersion = 4,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		params = {
			{
				key = "bue_signal_at",
				name = _("Österreich"),
				uiType = "CHECKBOX",
				values = { _("no"), _("yes"), },
				defaultIndex = 0,
			},
		},
		authors = {
			{
				name = "ModWerkstatt",
				role = "CREATOR",
			},
		},
		tags = { "Signal", "Bahnübergang", "crossing signal", },
		dependencies = { "modwerkstatt_signalkomponenten_1" },
	},
    runFn = function (settings, modParams)

		local function ATFilter(fileName, data)
			if data.metadata.signal and data.metadata.bue_signale and data.metadata.bue_signale.country == "at" then
                data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 2
			end
			return data
		end

        if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["bue_signal_at"] == 0 then
				addModifier("loadModel", ATFilter)
			end
        end
    end
}
end
