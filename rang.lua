-- scaffold geniefile for rang

rang_script = path.getabsolute(path.getdirectory(_SCRIPT))
rang_root = path.join(rang_script, "rang")

rang_includedirs = {
	path.join(rang_script, "config"),
	rang_root,
}

rang_libdirs = {}
rang_links = {}
rang_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { rang_includedirs }
	end,

	_add_defines = function()
		defines { rang_defines }
	end,

	_add_libdirs = function()
		libdirs { rang_libdirs }
	end,

	_add_external_links = function()
		links { rang_links }
	end,

	_add_self_links = function()
		links { "rang" }
	end,

	_create_projects = function()

project "rang"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		rang_includedirs,
	}

	defines {}

	files {
		path.join(rang_script, "config", "**.h"),
		path.join(rang_root, "**.h"),
		path.join(rang_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
