Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85E615539A
	for <regressions@lists.linux.dev>; Wed, 15 Oct 2025 07:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514453; cv=none; b=VrFa0S+mJFriEWQOAf73di0S1zftqMnQB37VuddsW60/lELujy3vg5x/kLHc9ISOhMgYlgQPWL//1y+p6OG6OS8XJTth4SZc3/UlHYO2v/8hwiL/fPZ8Uf63smEQ/yOm7ZgpTJ4WNjihLlZxp1rp/0vYs6DJNaf0JwUm+A3aAAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514453; c=relaxed/simple;
	bh=BFcu8s0gM/t04yJtiGiWOnH1/q0bVRLLL+KGjIkw9d0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QRINW6XssE2kKFCHhJMtL5Uy72GnbMwn7pOwFmBgWNL61wYAiZvnm86ofdI8LiQ4Wvyt+hs4Gz+T2tYH8UpH5gT/FSKg2swuexxUSEOFbiGakMc9Lbnt0eC5rM9lfb4MIGiGIB3CYPe/ykTn7lBt+FRvv4qNKFAZOap9RKYEMbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1e8GQtnF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lIFgKHxa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QOt7+Zog; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6ynI4f01; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1e8GQtnF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lIFgKHxa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QOt7+Zog";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6ynI4f01"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D2B9A1F443;
	Wed, 15 Oct 2025 07:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760514450; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cH1AeFDdza7aMp2izOb5qKvh0qBp+SJYeG5ecSEzYuY=;
	b=1e8GQtnFAdNWMWwLVLL7y6i/LZseHOo+vKHV3qNGUiW85lTRM4H2fw4CLnlIdKY6PP+WFw
	HH0VebxyPt5ZpIAyMJoK2/B3dUSpEumgbtPOxbqloDYpUmZCjvxfVN9XNja/tvJ6o/yC9F
	pt6R789K98fDnZmnx37hVYbjTKAXFyk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760514450;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cH1AeFDdza7aMp2izOb5qKvh0qBp+SJYeG5ecSEzYuY=;
	b=lIFgKHxahJWtdNkBX3trhezzaI8vKqnp+JUc74Vn+drJzU/HSCptDJCeH/9QVha2q+66qJ
	kaZ5mgcU9pGmjIAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760514449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cH1AeFDdza7aMp2izOb5qKvh0qBp+SJYeG5ecSEzYuY=;
	b=QOt7+ZogM50aaMix95QSIvatOemmwRTTPbsp4mF+bn0EfrRBxBvv7RF5R4WGQppe/cHRko
	gPl79mqxxDtuQqtowXAPLV+GmA+ddcIYuPhe01oXTJJQs2oGARgQXdbZ6U1ZKGmBScT8Oh
	cjyjK35aX1IaRjfnoVS5DOXKsgziygk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760514449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cH1AeFDdza7aMp2izOb5qKvh0qBp+SJYeG5ecSEzYuY=;
	b=6ynI4f012I9k+TlHuV9dybi3xjSLJYP+0aamf3+TwrKbryHMN2lm2ZBWulnSyjHwdt01NF
	u9cB+aFCol/OY8Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7161A13A42;
	Wed, 15 Oct 2025 07:47:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0a9zGpFR72jdSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Oct 2025 07:47:29 +0000
Date: Wed, 15 Oct 2025 09:47:29 +0200
Message-ID: <87wm4w61ym.wl-tiwai@suse.de>
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
In-Reply-To: <CAPnZJGDeJsD9CHAmF1XkHctMAuXTkE3egEgyh-WWjHo6ctoygQ@mail.gmail.com>
References: <20250709160434.1859-6-tiwai@suse.de>
	<20251014034156.4480-1-safinaskar@gmail.com>
	<875xci81dt.wl-tiwai@suse.de>
	<CAPnZJGDffiY-9sBTfdOYkkmjQqb79M3d8uLdyyb6eAxU8fqbuA@mail.gmail.com>
	<871pn47lw9.wl-tiwai@suse.de>
	<CAPnZJGDeJsD9CHAmF1XkHctMAuXTkE3egEgyh-WWjHo6ctoygQ@mail.gmail.com>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Wed, 15 Oct 2025 08:49:42 +0200,
Askar Safin wrote:
> 
> On Wed, Oct 15, 2025 at 8:51 AM Takashi Iwai <tiwai@suse.de> wrote:
> > You have to enable CONFIG_SND_HDA_CODEC_ALC* config, too.
> 
> I just did another experiment. I enabled everything in "audio hd" menu
> in v6.18-rc1.
> And still no sound.
> Kernel version is v6.18-rc1. Config is here:
> https://zerobin.net/?e345ae7df1223a43#h3Dm4HiKvM3GWbTl3f8ErMAS5cm8gd3MOM/IZP0Ta6w=
> 
> As you can see, all CONFIG_SND_HDA_CODEC_ALC* options are enabled there.

And have you unmuted all sounds properly?
Please give alsa-info.sh output (at best from both and non-working
cases).  Run the script with --no-upload and attach the outputs.


Takashi
