Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2AD326D49
	for <regressions@lists.linux.dev>; Wed, 15 Oct 2025 12:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760529961; cv=none; b=i2bNV1iD0mkQW4VwD184SLLOeRET2NXE42uuEPLbH6+seQwkAONe3p4ygsdxnvtwg9eEKyWBrMUvIv1iGCNu0BjGOlY/swrsGrIqyCS8ALKorBAxwOYnw35Bjg549fKl07gZJy3Tl/O4rxoIcw+V0ULXpEJcffaU6f4PynIQ4QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760529961; c=relaxed/simple;
	bh=BZZptePd/BrMEAUpneCEbTZmxj9Ag73oYo9lDHY5ZaM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ArAzX3sTkVGgSfcrStjKVwPE28vHmgY1cSsSSef2880FOHu1ghmXmPGf7tm/beR0kL1cJaL1mrc7QsxgkYn5wnkepl/xgFwbxoFWQmGQpGxBPobVHLGZvZY1hp41g38XPDsukIK8Qtai70wrEak3+3LDnvvfvGjsuU6TpE4Er7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Irn1nWC8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zg7PRnq+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Irn1nWC8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zg7PRnq+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Irn1nWC8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zg7PRnq+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Irn1nWC8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zg7PRnq+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6F55921036;
	Wed, 15 Oct 2025 12:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760529957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3J82ZSBAcQlVeeRi+KB2ig+VBEvCIUvEjuMc7aHXXlU=;
	b=Irn1nWC8GoFQEnPzHac3NE9WsnIweG4lY6RuTSCf/IVGLzIeDXVTAMiB2tltjlJgmB2YYW
	o1QVjAab99Mcxa8kA5dZIulKaZM7eljJ++7sO4jM6MqfiXwL0HHpHy6OU1ouw3PyVRqXJx
	gpdHrW9kjvnX+KZECPwnniBXgT6QeKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760529957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3J82ZSBAcQlVeeRi+KB2ig+VBEvCIUvEjuMc7aHXXlU=;
	b=zg7PRnq+CG6pntBT/+1V7yHqvnPqPblOgHVf7uI7MvtfBdIUHLuA9EcqOc4wmIpIzcK8wV
	9nQxgSJX7eztJvCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760529957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3J82ZSBAcQlVeeRi+KB2ig+VBEvCIUvEjuMc7aHXXlU=;
	b=Irn1nWC8GoFQEnPzHac3NE9WsnIweG4lY6RuTSCf/IVGLzIeDXVTAMiB2tltjlJgmB2YYW
	o1QVjAab99Mcxa8kA5dZIulKaZM7eljJ++7sO4jM6MqfiXwL0HHpHy6OU1ouw3PyVRqXJx
	gpdHrW9kjvnX+KZECPwnniBXgT6QeKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760529957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3J82ZSBAcQlVeeRi+KB2ig+VBEvCIUvEjuMc7aHXXlU=;
	b=zg7PRnq+CG6pntBT/+1V7yHqvnPqPblOgHVf7uI7MvtfBdIUHLuA9EcqOc4wmIpIzcK8wV
	9nQxgSJX7eztJvCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1BEE713A42;
	Wed, 15 Oct 2025 12:05:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Jz6QBSWO72ihdgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Oct 2025 12:05:57 +0000
Date: Wed, 15 Oct 2025 14:05:56 +0200
Message-ID: <87o6q8l68r.wl-tiwai@suse.de>
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
In-Reply-To: <CAPnZJGAFobRVrzt1EH1P25s6LiZdWfoM08WoVoDk+vvsh3RqEw@mail.gmail.com>
References: <20250709160434.1859-6-tiwai@suse.de>
	<20251014034156.4480-1-safinaskar@gmail.com>
	<875xci81dt.wl-tiwai@suse.de>
	<CAPnZJGDffiY-9sBTfdOYkkmjQqb79M3d8uLdyyb6eAxU8fqbuA@mail.gmail.com>
	<871pn47lw9.wl-tiwai@suse.de>
	<CAPnZJGDeJsD9CHAmF1XkHctMAuXTkE3egEgyh-WWjHo6ctoygQ@mail.gmail.com>
	<87wm4w61ym.wl-tiwai@suse.de>
	<CAPnZJGAFobRVrzt1EH1P25s6LiZdWfoM08WoVoDk+vvsh3RqEw@mail.gmail.com>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Wed, 15 Oct 2025 13:44:21 +0200,
Askar Safin wrote:
> 
> On Wed, Oct 15, 2025 at 10:47 AM Takashi Iwai <tiwai@suse.de> wrote:
> > And have you unmuted all sounds properly?
> 
> KDE volume widget shows that I have no audio devices.
> So I cannot unmute anything.
> 
> > Please give alsa-info.sh output (at best from both and non-working
> > cases).  Run the script with --no-upload and attach the outputs.
> 
> Okay. First is pre-culprit kernel, i. e.
> 146355ee880e6d15ba12e2baf5be70e5efe07796, i. e.
> patch #4 in this patchset ("ALSA: hda: Move
> CONFIG_SND_HDA_PREALLOC_SIZE into sound/hda/common").
> Config is attachment "config-6.16.0-rc4-preculp".
> "alsa-info" output is attachment "alsa-preculp".
> 
> Then culprit kernel, i. e. 2d9223d2d64cb5216859ced6cc33fb3b04e5f98f, i. e.
> patch #5 in this patchset ("ALSA: hda: Move controller drivers into
> sound/hda/controllers directory").
> Config is attachment "config-6.16.0-rc4-culp".
> "alsa-info" output is attachment "alsa-culp".
> 
> These two configs are same, they differ in order of parameters only.

The dmesg snippet in the new kernel shows:

[    3.990348] snd_soc_avs 0000:00:1f.3: enabling device (0000 -> 0002)
[    3.990686] snd_soc_avs 0000:00:1f.3: bound 0000:00:02.0 (ops intel_audio_component_bind_ops [i915])
[    4.029315] snd_soc_avs 0000:00:1f.3: Direct firmware load for intel/avs/adl/dsp_basefw.bin failed with error -2
[    4.029319] snd_soc_avs 0000:00:1f.3: request firmware failed: -2
[    4.029346] snd_soc_avs 0000:00:1f.3: firmware boot failed: -2

... which implies that another new driver (ASoC AVS) takes over the
device instead of the previous HDA-Intel, and its probe failed due to
the lack of the firmware.  It seems that Intel didn't release the
firmware for avs with ADL platform.

If that's the case, try to choose HDA-Intel driver by passing
snd_intel_dspcfg.dsp_driver=1 boot option.  Or disabling
CONFIG_SND_SOC_INTEL_AVS could help, too.

BTW, you also miss HDMI/DP audio.
Set CONFIG_SND_HDA_CODEC_HDMI=m and CONFIG_SND_HDA_CODEC_HDMI_INTEL=m
in addition.


Takashi
