Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939693D955E
	for <regressions@lists.linux.dev>; Thu,  6 Aug 2026 06:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785997633; cv=none; b=XHBtPaW5j70uWxLa6oPk0JEzGzmpmUEluBg9fzQ5w5he/ZbicnmYH5+xr/TY9DSg2hgrjS7zTq7Ja8eyKMeFzJwNDYcZMfJv1EajCVvLqVs0yk1lZgZbz9Id3BvlDy+W/B30DSkVfZ2Zu/u+fgn3QmlRNNgBqHye+26huBC5KnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785997633; c=relaxed/simple;
	bh=Z07s5Fvek1lANAYhhMJ02H3FXOcEJNvwUI8O7pbLEAk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KtkZIEmhkselO+c8fOPbur+E7VhUsdshTyBW93tw7cHT9p7tuR/S2RMZC40bdBSR0FEXiSHeJ0oktkizBCZW6pIvKK2MFDFpyMFGM3D5oONftYrbEKbK0IcQRrqI2uCpO+YFBv/d3eygdmtjTwyJLgMMkPLLjHxUjY2pUPaQbSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xehOGyRd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xBOPL4T3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rd7cqa9R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sXsjvaif; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xehOGyRd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xBOPL4T3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rd7cqa9R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sXsjvaif"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 878423E00;
	Thu,  6 Aug 2026 06:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785997625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qzvIaGIG0ZCOVJ+rGspt5Yv07q5N+afSu4efUQUVTbY=;
	b=xehOGyRd8Q+TvmNhZMxMTf2x7zl/h4uGREVNjKVlgo8Lip9x3ZxYR2j3X7aTfjrk8M3q4G
	v3y204Uxce9RjWaOsQZpn4E9mHBCcO7qXo136gYOKsmgPuCFdeWz/cAGSEogf85c0KKNbu
	uLdpBo+lGrX4q4Dt2wFfr3LL1J6FSg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785997625;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qzvIaGIG0ZCOVJ+rGspt5Yv07q5N+afSu4efUQUVTbY=;
	b=xBOPL4T3BWrcVvMftD2aFF3HhUVD/ojjREjEdEnn2i3t1qpQnmMJ+j3r3gAL7uaXm+SsfW
	oecTKeAmG5XAI6DQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rd7cqa9R;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sXsjvaif
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785997621; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qzvIaGIG0ZCOVJ+rGspt5Yv07q5N+afSu4efUQUVTbY=;
	b=rd7cqa9R7H+xjIEnM4pvBeg+A5012US5lPuIYNDK0pGSLTewbaxb9zeFJ17XxhZdRN2WTm
	J+gKwsDK6HTsmbyuojiH4S4GjoKc2qWQlo2uGRe1JbCwFVj17nfn+FH4i+pK6KVKGBRdD+
	S7FzN374YCGwYLGFPBUZy0fyEkZ5qe8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785997621;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qzvIaGIG0ZCOVJ+rGspt5Yv07q5N+afSu4efUQUVTbY=;
	b=sXsjvaifGx0yE+e6gG3mfJ3f1L6CWwI+OdtXWFqHGRC8qVqcauWGpa5V9y3odl9GUQryLl
	wSmazqzwXkBHjMAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 63D5C779C5;
	Thu,  6 Aug 2026 06:27:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id USKdFjUpdGqFcwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 06:27:01 +0000
Date: Thu, 06 Aug 2026 08:27:00 +0200
Message-ID: <871pcbg3wr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gert Burger <gertburger@gmail.com>
Cc: linux-sound@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] snd-usb-audio: SteelSeries Arctis Nova 5 mixer controls disabled as sticky
In-Reply-To: <CAEQ1D3kdA3mkQx7ei9Kq0gwky0qroJqCLKrkvgfkqgTbeu086A@mail.gmail.com>
References: <CAEQ1D3kdA3mkQx7ei9Kq0gwky0qroJqCLKrkvgfkqgTbeu086A@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 878423E00
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Wed, 05 Aug 2026 17:41:27 +0200,
Gert Burger wrote:
> 
> 
> On archlinux, after I upgraded to kernel 7.1.5-arch1-2, the sound volume is
> significantly lower and seems to lack bass.
> 
> Reported by someone else here: 
> https://bbs.archlinux.org/viewtopic.php?id=314220
> 
> Previous kernel was 7.0.14.arch1-1 (working)
> 
> Attached is also-info.sh for 7.1.5-arch1-2 (broken) and 6.18.41-1-lts (as a
> workaround I installed an lts kernel, works)
> 
> Device:
> Bus 005 Device 003: ID 1038:2232 SteelSeries ApS SteelSeries Arctis Nova 5
> 
> Dmesg diff:
> Aug 05 16:22:19 framework kernel: usb 5-1.1: 9:0: sticky mixer values (-19712/
> 0/256 => 0), disabling
> Aug 05 16:22:19 framework kernel: usb 5-1.1: 10:0: sticky mixer values (-21248
> /0/256 => 0), disabling
> 
> Can I need to provide anything else?

Could you try 7.2 kernel?  I guess it's still broken, but then try to
pass the option "quirk_flags=1038:2232:mixer_get_cur_broken" to
snd-usb-audio module and retest?


thanks,

Takashi
