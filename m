Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE922D2499
	for <regressions@lists.linux.dev>; Wed, 15 Oct 2025 05:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760507500; cv=none; b=Xbd26TbgOCsrpKpYFiccFiN6hdfDjM6xSL1v5vxDYE2KBSlnGZ3K+Eno0j7wPLiQsK6VGfdI7YLunM0+0DFkHYjLx/3y0uci2J5P1V86rPr+qeni5DfLrNamCdIf4cW97kCCo57s08mMe7WJMjV5eSxRVt4RbkdLH6Kvo9zTQis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760507500; c=relaxed/simple;
	bh=50blR+Qkm8n4ka6Tnj/O7El8AHE/NCmRHeMSaOMsVOk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FxnaSbYGMjQ+Re0GEdKQnW6Z3KXKT42pZP1QJQEgkPoY7rB0ijatEMp7+MjrQUHItGhX/svidSvXtQw8HCVrQHwiRPsO3y9hXtWQojAEYG8OY5OLWIdmn0smbwXfAP7mUFzhyl2SNVaBIsuo0c3ZeM1D1GolPtuixpq0ppcxV6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wdEcYq63; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X2ziHNMh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f7F8xd2z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=76hzr1Tc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wdEcYq63";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X2ziHNMh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f7F8xd2z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="76hzr1Tc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A2F3E66DF5;
	Wed, 15 Oct 2025 05:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760507496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s1PwgFEMFdLefTq8lodQq36S37p8/4E+rvPyxh24ysA=;
	b=wdEcYq63OFOGJCBi2YELO0NLYvnC0NRQ9dlGagszYBAzAK9atj02avDMUWQ9W6lCAZQ4FD
	+XPCZMFxYJ1FUmf1OBMB/1N1BnpxoZ6+vgb0vRyE9q/reEvtwTvOVT1gWcFAJ4ExfB2Znf
	MOyLt7WuHnF3q4SzT1gACZApJhmsGXo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760507496;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s1PwgFEMFdLefTq8lodQq36S37p8/4E+rvPyxh24ysA=;
	b=X2ziHNMhqlArcmYM2a3BG/Fv0l+CbNbvyhib+V3P71NVape0J+igvcPdtUrx+UpA9qQAW6
	ChazQ/g7uyQeIFDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760507495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s1PwgFEMFdLefTq8lodQq36S37p8/4E+rvPyxh24ysA=;
	b=f7F8xd2zuyv2wzm55uezYNOF4ZSR0IjFJ72FkF01Wk4ir6ZwEF6yYCoC+PFF8HKLj9bby5
	SfhfAu/CHKU8WleLPmMmwbYSOY1w1flWUjheKGH3mBKPiLdmwcDgokRmBnL6s34Aq0X7ut
	L1eHDLYp6CiLoAH8enVT6WyWAqc9cVU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760507495;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s1PwgFEMFdLefTq8lodQq36S37p8/4E+rvPyxh24ysA=;
	b=76hzr1TcW/VhsG/wSyjHBRvofJgyrFipbF3Kdy7KUbuBr2UGCjV6GRVFfxoIPsq0nwDA1r
	Tcuh8Q6prM4ap/BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 477AC136F7;
	Wed, 15 Oct 2025 05:51:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id F5K5DGc272jeWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Oct 2025 05:51:35 +0000
Date: Wed, 15 Oct 2025 07:51:34 +0200
Message-ID: <871pn47lw9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Askar Safin <safinaskar@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
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
In-Reply-To: <CAPnZJGDffiY-9sBTfdOYkkmjQqb79M3d8uLdyyb6eAxU8fqbuA@mail.gmail.com>
References: <20250709160434.1859-6-tiwai@suse.de>
	<20251014034156.4480-1-safinaskar@gmail.com>
	<875xci81dt.wl-tiwai@suse.de>
	<CAPnZJGDffiY-9sBTfdOYkkmjQqb79M3d8uLdyyb6eAxU8fqbuA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.983];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Wed, 15 Oct 2025 06:37:13 +0200,
Askar Safin wrote:
> 
> On Tue, Oct 14, 2025 at 9:04 AM Takashi Iwai <tiwai@suse.de> wrote:
> > The oft-seen "regression" reports for 6.17 were rather the incorrect
> 
> My config indeed didn't have CONFIG_SND_HDA_CODEC_REALTEK.
> 
> I set it to "m" and did test again.
> And audio still doesn't work.

You have to enable CONFIG_SND_HDA_CODEC_ALC* config, too.
(I guess CONFIG_SND_HDA_CODEC_ALC269=m alone should suffice, but you
can set all to m.)

As already mentioned, those are the new config of each Realtek codec
driver that now became selectable individually when CONFIG_EXPERT=y
(so you say you're an expert :)


Takashi
