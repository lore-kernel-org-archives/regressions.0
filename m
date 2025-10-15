Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AF51F1537
	for <regressions@lists.linux.dev>; Wed, 15 Oct 2025 15:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760541502; cv=none; b=ZrK+/rVEOZHWLeiDxansduGhLFsrIxfeSFVtYKooEBdRL040/0PyFZr4EwUp4e4QeQ4KAPfIi9aBjE5koHgJVDyMRW//l/G6d/L/yGRfco9L+WMZSSBQr9hMk1eBIyc1eP/aboWj9DcSZanScXs1TUuvyY5r1OSgZePOyyfd/20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760541502; c=relaxed/simple;
	bh=ailvDsHM+R7NVeb9i7rp0XZ+WIKsuwCvSqE2OdAxsvs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a6ZY4bdqenCtSdLBaHhRaOjghpHPZKy0gbNbd+7N7/mOBaDDZhOMP7yXth1ARJ1r14Oj94zbo/04PP8tg6ihDAOjPjBEgxVJllUNN/hOqbTpF+vHlQrUF4v0GZZ+IoRUfznpzfNhkSL0WA9VOaZDUUbjsO1LPDAMW0yTDJ54tAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2HfVKUJh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XgEHxMMj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TGo1m6QW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=J0n+P22x; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2HfVKUJh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XgEHxMMj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TGo1m6QW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J0n+P22x"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E6B9D21079;
	Wed, 15 Oct 2025 15:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760541499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aicJgtEFiI5176U+3eIShWmoSAsTOuO8Pe/cJ9mg3E4=;
	b=2HfVKUJht7B03w5za9fyNp1laMpmcdgcN71syolL7bEkWlXDegbvjx5odg3g/qoGpECFxs
	u5EAfN8Ivjsuao/Z+PKHwvvzB0QtM6oesRurdMsykuD51ytfQhuGdpEC5Yn4EXZfFgCSf1
	0yEP3cHXiK9sp1Zl+eVtBrL5Grwr7/c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760541499;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aicJgtEFiI5176U+3eIShWmoSAsTOuO8Pe/cJ9mg3E4=;
	b=XgEHxMMjOiB85gNJ4MbDntJzj7KSZ0IR7zLmahorCklCdsq+dUkbkMKRiUCF5d3Jbhv754
	C0oJrt3yHKXnYzDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TGo1m6QW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=J0n+P22x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760541498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aicJgtEFiI5176U+3eIShWmoSAsTOuO8Pe/cJ9mg3E4=;
	b=TGo1m6QWHtXUtkSetw13kTI03G0nGnytv5ST4Wr0wJHFZFsfwT87ap0nP7DbsW5kOCn/xm
	2/6LDymjANUMvH7mCSdYyH7MYswduSJK+dkvwsv1bk9JT1+y6VSn5Yd26x5NFVqMzhhm83
	QP70bIOQbhRyjUPTUWi/tmct8UtgicM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760541498;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aicJgtEFiI5176U+3eIShWmoSAsTOuO8Pe/cJ9mg3E4=;
	b=J0n+P22x1NAnh9P6wvtxWy5EUoc39BehDOkNFAiqO3Wlt8F3RFCv9fwstmBvhqV0GoBr+h
	XHjEMAeGCJhr70Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C09313A29;
	Wed, 15 Oct 2025 15:18:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P77eIDq772ibOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Oct 2025 15:18:18 +0000
Date: Wed, 15 Oct 2025 17:18:18 +0200
Message-ID: <878qhckxc5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Askar Safin <safinaskar@gmail.com>
Cc: tiwai@suse.de,
	Dell.Client.Kernel@dell.com,
	amadeuszx.slawinski@linux.intel.com,
	baojun.xu@ti.com,
	bo.liu@senarytech.com,
	cezary.rojewski@intel.com,
	kai.vehmanen@linux.intel.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	regressions@lists.linux.dev,
	rf@opensource.cirrus.com
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA: hda: Move controller drivers into sound/hda/controllers directory)
In-Reply-To: <20251015145749.2572-1-safinaskar@gmail.com>
References: <87o6q8l68r.wl-tiwai@suse.de>
	<20251015145749.2572-1-safinaskar@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: E6B9D21079
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Wed, 15 Oct 2025 16:57:49 +0200,
Askar Safin wrote:
> 
> Takashi Iwai <tiwai@suse.de>:
> > If that's the case, try to choose HDA-Intel driver by passing
> > snd_intel_dspcfg.dsp_driver=1 boot option.  Or disabling
> > CONFIG_SND_SOC_INTEL_AVS could help, too.
> 
> Passing snd_intel_dspcfg.dsp_driver=1 indeed helped me.

Good to hear.  So a part of the problem was the incomplete kconfig
setup.  It worked casually because HDA-Intel was probed first in the
first, although basically SOF Alderlake driver should support it.
Since your config disabled SOF Alderlake, the HDA-Intel was probed as
a fallback.  Now, by some subtle change, a different driver (AVS) gets
probed, and it failed.

I believe we should drop the Alderlake entries from AVS probe table
unless the firmware becomes available publicly.  (FWIW, this case was
RPL_S).

Cezary, Amadeusz, what do you think?


Takashi
