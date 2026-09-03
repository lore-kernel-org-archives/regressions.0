Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF3B4AFE38
	for <regressions@lists.linux.dev>; Thu,  3 Sep 2026 13:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443787; cv=none; b=CpvRwvyhy039rACgkecafM1dM0TyKkWZ70IyXohBTwa9cZU+PNwilvgwUnqtutfQ/JBIJ9+SXH49ewlHtvyCtGCTYDfePkvoeEcqWjKD/wtnzmS4L3j9kHknv8XvZUD6PTcE4Elug31IJf1B46+RRD7z7AB4fJlKp4OGbI87Poc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443787; c=relaxed/simple;
	bh=cN4hOBp3DwOYD7cOK7T7dkOLdV11sSu+8QU0eB07yEg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=r37eV7RDJ0e4laqAo8Ja2UKwfSsTjX+rK5ytlPCbvOONRaP/lM5wCIZ/BsuwGLv5u45QjOQsvSDBsUheWhbwYxQ/paXWtLm+5wMW20BzO3rPCQ3nf2l/pevwc3V4RQ0jk1otyk+88pr7qYEYqv2TbuDLV/9M6vnN1U60CXsecyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=gDBMritW; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="gDBMritW"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hbLhM1MNrz6Lc9
	for <regressions@lists.linux.dev>; Thu,  3 Sep 2026 15:55:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1788443715;
	bh=cN4hOBp3DwOYD7cOK7T7dkOLdV11sSu+8QU0eB07yEg=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=gDBMritWkyxSKewgaDXQbQOcJZLhuppwnt5mI2bRKiwMxQ7rkUpiotYOjy4gwQB3F
	 K91VgaqEoKv+IirATy048tGq1rzxKMSDUtEc42GlHNhfqIAjIvJivkb3PwHLci9m6h
	 LuzUhLoS90pJcil4HBeoYJcDIQdEY5lfLbF2T2AnHbYN6W6CgfXhurm35U9US6IJrv
	 v5jEBpKmaQowl8DQ+WcUk16Xk1nDSb2YSrX97rJ1Ihso8GjVdOH/wUM1tammhsTeMx
	 BtHtL4BNhjUKJbi4dwiSXR4drBEC1rNgAGsZEeF43Qo4D/Fpol+vUekNF5a9GeskY6
	 XkBDQVozl7/qw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hbLhM0dtRz4xwP
	for <regressions@lists.linux.dev>; Thu,  3 Sep 2026 15:55:15 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hbLhL60XRz8svF
	for <regressions@lists.linux.dev>; Thu,  3 Sep 2026 15:55:14 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id C1C765FA14
	for <regressions@lists.linux.dev>; Thu,  3 Sep 2026 15:55:04 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <8c4e87de-be5b-4c80-8f4a-81527a926627@leemhuis.info>
Date: Thu, 3 Sep 2026 15:55:04 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178844370499.3981430.2692585249415974643@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: C1C765FA14
X-NC-CID: 1NqKSnv1YFlkQeRMU73fSXyoOoQ0iHF+fyW2/IczRGkb7I4KxWg=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5735
#regzbot monitor:
https://lore.kernel.org/linux-iommu/yq5ao6egyn5j.fsf@kernel.org/

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5740
#regzbot introduced: v7.2..v7.3-rc1
#regzbot title: drm: amdgpu: HP OmniBook X Flip OLED stays black until
VESA AUX luminance control is enabled

#regzbot report:
https://lore.kernel.org/lkml/20260817182302.146546-1-marex@nabladev.com/
#regzbot fix: usb: typec: mux: avoid duplicated mux switches

#regzbot report:
https://lore.kernel.org/all/20260903115135.63210-1-mikhail.v.gavrilov@gmail.com/
#regzbot introduced: c3a280ff728a
#regzbot title: debugfs: errors messages on every boot
#regzbot fix: debugfs: don't warn about uninitialized debugfs for an
error parent


#regzbot report:
https://lore.kernel.org/linux-wireless/20260816132325.23007-1-mikhail.v.gavrilov@gmail.com/
#regzbot introduced: 9417c5818a01
#regzbot title: wifi: mt76: mt7921: fails to probe
#regzbot dup:
https://lore.kernel.org/all/20260901011840.416787-1-junjie.cao@intel.com/
#regzbot fix: wifi: mt76: mt7921: skip unknown CLC firmware records
#regzbot monitor:
https://lore.kernel.org/linux-wireless/20260816174841.1918-1-acharyalaxman8848@gmail.com/

#regzbot report:
https://lore.kernel.org/lkml/20260810-serial-v1-1-abbe51602c13@debian.org/
#regzbot dup:
https://lore.kernel.org/lkml/20260828153706.GR687043@noisy.programming.kicks-ass.net/

