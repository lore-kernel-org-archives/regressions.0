Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9D5425862
	for <regressions@lists.linux.dev>; Mon, 14 Sep 2026 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378813; cv=none; b=P2xeR9rUG/2H0l9atMqATpnjJo297QUk5uw6St3KAwbIcOTm5u65r8TUY/OYmJV8eGJylG12pyT1JEerLL7zBiqJpf+/oATjJMYXc3fd1iUayhErAf2nBl7pO8q7ehorgX04CdWA4DHbS1/AysSsrX7Ykv2X5sgsbXxCxFee4Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378813; c=relaxed/simple;
	bh=H0p8adMv84wDCEuj/TtGwUv0y7JJBPKGHYfwhh4I7vk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fLf+6wcJQAeEyaCUBYJx2EnExrZv//mVgGOGP68KJ4Vqxv5tGm+ewJNq2ow4ewb5cjGlwyJTc8n59N08C2MgdBB4Kcc5kCfLSjzJyR5zTNmL9+GmfW/U4Vs5yELNM05LxTtc0kwaz8HlCMZgAM6q1itCb+sURwTODG/BiuQCv20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hhWLSwtE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eq0fPh0e; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hpsG6e1T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CGPvTSpA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hhWLSwtE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eq0fPh0e";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hpsG6e1T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CGPvTSpA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7DB2921DB5;
	Mon, 14 Sep 2026 09:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789378804; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JNTFN7XjTiAPgVhVB7Jb9llocJp4gJ9YzeAYL5KFIhE=;
	b=hhWLSwtE0F0Jw47TmVh0hV4ONKMVKoyLD8y4mJaCvcvuU8xaIYnGUvFva6HxrYvb78ZVEp
	QFK88dn/hUKzbZHKl223AIic6hO2oYy5W4rG5NAGjHwjrMRg1wIUwBzMU1ARcasFx8VQ0x
	Hf3gmTW+jEhWUqSwVoQTbVUJrbYCCKk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789378804;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JNTFN7XjTiAPgVhVB7Jb9llocJp4gJ9YzeAYL5KFIhE=;
	b=eq0fPh0eE3GS6U6tLjiAKQ8ElyxkYhsQJl4BXMVVCpS3zypZc124Q05udanmCG4gIyS3pr
	sGEsVn6DVyfXItDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789378800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JNTFN7XjTiAPgVhVB7Jb9llocJp4gJ9YzeAYL5KFIhE=;
	b=hpsG6e1T+lwLl1DyOP9abNZbtQGBHfgTJy9HzbIjNhEMvtjjQnYMT4QfgmXnnmYR+g7K6L
	NnT6ETBoQSXFGaA/8/NwvVmdoY3iMIe/QAnsV0CRmg/QnnX2EYL5VNrCDl+XlSMNrlRsJl
	bt8qqu2HLlh7Yim9PS8obgGB2vQLZ7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789378800;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JNTFN7XjTiAPgVhVB7Jb9llocJp4gJ9YzeAYL5KFIhE=;
	b=CGPvTSpA+ORFJXpEN180mc5Ppjd9Ea45tFVxFrhKVlVqbCDXcjER1JEn20ZbkyEfQ5Zqg4
	T1fZBs9mXGq7bBDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 048A21368C;
	Mon, 14 Sep 2026 09:39:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2kxiO+/Ap2opZQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Sep 2026 09:39:59 +0000
Date: Mon, 14 Sep 2026 11:39:59 +0200
Message-ID: <877bkop3ww.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Daniel J Blueman <daniel@quora.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Chris Lew <christopher.lew@oss.qualcomm.com>,
	Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] net: qrtr: resend HELLO on MHI resume
In-Reply-To: <260eee02-29d3-478f-9a39-d67adfefe862@leemhuis.info>
References: <20260909055846.16539-1-daniel@quora.org>
	<260eee02-29d3-478f-9a39-d67adfefe862@leemhuis.info>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO

On Mon, 14 Sep 2026 11:04:25 +0200,
Thorsten Leemhuis wrote:
> 
> On 9/9/26 07:58, Daniel J Blueman wrote:
> > Since the MHI HELLO exchange was relocated, it is sent only at device
> > registration. During a suspend-resume cycle, the firmware in WiFi
> > cards such as WCN7850 indefinitely waits for another HELLO,
> > triggering:
> > 
> >   ath12k_wifi7_pci 0004:01:00.0: timeout while waiting for restart complete
> >   ath12k_wifi7_pci 0004:01:00.0: failed to resume core: -110
> > 
> > Fix this by triggering the handshake from resume_early in the MHI
> > transport.
> > 
> > Validated on Qualcomm X1E-801800 on Lenovo Slim 7x across 10
> > suspend-resume cycles.
> 
> For the record: Takashi ran into this regression as well and provided a
> different fix, but withdrew it after I pointed out this fix, which
> worked for Takashi. For details see:
> https://lore.kernel.org/all/87mrtkpd2q.wl-tiwai@suse.de/

Yep, feel free to take my tested-by tag, too:

Tested-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
