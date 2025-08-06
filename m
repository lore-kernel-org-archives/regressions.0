Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3242921859A
	for <regressions@lists.linux.dev>; Wed,  6 Aug 2025 08:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754468419; cv=none; b=qKo3okJn05FIxvq90pOfnsSYFMffqeRXvnNwRz2Oe4E3WwpcbH10paqtxJQMvEZDsAyykjOLUuLlUsGBKP6Ik+vqSUx3hnaKMn5ezgAmLf8RkvalZEdYQGQEm3PIOLB38Calkw2gbQTcbfSgvWgG31NmpdABwHqnYbH2lpJcON8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754468419; c=relaxed/simple;
	bh=gYmPtoG/6WT8yVGkT1EK74tJTMhyErtjOkZXP8GoWWQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z5OO+xPyQVl5OJIs5ODN7KyAC7e4K+/DmcknFZEadJiodaq41ij+yxVrWGgIk1EzOb8qRW3odQTkvk5oNx9/jrEvllHC15oEPS9FQp5XnAVMy/4gp2TfckzgF6sGnX57AYypOf9JXYFtWm7q1ak+Uska9wyLpumcAmoWALnk3wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vhe4XR0u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8ShzoE9V; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vhe4XR0u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8ShzoE9V; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vhe4XR0u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8ShzoE9V";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vhe4XR0u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8ShzoE9V"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 51E7B1F8B8;
	Wed,  6 Aug 2025 08:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754468415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XJRaPObtDC/mA181W+SUwuBron/kLvm3kE/IfT7u/6I=;
	b=Vhe4XR0uYeJ1a8mqj2z4o/sBg2uiulxN9U3jL4RSJXsU3qoLu+34TUI9bQ8rjmMUY6MRb4
	AOcCfbVfiw6UFBe+ChR7cg/c9CW9+jNizQayyHwgUeM56BFuoIko4TgsXva8awW1V/1XKw
	I0cQgkJkPvINUEj5zS+PdSdhEylhWws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754468415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XJRaPObtDC/mA181W+SUwuBron/kLvm3kE/IfT7u/6I=;
	b=8ShzoE9V1nV5grwKuevk9U6odR8JU+1IkDOvk78lIZo2bPPKG7u9e7xltx2TWme8Xo7NX8
	gcizIpgif9iKZKDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754468415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XJRaPObtDC/mA181W+SUwuBron/kLvm3kE/IfT7u/6I=;
	b=Vhe4XR0uYeJ1a8mqj2z4o/sBg2uiulxN9U3jL4RSJXsU3qoLu+34TUI9bQ8rjmMUY6MRb4
	AOcCfbVfiw6UFBe+ChR7cg/c9CW9+jNizQayyHwgUeM56BFuoIko4TgsXva8awW1V/1XKw
	I0cQgkJkPvINUEj5zS+PdSdhEylhWws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754468415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XJRaPObtDC/mA181W+SUwuBron/kLvm3kE/IfT7u/6I=;
	b=8ShzoE9V1nV5grwKuevk9U6odR8JU+1IkDOvk78lIZo2bPPKG7u9e7xltx2TWme8Xo7NX8
	gcizIpgif9iKZKDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 284F013AB5;
	Wed,  6 Aug 2025 08:20:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WvapCD8Qk2jYCQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 Aug 2025 08:20:15 +0000
Date: Wed, 06 Aug 2025 10:20:14 +0200
Message-ID: <871pposvy9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Quiet crackling noise at boot and after stopping music
In-Reply-To: <10172c80-daec-4e20-ab57-a483cf1afc02@molgen.mpg.de>
References: <10172c80-daec-4e20-ab57-a483cf1afc02@molgen.mpg.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

On Wed, 06 Aug 2025 10:15:08 +0200,
Paul Menzel wrote:
> 
> Dear Linux folks,
> 
> 
> I believe the Realtek refactoring caused a regression on my Intel Kaby
> Lake laptop Dell XPS 13 9360. There is quiet crackling noise during
> boot, when GDM is started, and also after playing music is
> stopped. It¢s reproducible with 6.16.0-04055-g14bed9bc81ba, that
> contains the sound subsystem pull request.
> 
> 177bf8620cf4 Merge tag 'sound-6.17-rc1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
> 
> I uploaded the run of alsa-info [1]. I try to verify with plain 6.16 later.

It's likely because of the missing CONFIG_SND_HDA_CODEC_* selections.
Please set CONFIG_SND_HDA_CODEC_ALC269=m and
CONFIG_SND_HDA_CODEC_HDMI_INTEL=m if not done yet.

Those were already set to default=y in the later PR for avoiding such
a pitfall.


HTH,

Takashi

> 
> Kind regards,
> 
> Paul
> 
> 
> [1]: https://alsa-project.org/db/?f=6d2c66f2374b4ee6eb406a1d2cce60d1f17bed33
