	_, gfyIsOn := gfyOs.LookupEnv("GO_FUCK_YOURSELF")
	if gfyIsOn {
		gfy, _ := gfyRegexp.MatchString("(declared and not used|imported and not used)", format)
		if gfy {
			_, gfyVerbose := gfyOs.LookupEnv("GO_FUCK_YOURSELF_VERBOSE")
			if gfyVerbose {
				gfyFmt.Fprintf(os.Stderr, "[GFY] " + format + "\n", args...)
			}
			return
		}
	}
