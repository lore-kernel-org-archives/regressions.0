Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4F34C8FF0
	for <regressions@lists.linux.dev>; Wed, 30 Sep 2026 12:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771397; cv=none; b=nFxh9MX+WtUaUthwwTzNHylijOQx+4uSsb16b1E5VXuJ749XkoykNm4boQZ0/85hoIwp4mJCgEPMxTZ5+H6r1wu0rGZikb3VDSJj54zzvE/QMIakjAGF3n21oQvbmG6JtcUxg2Tr2SA+6fC3aOs5GqVGHHhZRVRqP6t3ZKmL1us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771397; c=relaxed/simple;
	bh=bHED2PalCqWqy+ej+XzZ/mrvSZuXl3/01whc4XeqaA0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=arKCBhJC9hqal7HFqBZhIaDLNQWbUBDe87XvoBaT2SLJ1hthQWQJXJP6B5Oiv3jtFRVLHtYYnyYP4U435d/3+RUNMv05jS/sEoBsnnTwM7c0EWPNgR2T3xUn6SZuuf+5gDbEbSb5QcRNEhbdYGqUuTAeRSaSahy3Wt6Iyj7MzYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wxrU+Juq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hPet5eMN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ta+zdnB+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oijDvPnv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wxrU+Juq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hPet5eMN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ta+zdnB+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oijDvPnv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A475A21A95;
	Wed, 30 Sep 2026 12:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790771388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dVgNp1NNSNJOQL5dXm2cx/tsAEGEMCocD6Vj6jjfI/I=;
	b=wxrU+JuqvMrj+keQ7ZqDNuabDGjLSBaqH30yA5fGGhxplu08vuNoFUzoFCE1vuhYZMPDo+
	lbkunEWGvAh5RLACaK0xbuuoEPYR51RuQGXGbpLyKZi7tPqOgKR4ukEYFxwNy3U/ledPoG
	tpklEaOFP3nOtLodkIKo9LXy6exn3EI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790771388;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dVgNp1NNSNJOQL5dXm2cx/tsAEGEMCocD6Vj6jjfI/I=;
	b=hPet5eMNKQjiOPSKx+o3TLR0TIUA1zn+B1jAdiSzNE7DPQ29u6prfNzyQ1aWAyLxyKa7h2
	44b2UYvkiS6MuYBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ta+zdnB+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oijDvPnv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790771384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dVgNp1NNSNJOQL5dXm2cx/tsAEGEMCocD6Vj6jjfI/I=;
	b=Ta+zdnB+T5bbhW2n0PE4b9YbbI29yJmoXvrHzfjBBTwownwhbUcVsVWo2cAYw8lbeJtQw8
	ibbuy1U0ddsPTuydj04D//+1V5wXhqVUxCCfFZZOrZhKQ+3fhwuBYCOYbtjMYn8BsElxmZ
	w+7kofAw62TNkg1385TKYnt4VuJKPyg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790771384;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dVgNp1NNSNJOQL5dXm2cx/tsAEGEMCocD6Vj6jjfI/I=;
	b=oijDvPnvKfZHYmhkScRV4J8ZImFFK+Ob+664i0t8zHJZXbCfERg3KgpZlPOwfo2o/2Xtnx
	G7GO+L3C7qAeqtBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 50911136AD;
	Wed, 30 Sep 2026 12:29:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id diY3CrgAvWpEdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 30 Sep 2026 12:29:44 +0000
Date: Wed, 30 Sep 2026 14:29:43 +0200
Message-ID: <87zewy53d4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Harin Lee <me@harin.net>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dany Patoine <dany_patoine@hotmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] ALSA: ctxfi: Fix silent playback on Titanium HD (SB1270)
In-Reply-To: <20260930115824.739412-1-me@harin.net>
References: <20260930115824.739412-1-me@harin.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A475A21A95
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[hotmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,hotmail.com,vger.kernel.org,lists.linux.dev];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,harin.net:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Wed, 30 Sep 2026 13:58:24 +0200,
Harin Lee wrote:
> 
> Commit 4b490e0d103c ("ALSA: ctxfi: Add ADC helper functions for GPIO")
> moved the GPIO_DATA read into hw_adc_stop(), but the Titanium HD
> (SB1270) setup in hw_adc_init() uses the local data variable holding
> the GPIO_CTRL value.
> 
> Writing this value to GPIO_DATA sets the output mute bits. Playback
> runs without errors, but the outputs stay muted.
> 
> Re-read GPIO_DATA before setting the speed mode bits. Also, add the
> delay after writing the mode bits, as in the original sequence.
> 
> On affected kernels, switching the output selection was reported to
> restore clean playback.
> 
> Fixes: 4b490e0d103c ("ALSA: ctxfi: Add ADC helper functions for GPIO")
> Cc: stable@vger.kernel.org
> Reported-by: Dany Patoine <dany_patoine@hotmail.com>
> Closes: https://lore.kernel.org/linux-sound/DM6PR02MB5433A42E81FEFAC400DD1905EA8B2@DM6PR02MB5433.namprd02.prod.outlook.com/
> Signed-off-by: Harin Lee <me@harin.net>

Applied now.  Thanks.


Takashi
