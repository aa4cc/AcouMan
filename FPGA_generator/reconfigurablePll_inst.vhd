reconfigurablePll_inst : reconfigurablePll PORT MAP (
		areset	 => areset_sig,
		configupdate	 => configupdate_sig,
		inclk0	 => inclk0_sig,
		scanclk	 => scanclk_sig,
		scanclkena	 => scanclkena_sig,
		scandata	 => scandata_sig,
		c0	 => c0_sig,
		locked	 => locked_sig,
		scandataout	 => scandataout_sig,
		scandone	 => scandone_sig
	);
