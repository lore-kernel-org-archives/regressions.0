Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C56230BF67
	for <regressions@lists.linux.dev>; Wed, 15 Oct 2025 15:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760543672; cv=none; b=BFbVkDBnQSLrFCBiWkYmslS74mvGjscbJVPj08QihFBCzGVkZvHJFYd6eeBN5iBvYnl97UG3UUBUpsc7jI6N7GXaQ2Olk/bmpEjUOqmvqe2PiARY0PJhV3buDxkBzaLdnoOsMpwJs9htJjftCXtEH8Dbn9TRgCL167dVl40Zs8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760543672; c=relaxed/simple;
	bh=syhOLU/Q5x8OX34zpl0y//xZVKf2oHNlmf8kHscSWzo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GkAX1wUxYZ0Duj+hxHS/DKr3tDRglyhmRxXNW7yK9pzN2E504W4F4ShN8ClUVXq/E1vyNyB79Tp+V12qF02C+fdWdzPVo/3N8AxAaGG3mUhEPgZnBzAvTegT/Ea01mL/SuSNZYAarV9cM4i16nfnZz0KvvH+MnEhHE8t84Jycv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1KQfw4TF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+nmlFaQb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1KQfw4TF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+nmlFaQb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1KQfw4TF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+nmlFaQb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1KQfw4TF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+nmlFaQb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C11FB210AD;
	Wed, 15 Oct 2025 15:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760543668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lrtegxpvso2Xm5O69BCeiMqneusZ2Un50/mB3pQuw5o=;
	b=1KQfw4TFwb81K+rqPFtE9biz2ogCP8qB3Bcyl7XDo1yz0o+8WBLjrB6G9GecpygVDocvFg
	EQRMv6C896Pi9qXsTh0+3tgcCu8cLo5vYN7wfPC/fp2b8xRyDYLGZWvnsRhAlpoUUOPhFj
	7SIee7mhCiXZ9a0JljlnbMkICPfPcxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760543668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lrtegxpvso2Xm5O69BCeiMqneusZ2Un50/mB3pQuw5o=;
	b=+nmlFaQbvtYk5uh05Qnb5b3Exs2znJdKYuMWC6LU4gYYaKSdwvx9v5JDeMcw8JCSfmBj4y
	mjWJhR2OwjBe7YBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760543668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lrtegxpvso2Xm5O69BCeiMqneusZ2Un50/mB3pQuw5o=;
	b=1KQfw4TFwb81K+rqPFtE9biz2ogCP8qB3Bcyl7XDo1yz0o+8WBLjrB6G9GecpygVDocvFg
	EQRMv6C896Pi9qXsTh0+3tgcCu8cLo5vYN7wfPC/fp2b8xRyDYLGZWvnsRhAlpoUUOPhFj
	7SIee7mhCiXZ9a0JljlnbMkICPfPcxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760543668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lrtegxpvso2Xm5O69BCeiMqneusZ2Un50/mB3pQuw5o=;
	b=+nmlFaQbvtYk5uh05Qnb5b3Exs2znJdKYuMWC6LU4gYYaKSdwvx9v5JDeMcw8JCSfmBj4y
	mjWJhR2OwjBe7YBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6016313A42;
	Wed, 15 Oct 2025 15:54:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yeHtFbTD72gGXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Oct 2025 15:54:28 +0000
Date: Wed, 15 Oct 2025 17:54:27 +0200
Message-ID: <875xcgkvnw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Askar Safin <safinaskar@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
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
In-Reply-To: <CAPnZJGDeCkqqUpEh0SBfwvsxfMp9ZDXqvhrC1s9zRp6jX+Fvnw@mail.gmail.com>
References: <87o6q8l68r.wl-tiwai@suse.de>
	<20251015145749.2572-1-safinaskar@gmail.com>
	<878qhckxc5.wl-tiwai@suse.de>
	<CAPnZJGDeCkqqUpEh0SBfwvsxfMp9ZDXqvhrC1s9zRp6jX+Fvnw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Wed, 15 Oct 2025 17:45:37 +0200,
Askar Safin wrote:
> 
> On Wed, Oct 15, 2025 at 6:18 PM Takashi Iwai <tiwai@suse.de> wrote:
> > Good to hear.  So a part of the problem was the incomplete kconfig
> 
> Another data point: Debian's experimental kernel (6.17.2-1~exp1) does contain
> culprit (2d9223d2d64c), yet it works.
> So, it seems that Debian's people somehow cope with this bug.
> 
> Also, when I take vanilla stable kernel 6.17.2 and apply to it Debian patches,
> listed in this file:
> https://salsa.debian.org/kernel-team/linux/-/blob/debian/6.17.2-1_exp1/debian/patches/series?ref_type=tags
> and build with Debian's config (with "localmodconfig"), then... the bug happens.

Did you boot (Debian's) 6.17.2 kernel, copy its config from
/proc/config.* to .config, then run "make localmodconfig"?
If the problem is seen with it, we'd have to take a deeper look.

Basically you can forget the bisection result.  You felt into a local
minimum during the bisection, and it doesn't point to the real issue.


Takashi
