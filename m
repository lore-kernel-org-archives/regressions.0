Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED6C274670
	for <regressions@lists.linux.dev>; Sat, 21 Mar 2026 21:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774129968; cv=none; b=qrnbiOhVeX84p2SKl+Xi5hh4WKxvd2+tksKiv2GQXJq7ZWVkpD+YPsAA9eXDEsQXyZDGVMKjC9GVn6d+3NiUGGBVYRjwrvJJA3JWWceIAERj6615BjtKAk4OEpLEMH2rHC63+3R11vKQ1WuexBqdZ7JM7eV4oeZM3UxcV169DNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774129968; c=relaxed/simple;
	bh=mTQeeyGFv9eJ7NemyaFRaMSH6By+1TNkteEkFS10XJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HlSGOtPbjypZ6Eqt5af35Wu9seqi4m48Icp/wT3AwKm33c9Ue2w28xumvgDYsp0kylwUXEpRzjbwtb2xp1+tE62M6ys616PkXU1bECoJ26T8QrfD4k6NuaQslVZlDTJusxvjQ1aMU/E+8cKuKzmXwa1q71k4Ek/QTmbSvrdwExo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=L2+hIlCb; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="L2+hIlCb"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7635C40E0281;
	Sat, 21 Mar 2026 21:52:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3RF5vWBE826H; Sat, 21 Mar 2026 21:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1774129956; bh=hXJp8v6ckwr+ohJPYtn67ZS4LwqZRB2+Lx77CGTmKEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L2+hIlCbP/o9k+XDbYie0A//SoNIFfE8GBtcS6IWDCVO/ZlG1UKglTgD9O3ulCIXL
	 J6TJ9N2koCvuxy/XIx1eDKj/oJjaRwx+4IOQP1BFS3t/AHt+caidQowNo1KQuiXRse
	 YCm0Zpt41nvyAL1E0dj78+JGNPGDDKaLwvO1wx7OiuzFAXOMgp2tTUFr7ZVJXRtlrQ
	 SXLdGBQ5n+sZwa/oY1SVkHLG1uQva4xrl+L1kJEefkBKTIRAGj6AJv0F8Oiv/1gwwR
	 ECmlPm/YSmwxZ5vAi+EwJu1y7rzA2n2fTfk284CRy1Y6gmodOFlYyWp9rfILonKA/b
	 h+WAumdj6GR/aSkQMfTI2VBxz6axza+E4RXOKSbX1Phq86CerinOt6ecgaGOw1t6EA
	 r4uzW8/JlM18o3O8Mi1+fG54Uv11Js2CJTxnkccZxmvHvsxuq1KAAnQ7CFL24sMUq3
	 Z8o1NqiS/SVGzqbQloE2mpjPyr97elJ1ribxEWRfz8D49Wo1DCNOPa9hshX5C3/4hD
	 83I+GnVPXn+wTMb7jSfDA1hcV7QEVOY8z8/PyDJeNnxsvHjldQTwhwa+w6krp2ADM5
	 SkoLiwixYJtwouY66Z9zcrJcnRnsjZV1wljeraReXTs5w+4E1YNg/fQhpX4QT+3vT/
	 +x+QDMIskHLlxx1r4p0tXOBA=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 2172140E0174;
	Sat, 21 Mar 2026 21:52:30 +0000 (UTC)
Date: Sat, 21 Mar 2026 22:52:24 +0100
From: Borislav Petkov <bp@alien8.de>
To: Nick Bowler <nbowler@draconx.ca>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	x86@kernel.org, linux-edac@vger.kernel.org,
	Yazen Ghannam <yazen.ghannam@amd.com>
Subject: Re: PROBLEM: boot hang on ASUS P2B-F (regression)
Message-ID: <20260321215224.GGab8TGH0c-kmPGUAB@fat_crate.local>
References: <mfc7rijyfrtdxj4k6pxqcar7jtqnt6kz77ubrr6iyj52cguesz@qj5uf3to7ukq>
 <20260321204321.GFab8C6aq2jIhIen_p@fat_crate.local>
 <fdhaj5pddf6cp7obvgrpzzxmxn46za4acyvhkvjtjy3ukofmok@hocikxl5b42x>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fdhaj5pddf6cp7obvgrpzzxmxn46za4acyvhkvjtjy3ukofmok@hocikxl5b42x>

On Sat, Mar 21, 2026 at 05:00:28PM -0400, Nick Bowler wrote:
> On Sat, Mar 21, 2026 at 09:43:21PM +0100, Borislav Petkov wrote:
> > Anyway, pls send .config, a dmesg from a successfully booting kernel and
> > /proc/cpuinfo.
> 
> config and dmesg attached (both gzipped) from the successful boot of
> 7.0-rc4 after partially reverting the culprit.

I can't reproduce in qemu here because I don't think anyone has your hardware
anymore. I'd throw it in the trash if I were you. :-P

Anyway, since you're partially reverting, can you pls try reverting the
Intel-relevant hunks and narrow it down, if possible.

From the looks of it, I'm thinking:

* comment out the intel_apply_cpu_quirks() call

* comment out this hunk

        /*
         * There are also broken BIOSes on some Pentium M and
         * earlier systems:
         */
        if (c->x86_vfm < INTEL_CORE_YONAH && mca_cfg.bootlog < 0)
                mca_cfg.bootlog = 0;

in intel_apply_global_quirks()

as those two should be relevant to your machine.

That might tell us where to look.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
