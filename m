Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47768221FBA
	for <regressions@lists.linux.dev>; Sat, 28 Jun 2025 12:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751115221; cv=none; b=V0deHdivA3i575XwxzlytXGSLZD/yCY6tQT7kyda6iw77f27gqd1ZEk+mtHZa1T4PpWB4xxes0FT4BCD4aaKkJfEiD3odrvdzkjDdPyEAKEaVG4bfyKWKIv/Y2wsZw3//9B4IV1Yj87ZAGsHK+91qkNhLwN+VhxjkjIgpej9G7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751115221; c=relaxed/simple;
	bh=RPTWfAerU3YqFi9jqzXG9kMIOoAPkljelX3gg4t5Q+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjfjEXBw9e3ttNARkO+caJEgZfawFkEo3gHmH4A3kRXEky5xs2YCZGAIAaOSVFvJ2PvBj3wW2xua0t4mIOIgOfnNoZjT6jbY+lb4j3+e1W0dMHyscor480YQJSfOYZqXT8826cKBxcne205LmvxIE8MbYqz0faTb1vby8SyRu6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alyssa.is; spf=pass smtp.mailfrom=alyssa.is; dkim=pass (2048-bit key) header.d=alyssa.is header.i=@alyssa.is header.b=d8BvBIo3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YI/Mb8u6; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alyssa.is
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alyssa.is
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alyssa.is header.i=@alyssa.is header.b="d8BvBIo3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YI/Mb8u6"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 26AA9140020B;
	Sat, 28 Jun 2025 08:53:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sat, 28 Jun 2025 08:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1751115217; x=1751201617; bh=VHVKuKGAPV
	KoI1l7NUOtuO0IqrKtntRvHVJ//HFzRV0=; b=d8BvBIo3u2tMvW788UT1Yg3AT8
	NuB8FRnpxGCYsbsSpGG+EaEbiPY7QXh6bi8i2ErdQPRSaAgsqMfC8bD7o0NFQQma
	9N7In19lOVJsym2EvIUkUJyXIbws+sKp0Cl3eVwUjoZQ5Mnb/MdbDF5p6onX28Tx
	ZIR8Tgg9eivHHTor6uYaGq6uX+898ZqDVwUyePf6gvRprx5YSriAnDWgMllkoRhf
	BXODnohl56NhtSjblU++RXDPX/U0wW6KiX0BebEHwA30q7rXTOTNdgoUAxHCORvW
	jsRVfF3XJPrnNNBVBgW5y/GTSXRatm0dupyjwSgUfThWpq9/uJebVsH0WeYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751115217; x=1751201617; bh=VHVKuKGAPVKoI1l7NUOtuO0IqrKtntRvHVJ
	//HFzRV0=; b=YI/Mb8u6b0aOgHJUy9S6O0SzI5Zzd3CFt8nR8WY5H+bn6iYkNAh
	Drv/bwSLvKUveqa04Pb/9oU3on/oVQUS2PP5PT2O6Nqhzm3TbX+b19aesPVwzxds
	DyO2NrKDSDd2n9Kst4BnnDJzWKWow8UTSLlyNTaF5i3NhZHNkOhE9RnEny6N/UHz
	X/bZANuR+k1DKhzQrLMRt+FVIXIZ1AHiqcuSd/gB5+ek/SS3ysYJpsB8NXFDDEj4
	38XToxFAmrr4ZdA10hZrVjtaHsEP+uTyRysLRGVxSU822k4Qx+VBKKVbKfOwQqoV
	Syqg0KyL1QHb83vkPOYT/18lN6wvF7FV9lQ==
X-ME-Sender: <xms:0OVfaNwAnAGRWkrfTAT9AmwkLRmX4vweFtXr1DMegbeU2QUyC2MZKw>
    <xme:0OVfaNQh-LLlbl8c24chbJvOLgppcTvOwhQlB1JOsCJPgJRYmsv7OuDoWq0mHu5so
    SkTSNSHKbXKl1mcUw>
