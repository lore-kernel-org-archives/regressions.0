Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EF586323
	for <regressions@lists.linux.dev>; Thu, 16 Jan 2025 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737048258; cv=none; b=av6PtSkXoxYkp/rMDONjMgkkGqkWxQW85IZb79VYiuh0okVdUgZEVVTJgCe9kCqsTeP0y/g4CP5haww/XvfhugLobS+/VyRdi2mFrC8JEVYZkkezP7Czs/r5+X5hYmm5fnK37/qpERkFdmK7kTsoyzki6vQGUNCcYf7oRGmiPzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737048258; c=relaxed/simple;
	bh=AMHNvNMHRuWnaCzen16m1oTw8xIKGBdKNpcTlFlsJ4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbdGRb+RXNLSEPJ0gcR9BU3IuWLRFTg6LOh4gRRCLgrVAxb+77eUbBPr8xAu5K4/q7V+CsYNtXGPsKB3bPIEegxQ5XtlWegyAe0DbNSlePSEX9s91UikBUj9mgm5MHV6QAZeRgGt9Ok5rGvgAgjOaO8cDWpc3A0u/emV/KFcVSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id D908D28008B10;
	Thu, 16 Jan 2025 18:24:05 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id C344288DDAD; Thu, 16 Jan 2025 18:24:05 +0100 (CET)
Date: Thu, 16 Jan 2025 18:24:05 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] Kernel version 6.13.rc4 not powering off laptop
Message-ID: <Z4lAtbsMZAAoHIP9@wunner.de>
References: <20241227231520.GA3929732@bhelgaas>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227231520.GA3929732@bhelgaas>

On Fri, Dec 27, 2024 at 05:15:20PM -0600, Bjorn Helgaas wrote:
> #regzbot introduced: 665745f27487 ("PCI/bwctrl: Re-add BW notification portdrv as PCIe BW controller")

#regzbot fix: 15b8968dcb90f194d44501468b230e6e0d816d4a
