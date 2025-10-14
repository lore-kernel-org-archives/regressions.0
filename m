Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9854830DD29
	for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 06:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760421892; cv=none; b=u9e++5kRAdGLha3oKIpu/s7T6aIYOb6w3HoLUcX1WtYK4iTjn9qm9wW0gfa7y3p+Xs7OvhdvKhNid9iayFesCKCHAJTUEhYKsGqI+5aTTkfAPAcEOU2Pqf1BFW1GI/NFUtZwJp+GkFLUv9Z6aIHJi1s4E6zebkGFO8cWqcJr87g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760421892; c=relaxed/simple;
	bh=Wt4pD5gcVyt54cySAgvxNCFQKUhVqKF+IeF69tqaBKk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JZCUqMVSacD2zIItUs8UzsNaFgor57JnzuCCqWFN8wCrNeUiDY5WTXznOLghnyDPrGc+qzvh3IY9baDbgfiIr06wQTOplN3YIIZPMi4i59f7qCXX1tCjcwceEF8t5P2urPuYXYR73snOYIbMsecGn0FBve8CZNvQvebEUD12er8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rKOuvqYb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WKHnFwml; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rKOuvqYb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WKHnFwml; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rKOuvqYb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WKHnFwml";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rKOuvqYb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WKHnFwml"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AC6721F750;
	Tue, 14 Oct 2025 06:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760421887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+nTiAhEtLhakZDaSGJLkjbBvw4HLsVtJBfeeNxtqUIo=;
	b=rKOuvqYbY+2vWHxWOSIiJrWEWvsgO0iJMF3/RUpF0xaVQwQTtJC/4Ng+gDIGNeh+tAHUjv
	f8whXn/lDYKOwoTIqAfmv6rpW5ZAfXrSqu0jSF3KyNbh01w/RPxEMZiQiWospoOhFx1Py3
	Za3QieBw52k6lZ0yTX/LKwyoTVUlpts=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760421887;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+nTiAhEtLhakZDaSGJLkjbBvw4HLsVtJBfeeNxtqUIo=;
	b=WKHnFwmlP5GUejtjiuIskooDQ6MrwUsJe7EZSlXjubNge5Hv+xrns2NLZgIwbWNpLody/N
	6h4ipappDFieuIAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rKOuvqYb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WKHnFwml
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760421887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+nTiAhEtLhakZDaSGJLkjbBvw4HLsVtJBfeeNxtqUIo=;
	b=rKOuvqYbY+2vWHxWOSIiJrWEWvsgO0iJMF3/RUpF0xaVQwQTtJC/4Ng+gDIGNeh+tAHUjv
	f8whXn/lDYKOwoTIqAfmv6rpW5ZAfXrSqu0jSF3KyNbh01w/RPxEMZiQiWospoOhFx1Py3
	Za3QieBw52k6lZ0yTX/LKwyoTVUlpts=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760421887;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+nTiAhEtLhakZDaSGJLkjbBvw4HLsVtJBfeeNxtqUIo=;
	b=WKHnFwmlP5GUejtjiuIskooDQ6MrwUsJe7EZSlXjubNge5Hv+xrns2NLZgIwbWNpLody/N
	6h4ipappDFieuIAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3645113A44;
	Tue, 14 Oct 2025 06:04:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jUbHC//n7WiHBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Oct 2025 06:04:47 +0000
Date: Tue, 14 Oct 2025 08:04:46 +0200
Message-ID: <875xci81dt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Askar Safin <safinaskar@gmail.com>
Cc: tiwai@suse.de,
	amadeuszx.slawinski@linux.intel.com,
	baojun.xu@ti.com,
	bo.liu@senarytech.com,
	cezary.rojewski@intel.com,
	kai.vehmanen@linux.intel.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	rf@opensource.cirrus.com,
	regressions@lists.linux.dev,
	Dell.Client.Kernel@dell.com
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA: hda: Move controller drivers into sound/hda/controllers directory)
In-Reply-To: <20251014034156.4480-1-safinaskar@gmail.com>
References: <20250709160434.1859-6-tiwai@suse.de>
	<20251014034156.4480-1-safinaskar@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: AC6721F750
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Tue, 14 Oct 2025 05:41:56 +0200,
Askar Safin wrote:
> 
> Takashi Iwai <tiwai@suse.de>:
> > Now HD-audio controller drivers are moved into sound/hda/controllers
> > directory as a part of HD-audio code reorganization.  Most of drivers
> > are independent from PCI bus, hence it makes more sense to put under
> > sound/hda.
> > 
> > The hda_ prefix is dropped from most of files at moving, as it's
> > more or less superfluous.
> > 
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> 
> This patch broke my laptop's speakers.
> 
> My laptop is Dell Precision 7780.
> 
> Here is output of "sudo lspci -vvvvv":
> https://zerobin.net/?bb0d52d5c33a1ca8#Z4cktfC0ofZhkzBU4/AFGpYAVJFXrus46nDeLQOV22s=
> (This output was collected on Linux 6.12.43+deb13-amd64, audio works there.)
> 
> My OS is Debian Trixie.
> 
> If you need my config, then here is my config I tested with linux-next:
> https://zerobin.net/?989789b5698e0afe#DKjA80yFwRFnLkYwo3ZnNZEVGowGyn5N78aSy8omoGY=
> It was tested with current linux-next:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tag/?h=next-20251013
> (and audio didn't work).
> 
> #regzbot introduced: 2d9223d2d64cb5216859ced6cc33fb3b04e5f98f

The oft-seen "regression" reports for 6.17 were rather the incorrect
kconfig setup, and that's your case, too, I suppose.  In 6.17,
HD-audio Realtek (and other) codec drivers were split, and each of
them can be enable/disabled individually when CONFIG_EXPERT is set,
where people often leave them off blindly.

So, please check your kernel config between working and non-working
cases.  I guess you had CONFIG_SND_HDA_CODEC_REALTEK beforehand, and
now it's off.


thanks,

Takashi