X-ME-Received: <xmr:0OVfaHU32yDRLWavnn2cblWDcKD3fALe5RHMVfCNbKew76rzmT4d5NBn0jeJZE5ldt-LrT2Fue4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtdfsredttd
    dvnecuhfhrohhmpeetlhihshhsrgcutfhoshhsuceohhhisegrlhihshhsrgdrihhsqeen
    ucggtffrrghtthgvrhhnpefhfedvgfeliedvudegueefleehudellefgleetudehveelhe
    etiefgteegvddutdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdr
    tghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hhihesrghlhihsshgrrdhishdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtohepsghughiiihhllhgrqdgurggvmhhonheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheprhgvghhrvghsshhiohhnsheslhhishhtshdrlhhinhhugidruggv
    vhdprhgtphhtthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:0OVfaPgm6csioXbB6DvgcxjrDIQfqP9VnunXlfxOAsRyM2TJBM8t_g>
    <xmx:0OVfaPArLISqbiu6NL-wKpdnQK4yQpe9Evf2to0i2-DuabyCsjJIbA>
    <xmx:0OVfaILxbhgu4qpoiwUDmwvIRPgBbRnMe1qD8aC-PTSkjlDnXkWgSw>
    <xmx:0OVfaOAxrebK7kEQdCNYoEObvZ-L59m3Fx8HWYkwL8qsJMVEKu0Plg>
    <xmx:0eVfaF7w_PdxAKsDFgssYPR2_1iTvStr8h-XPXYl7R-a5m1PQ0OO4vW5>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Jun 2025 08:53:36 -0400 (EDT)
Received: by sf.qyliss.net (Postfix, from userid 1000)
	id 2320626426AEC; Sat, 28 Jun 2025 14:53:35 +0200 (CEST)
Date: Sat, 28 Jun 2025 14:53:35 +0200
From: Alyssa Ross <hi@alyssa.is>
To: regressions@lists.linux.dev
Cc: linux-usb@vger.kernel.org, bugzilla-daemon@kernel.org
Subject: Re: [Bug 220284] New: USB4 / Thunderbolt not working after boot
 until thunderbolt module is reloaded
Message-ID: <gsq43mj473w7osdxpfwuvk5mmef63oc2t3mjem43lb2zmdzzo5@3i6x5pnodszg>
References: <bug-220284-208809@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="55jbroev6njdmhfc"
Content-Disposition: inline
In-Reply-To: <bug-220284-208809@https.bugzilla.kernel.org/>


--55jbroev6njdmhfc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [Bug 220284] New: USB4 / Thunderbolt not working after boot
 until thunderbolt module is reloaded
MIME-Version: 1.0

On Fri, Jun 27, 2025 at 05:29:56PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=220284
>
>             Bug ID: 220284
>            Summary: USB4 / Thunderbolt not working after boot until
>                     thunderbolt module is reloaded
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 6.15.3
>           Hardware: AMD
>                 OS: Linux
>             Status: NEW
>           Severity: normal
>           Priority: P3
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: kim.lindberger@gmail.com
>         Regression: Yes
>
> Laptop: Lenovo ThinkPad T14s Gen 4, model 21F8CTO1WW (AMD)
>
>
> When upgrading from 6.15.2 to 6.15.3 my ThinkPad Thunderbolt 4 Dock stopped
> working, giving basically no signs of life even when unplugged and replugged.
> It doesn't start working again until the thunderbolt module is unloaded and
> reloaded while the dock is still connected. If I unload and reload while the
> dock is disconnected, nothing happens.
>
> When booting, I can also see
>
> thunderbolt 0000:c5:00.6: probe with driver thunderbolt failed with error -110
>
> in the log, which wasn't printed with prior kernels.
>
> I don't boot with the dock connected.
>
> The issue persist with 6.15.4.

#regzbot introduced v6.15.2..v6.15.3 ^
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=220284
#regzbot link: https://github.com/NixOS/nixpkgs/issues/420730
#regzbot title USB4 / Thunderbolt not working after boot until thunderbolt module is reloaded

--55jbroev6njdmhfc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRV/neXydHjZma5XLJbRZGEIw/wogUCaF/lzQAKCRBbRZGEIw/w
ooP5AQDlE1/5JkjToRXOkSzQFfWr4k7eMvlAef06EyF5TM1xaQEA+mVJtTeNSOLT
G/XoNJuqFy5BCYxpNJtRKt/I8Lh8yww=
=7tOh
-----END PGP SIGNATURE-----

--55jbroev6njdmhfc--
