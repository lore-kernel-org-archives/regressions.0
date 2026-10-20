Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479779;
	b=0g5TYCD1MUvUMnNQ/chds/Ds/vIfuTMlAvzrOuI1DMnEpwxH+oenZaIUFuAZuavahBG9
	 nFVu44T8dv2MKMzsVUnkiYtZZgLcGlw4NP4hQhwkQVY7hIKmkh/sN4Nla3rpzB2WpPakO
	 CuHXyuJd5QgG4aQb/CDO0Z/d7weFMjnYmwCbVyRCVLI6WSCp0bEtgdJW+1qlig76znbTO
	 Uq8UXT2rF1WXBTdHy4NiHUAT47ma22e3/lhHm3Qr5M+wlmu6sLSEJqdj/3Se9KPShsULo
	 OJHkX44aE08PmG+SmAa7Uy94z6rSlUMwKAuInBhDR2tYi1Ot/pNhyqdl/WVSZ+wIBLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479779;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Score:X-Spamd-Bar:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Action:X-Spamd-Result:
	 X-Rspamd-Server;
	bh=vj73g/3K0fJxcG8o6j5qyxa7lPBLaWB4mf/oxFya8To=;
	b=1+iBJXlMCy8zXchanEXrA+XrHOW+46i5DPB3A8SIVPca+x90hE8V2+8vSvpWOeXURy44
	 R4TUtHakrX81sBLcMyaVvrBvL8WOfdcA4hTgkYAZRrUsd+C1NSjEcBsMfM7LMWLmbA2ud
	 R+F7WCOVwnA64eerJJ/3nFoyu/aLoVvQ7TZqTmjmrYCG3uXEeFjmULEYJ7c+aCy86VIF+
	 28ecmJG318XfymJhe9ghq3XKNw27QIBqayj1xrHimz+rRfFiZx09+Twn73U/NZxwAh81i
	 lxnc3NnvHy+x64phrJeyogfZ35yiQDizRqGwkVIFtR3h9TeMcgBAOuMRcwmzLEWlGmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1xSq58jL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pWDpSCBT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zj2zgWx9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=y4ygsr4+;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEF7606A319
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 07:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFEF7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1xSq58jL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pWDpSCBT;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zj2zgWx9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=y4ygsr4+
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8D9071F44E;
	Tue, 20 Oct 2026 07:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792479772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vj73g/3K0fJxcG8o6j5qyxa7lPBLaWB4mf/oxFya8To=;
	b=1xSq58jLeg3q5DyNhGeS1BINdSmGJnNS66C/2zOHSrfwe3fSx6Hf4a2Ti1H1Yro+fgu8wV
	fS+k35oOJMxDkbxKef/hy+6CgOgWB90UtElAhzG7XN8DTNHO4ZlDbP9Xqz7awUauz1ZM8w
	6s5TimYx11ks+AV/XZpXqqiJb2qwGmg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792479772;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vj73g/3K0fJxcG8o6j5qyxa7lPBLaWB4mf/oxFya8To=;
	b=pWDpSCBTQx9np49rE9bl3GY43iNel7bUcqbDo3bcrc5nCq+hHp+c6jjcIQzt3VWDL9wEFO
	6eMSX5PFUd3rSAAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zj2zgWx9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=y4ygsr4+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792479767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vj73g/3K0fJxcG8o6j5qyxa7lPBLaWB4mf/oxFya8To=;
	b=zj2zgWx95VCmyxnjB2c20mGGrPbbqy5DPVXNNbZ7T0k2yvfwyrryRPHYXJ+qWA2WuIw6OV
	doPa9NtLFT3vCGYEL48JJRCNgeSVr289GM51uBX/rFSGM0K+htCNnj3LlnWiUMM/7evSgi
	3JEffitXWHTVzV39qAvHDNA4AFim72M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792479767;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vj73g/3K0fJxcG8o6j5qyxa7lPBLaWB4mf/oxFya8To=;
	b=y4ygsr4+8dQRqmtnvJGBkN3wMp7G7UN+1MtirJUNTKOqGHPgU/fCtAeisfeCanYSCAYVsi
	Sv0CskFgzenFSYCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 41558136CC;
	Tue, 20 Oct 2026 07:02:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jdvyBhcS12rMYgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 Oct 2026 07:02:47 +0000
Date: Tue, 20 Oct 2026 09:02:46 +0200
Message-ID: <87pkx4j1m1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: kernel@florianmueller.de
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de,
	perex@perex.cz,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] ALSA: hda/intel: "no codecs initialized" (CORB reset timeout) on Acer Aspire 4820G since v6.16
In-Reply-To: <184896de-1e21-4abb-a224-eda0b5bddfc6@florianmueller.de>
References: <184896de-1e21-4abb-a224-eda0b5bddfc6@florianmueller.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: 0.29
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 8D9071F44E
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.29 / 50.00];
	SEM_URIBL(3.50)[ubuntu.com:url];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	R_DKIM_ALLOW(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,launchpad.net:url,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Mon, 19 Oct 2026 21:18:02 +0200,
kernel@florianmueller.de wrote:
> 
> Hello,
> 
> the internal HDA codec (Realtek ALC269VB) of my Acer Aspire 4820G is no
> longer detected since v6.16. Only the HDMI audio of the Radeon remains,
> so the built-in speakers are silent. Everything up to v6.15.11 works
> (actually between 6.9 and 6.15.11 - 6.8 also does not work).

Since HDMI audio is tied to both HD-audio and graphics drivers, it's
hard to tell, unfortunately.  Could you try git-bisect to find out the
culprit commit?


Takashi

> 
> Hardware
>   - Acer Aspire 4820G (2010), BIOS V1.25
>   - Intel PCH HDA controller 0000:00:1b.0, codec Realtek ALC269VB
>   - Switchable graphics: Intel (i915) + ATI Radeon (radeon), vga_switcheroo
>   - ATI HDMI audio at 0000:01:00.1
> 
> Setup
>   Xubuntu 26.04.1; kernels are the Ubuntu mainline builds from
>   kernel.ubuntu.com/mainline (6.16.0-061600-generic etc.), except
>   6.8.0-147-generic (Ubuntu). Kernel command line: quiet splash.
>   Every test was a full reboot, a subset of them cold boots (power off).
>   The pattern is fully consistent and reproducible.
> 
> Results
>   good: 6.9.12, 6.11.11, 6.12.113, 6.14.11, 6.15.11
>   bad:  6.16.0, 6.16.12, 6.18.57, 7.0.0-38
>   also bad: 6.8.0-147 (Ubuntu), but 6.9.12 is good, so that could be an
>   older, separate or related problem that was fixed for 6.9.
>   No 6.16-rc builds were available in the archive, so I could not narrow
>   it down further than v6.15.11 (good) -> v6.16.0 (bad).
> 
> Log on bad kernels (6.16.0)
>   snd_hda_intel 0000:00:1b.0: number of I/O streams is 30, forcing
> separate stream tags
>   snd_hda_intel 0000:00:1b.0: CORB reset timeout#2, CORBRP = 65535
>   hdaudio hdaudioC1D0: no AFG or MFG node found
>   (same for hdaudioC1D1, C1D2, C1D3)
>   snd_hda_intel 0000:00:1b.0: no codecs initialized
> 
> Log on good kernels (6.15.11)
>   The "number of I/O streams is 30" line is not printed, and
>   snd_hda_codec_realtek binds:
>   snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC269VB:
> line_outs=1 ...
> 
> Observation
>   "30 streams" is what one would get from a GCAP value of 0xFFFF
>   (ISS = OSS = 15), and CORBRP = 65535 is also all ones. This looks like
>   the controller is not accessible (or still in reset/low power) when the
>   driver probes it on 6.16 and later. This is only my interpretation of
>   the numbers - please ignore, if it does not make sense.
> 
> Attached: dmesg (hda|codec|CORB), uname -r and aplay -l for 6.8.0,
> 6.9.12, 6.15.11,
> 6.16.0, 6.18.57 and 7.0.0, plus alsa-info and lspci -nnk.
> 
> I am happy to test patches or answer questions.
> 
> One thing that we get to say to rarely:
> Thank you very much to you and all the kernel developers for the great
> work and great dedication to FOSS software!
> 
> Thanks,
> Florian
> ~$ uname -r
> 6.8.0-147-generic
> ~$ sudo dmesg | grep -i -E "hda|codec|CORB"
> [sudo: authenticate] Passwort:        
> [   18.091190] snd_hda_intel 0000:00:1b.0: enabling device (0000 -> 0002)
> [   18.091570] snd_hda_intel 0000:00:1b.0: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
> [   18.092098] snd_hda_intel 0000:00:1b.0: number of I/O streams is 30, forcing separate stream tags
> [   18.196646] snd_hda_intel 0000:00:1b.0: CORB reset timeout#2, CORBRP = 65535
> [   18.208215] hdaudio hdaudioC0D0: no AFG or MFG node found
> [   18.208240] hdaudio hdaudioC0D1: no AFG or MFG node found
> [   18.208254] hdaudio hdaudioC0D2: no AFG or MFG node found
> [   18.208266] hdaudio hdaudioC0D3: no AFG or MFG node found
> [   18.208270] snd_hda_intel 0000:00:1b.0: no codecs initialized
> [   19.914898] snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio client
> [   19.985798] snd_hda_intel 0000:01:00.1: bound 0000:01:00.0 (ops radeon_audio_component_bind_ops [radeon])
> [   20.018723] input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card0/input16
> ~$ aplay -l
> **** Liste der Hardware-Geräte (PLAYBACK) ****
> Karte 0: HDMI [HDA ATI HDMI], Gerät 3: HDMI 0 [HDMI 0]
>   Sub-Geräte: 1/1
>   Sub-Gerät #0: subdevice #0
> ~$ uname -r
> 6.9.12-060912-generic
> ~$ sudo dmesg | grep -i -E "hda|codec|CORB"
> [sudo: authenticate] Passwort:        
> [    8.489918] snd_hda_intel 0000:00:1b.0: enabling device (0000 -> 0002)
> [    8.509215] snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio client
> [    8.532525] snd_hda_intel 0000:01:00.1: bound 0000:01:00.0 (ops radeon_audio_component_bind_ops [radeon])
> [    8.533963] input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card0/input14
> [    8.700320] snd_hda_intel 0000:00:1b.0: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
> [    8.752819] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC269VB: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
> [    8.752834] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [    8.752839] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
> [    8.752843] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
> [    8.752846] snd_hda_codec_realtek hdaudioC1D0:    dig-out=0x1e/0x0
> [    8.752848] snd_hda_codec_realtek hdaudioC1D0:    inputs:
> [    8.752852] snd_hda_codec_realtek hdaudioC1D0:      Mic=0x18
> [    8.752855] snd_hda_codec_realtek hdaudioC1D0:      Internal Mic=0x12
> [    8.776195] input: HDA Intel MID Mic as /devices/pci0000:00/0000:00:1b.0/sound/card1/input17
> [    8.776827] input: HDA Intel MID Headphone as /devices/pci0000:00/0000:00:1b.0/sound/card1/input18
> ~$ aplay -l
> **** Liste der Hardware-Geräte (PLAYBACK) ****
> Karte 0: HDMI [HDA ATI HDMI], Gerät 3: HDMI 0 [HDMI 0]
>   Sub-Geräte: 1/1
>   Sub-Gerät #0: subdevice #0
> Karte 1: MID [HDA Intel MID], Gerät 0: ALC269VB Analog [ALC269VB Analog]
>   Sub-Geräte: 1/1
>   Sub-Gerät #0: subdevice #0
> Karte 1: MID [HDA Intel MID], Gerät 1: ALC269VB Digital [ALC269VB Digital]
>   Sub-Geräte: 1/1
>   Sub-Gerät #0: subdevice #0
> ~$ uname -r
> 6.15.11-061511-generic
> ~$ sudo dmesg | grep -i -E "hda|codec|CORB"
> [sudo: authenticate] Passwort:        
> [   10.356203] snd_hda_intel 0000:00:1b.0: enabling device (0000 -> 0002)
> [   10.356988] snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio client
> [   10.375145] snd_hda_intel 0000:01:00.1: bound 0000:01:00.0 (ops radeon_audio_component_bind_ops [radeon])
> [   10.375865] snd_hda_intel 0000:00:1b.0: bound 0000:00:02.0 (ops intel_audio_component_bind_ops [i915])
> [   10.376734] input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card0/input16
> [   10.539973] snd_hda_codec_realtek hdaudioC1D0: ALC269VB: picked fixup  for PCI SSID 1025:0000
> [   10.541278] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC269VB: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
> [   10.541291] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [   10.541296] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
> [   10.541300] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
> [   10.541303] snd_hda_codec_realtek hdaudioC1D0:    dig-out=0x1e/0x0
> [   10.541306] snd_hda_codec_realtek hdaudioC1D0:    inputs:
> [   10.541309] snd_hda_codec_realtek hdaudioC1D0:      Internal Mic=0x12
> [   10.541313] snd_hda_codec_realtek hdaudioC1D0:      Mic=0x18
> [   10.853762] input: HDA Intel MID Mic as /devices/pci0000:00/0000:00:1b.0/sound/card1/input17
> [   10.853978] input: HDA Intel MID Headphone as /devices/pci0000:00/0000:00:1b.0/sound/card1/input18
> ~$ aplay -l
> **** Liste der Hardware-Geräte (PLAYBACK) ****
> Karte 0: HDMI [HDA ATI HDMI], Gerät 3: HDMI 0 [HDMI 0]
>   Sub-Geräte: 1/1
>   Sub-Gerät #0: subdevice #0
> Karte 1: MID [HDA Intel MID], Gerät 0: ALC269VB Analog [ALC269VB Analog]
>   Sub-Geräte: 1/1
>   Sub-Gerät #0: subdevice #0
> Karte 1: MID [HDA Intel MID], Gerät 1: ALC269VB Digital [ALC269VB Digital]
>   Sub-Geräte: 1/1
>   Sub-Gerät #0: subdevice #0
> ~$ uname -r
> 6.16.0-061600-generic
> ~$ sudo dmesg | grep -i -E "hda|codec|CORB"
> [sudo: authenticate] Passwort:        
> [    8.587748] snd_hda_intel 0000:00:1b.0: enabling device (0000 -> 0002)
> [    8.590394] snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio client
> [    8.614173] snd_hda_intel 0000:01:00.1: bound 0000:01:00.0 (ops radeon_audio_component_bind_ops [radeon])
> [    8.615630] input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card0/input14
> [    9.641195] snd_hda_intel 0000:00:1b.0: bound 0000:00:02.0 (ops intel_audio_component_bind_ops [i915])
> [    9.642145] snd_hda_intel 0000:00:1b.0: number of I/O streams is 30, forcing separate stream tags
> [    9.746677] snd_hda_intel 0000:00:1b.0: CORB reset timeout#2, CORBRP = 65535
> [    9.748114] hdaudio hdaudioC1D0: no AFG or MFG node found
> [    9.748140] hdaudio hdaudioC1D1: no AFG or MFG node found
> [    9.748154] hdaudio hdaudioC1D2: no AFG or MFG node found
> [    9.748167] hdaudio hdaudioC1D3: no AFG or MFG node found
> [    9.748172] snd_hda_intel 0000:00:1b.0: no codecs initialized
> ~$ aplay -l
> **** Liste der Hardware-Geräte (PLAYBACK) ****
> Karte 0: HDMI [HDA ATI HDMI], Gerät 3: HDMI 0 [HDMI 0]
>   Sub-Geräte: 1/1
>   Sub-Gerät #0: subdevice #0
> ~$ uname -r
> 6.18.57-061857-generic
> ~$ sudo dmesg | grep -i -E "hda|codec|CORB"
> [sudo: authenticate] Passwort:        
> [    9.361118] snd_hda_intel 0000:00:1b.0: enabling device (0000 -> 0002)
> [    9.392794] snd_hda_intel 0000:00:1b.0: bound 0000:00:02.0 (ops intel_audio_component_bind_ops [i915])
> [    9.393187] snd_hda_intel 0000:00:1b.0: number of I/O streams is 30, forcing separate stream tags
> [    9.402281] snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio client
> [    9.431922] snd_hda_intel 0000:01:00.1: bound 0000:01:00.0 (ops radeon_audio_component_bind_ops [radeon])
> [    9.497770] snd_hda_intel 0000:00:1b.0: CORB reset timeout#2, CORBRP = 65535
> [    9.502431] input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input15
> [    9.502617] hdaudio hdaudioC0D0: no AFG or MFG node found
> [    9.502636] hdaudio hdaudioC0D1: no AFG or MFG node found
> [    9.502647] hdaudio hdaudioC0D2: no AFG or MFG node found
> [    9.502657] hdaudio hdaudioC0D3: no AFG or MFG node found
> [    9.502661] snd_hda_intel 0000:00:1b.0: no codecs initialized
> ~$ aplay -l
> **** Liste der Hardware-Geräte (PLAYBACK) ****
> Karte 1: HDMI [HDA ATI HDMI], Gerät 3: HDMI 0 [HDMI 0]
>   Sub-Geräte: 1/1
>   Sub-Gerät #0: subdevice #0
> ~$ uname -r
> 7.0.0-38-generic
> ~$ sudo dmesg | grep -i -E "hda|codec|CORB"
> [sudo: authenticate] Passwort:        
> [    8.881157] snd_hda_intel 0000:00:1b.0: enabling device (0000 -> 0002)
> [    8.881582] snd_hda_intel 0000:00:1b.0: bound 0000:00:02.0 (ops intel_audio_component_bind_ops [i915])
> [    8.884669] snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio client
> [    8.886046] snd_hda_intel 0000:00:1b.0: number of I/O streams is 30, forcing separate stream tags
> [    8.984401] snd_hda_intel 0000:01:00.1: bound 0000:01:00.0 (ops radeon_audio_component_bind_ops [radeon])
> [    8.991482] snd_hda_intel 0000:00:1b.0: CORB reset timeout#2, CORBRP = 65535
> [    8.995216] hdaudio hdaudioC0D0: no AFG or MFG node found
> [    8.995246] hdaudio hdaudioC0D1: no AFG or MFG node found
> [    8.995261] hdaudio hdaudioC0D2: no AFG or MFG node found
> [    8.995273] hdaudio hdaudioC0D3: no AFG or MFG node found
> [    8.995279] snd_hda_intel 0000:00:1b.0: no codecs initialized
> [    9.036115] input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input16
> ~$ aplay -l
> **** Liste der Hardware-Geräte (PLAYBACK) ****
> Karte 1: HDMI [HDA ATI HDMI], Gerät 3: HDMI 0 [HDMI 0]
>   Sub-Geräte: 1/1
>   Sub-Gerät #0: subdevice #0
> ~$ lspci -nnk
> 00:00.0 Host bridge [0600]: Intel Corporation Core Processor DRAM Controller [8086:0044] (rev 18)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 00:01.0 PCI bridge [0604]: Intel Corporation Core Processor PCI Express x16 Root Port [8086:0045] (rev 18)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 	Kernel driver in use: pcieport
> 00:02.0 VGA compatible controller [0300]: Intel Corporation Core Processor Integrated Graphics Controller [8086:0046] (rev 18)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 	Kernel driver in use: i915
> 	Kernel modules: i915
> 00:16.0 Communication controller [0780]: Intel Corporation 5 Series/3400 Series Chipset HECI Controller [8086:3b64] (rev 06)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 	Kernel driver in use: mei_me
> 	Kernel modules: mei_me
> 00:1a.0 USB controller [0c03]: Intel Corporation 5 Series/3400 Series Chipset USB2 Enhanced Host Controller [8086:3b3c] (rev 05)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 	Kernel driver in use: ehci-pci
> 00:1b.0 Audio device [0403]: Intel Corporation 5 Series/3400 Series Chipset High Definition Audio [8086:3b56] (rev 05)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 	Kernel driver in use: snd_hda_intel
> 	Kernel modules: snd_hda_intel
> 00:1c.0 PCI bridge [0604]: Intel Corporation 5 Series/3400 Series Chipset PCI Express Root Port 1 [8086:3b42] (rev 05)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 	Kernel driver in use: pcieport
> 00:1c.5 PCI bridge [0604]: Intel Corporation 5 Series/3400 Series Chipset PCI Express Root Port 6 [8086:3b4c] (rev 05)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 	Kernel driver in use: pcieport
> 00:1d.0 USB controller [0c03]: Intel Corporation 5 Series/3400 Series Chipset USB2 Enhanced Host Controller [8086:3b34] (rev 05)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 	Kernel driver in use: ehci-pci
> 00:1e.0 PCI bridge [0604]: Intel Corporation 82801 Mobile PCI Bridge [8086:2448] (rev a5)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 00:1f.0 ISA bridge [0601]: Intel Corporation HM55 Chipset LPC Interface Controller [8086:3b09] (rev 05)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 	Kernel driver in use: lpc_ich
> 	Kernel modules: lpc_ich
> 00:1f.2 SATA controller [0106]: Intel Corporation 5 Series/3400 Series Chipset 4 port SATA AHCI Controller [8086:3b29] (rev 05)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 	Kernel driver in use: ahci
> 	Kernel modules: ahci
> 00:1f.3 SMBus [0c05]: Intel Corporation 5 Series/3400 Series Chipset SMBus Controller [8086:3b30] (rev 05)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 	Kernel driver in use: i801_smbus
> 	Kernel modules: i2c_i801
> 00:1f.6 Signal processing controller [1180]: Intel Corporation 5 Series/3400 Series Chipset Thermal Subsystem [8086:3b32] (rev 05)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 	Kernel driver in use: intel ips
> 	Kernel modules: intel_ips
> 01:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Madison [Mobility Radeon HD 5650/5750 / 6530M/6550M] [1002:68c1]
> 	Subsystem: Acer Incorporated [ALI] Mobility Radeon HD 5650 [1025:0359]
> 	Kernel driver in use: radeon
> 	Kernel modules: radeon, amdgpu
> 01:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Redwood HDMI Audio [Radeon HD 5000 Series] [1002:aa60]
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 	Kernel driver in use: snd_hda_intel
> 	Kernel modules: snd_hda_intel
> 02:00.0 Ethernet controller [0200]: Qualcomm Atheros AR8151 v1.0 Gigabit Ethernet [1969:1073] (rev c0)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 	Kernel driver in use: atl1c
> 	Kernel modules: atl1c
> 03:00.0 Network controller [0280]: Intel Corporation Wireless 7260 [8086:08b1] (rev bb)
> 	Subsystem: Intel Corporation Dual Band Wireless-AC 7260 [Wilkins Peak 2] [8086:4470]
> 	Kernel driver in use: iwlwifi
> 	Kernel modules: iwlwifi
> 7f:00.0 Host bridge [0600]: Intel Corporation Core Processor QuickPath Architecture Generic Non-core Registers [8086:2c62] (rev 05)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 7f:00.1 Host bridge [0600]: Intel Corporation Core Processor QuickPath Architecture System Address Decoder [8086:2d01] (rev 05)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 7f:02.0 Host bridge [0600]: Intel Corporation Core Processor QPI Link 0 [8086:2d10] (rev 05)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 7f:02.1 Host bridge [0600]: Intel Corporation 1st Generation Core i3/5/7 Processor QPI Physical 0 [8086:2d11] (rev 05)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 7f:02.2 Host bridge [0600]: Intel Corporation 1st Generation Core i3/5/7 Processor Reserved [8086:2d12] (rev 05)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 7f:02.3 Host bridge [0600]: Intel Corporation 1st Generation Core i3/5/7 Processor Reserved [8086:2d13] (rev 05)
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> upload=true&script=true&cardinfo=
> !!################################
> !!ALSA Information Script v 0.5.3
> !!################################
> 
> !!Script ran on: Mon Oct 19 19:03:24 UTC 2026
> 
> 
> !!Linux Distribution
> !!------------------
> 
> Ubuntu 26.04.1 LTS \n \l DISTRIB_ID=Ubuntu DISTRIB_DESCRIPTION="Ubuntu 26.04.1 LTS" PRETTY_NAME="Ubuntu 26.04.1 LTS" NAME="Ubuntu" ID=ubuntu ID_LIKE=debian HOME_URL="https://www.ubuntu.com/" SUPPORT_URL="https://help.ubuntu.com/" BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/" PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy" UBUNTU_CODENAME=resolute LOGO=ubuntu-logo
> 
> 
> !!DMI Information
> !!---------------
> 
> Manufacturer:      Acer
> Product Name:      Aspire 4820G
> Product Version:   V1.25
> Firmware Version:  V1.25
> System SKU:        Calpella_CRB
> Board Vendor:      Acer
> Board Name:        JM41_CP
> 
> 
> !!ACPI Device Status Information
> !!---------------
> 
> /sys/bus/acpi/devices/LNXVIDEO:02/status 	 15
> /sys/bus/acpi/devices/PNP0103:00/status 	 15
> /sys/bus/acpi/devices/PNP0C0A:00/status 	 31
> /sys/bus/acpi/devices/PNP0C0F:00/status 	 9
> /sys/bus/acpi/devices/PNP0C0F:01/status 	 9
> /sys/bus/acpi/devices/PNP0C0F:02/status 	 9
> /sys/bus/acpi/devices/PNP0C0F:03/status 	 9
> /sys/bus/acpi/devices/PNP0C0F:04/status 	 9
> /sys/bus/acpi/devices/PNP0C0F:05/status 	 9
> /sys/bus/acpi/devices/PNP0C0F:06/status 	 9
> /sys/bus/acpi/devices/PNP0C0F:07/status 	 9
> 
> 
> !!ACPI SoundWire Device Status Information
> !!---------------
> 
> 
> 
> !!Kernel Information
> !!------------------
> 
> Kernel release:    #202507272138 SMP PREEMPT_DYNAMIC Sun Jul 27 22:00:36 UTC 2025
> Operating System:  GNU/Linux
> Architecture:      x86_64
> Processor:         unknown
> SMP Enabled:       Yes
> 
> 
> !!ALSA Version
> !!------------
> 
> Driver version:     k6.16.0-061600-generic
> Library version:    
> Utilities version:  1.2.15.2
> 
> 
> !!Loaded ALSA modules
> !!-------------------
> 
> snd_hda_intel (card 0)
> 
> 
> !!Sound Servers on this system
> !!----------------------------
> 
> PipeWire:
>       Installed - Yes (/usr/bin/pipewire)
>       Running - Yes
> 
> Pulseaudio:
>       Installed - Yes (/usr/bin/pulseaudio)
>       Running - No
> 
> 
> !!Soundcards recognised by ALSA
> !!-----------------------------
> 
>  0 [HDMI           ]: HDA-Intel - HDA ATI HDMI
>                       HDA ATI HDMI at 0xdc420000 irq 29
> 
> 
> !!PCI Soundcards installed in the system
> !!--------------------------------------
> 
> 00:1b.0 Audio device [0403]: Intel Corporation 5 Series/3400 Series Chipset High Definition Audio [8086:3b56] (rev 05) (prog-if 00 [HDA compatible])
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 01:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Redwood HDMI Audio [Radeon HD 5000 Series] [1002:aa60] (prog-if 00 [HDA compatible])
> 	Subsystem: Acer Incorporated [ALI] Device [1025:0359]
> 
> 
> !!Modprobe options (Sound related)
> !!--------------------------------
> 
> snd_pcsp: index=-2
> snd_atiixp_modem: index=-2
> snd_intel8x0m: index=-2
> snd_via82xx_modem: index=-2
> snd_atiixp_modem: index=-2
> snd_intel8x0m: index=-2
> snd_via82xx_modem: index=-2
> snd_usb_audio: index=-2
> snd_usb_caiaq: index=-2
> snd_usb_ua101: index=-2
> snd_usb_us122l: index=-2
> snd_usb_usx2y: index=-2
> snd_cmipci: mpu_port=0x330 fm_port=0x388
> snd_pcsp: index=-2
> snd_usb_audio: index=-2
> 
> 
> !!Loaded sound module options
> !!---------------------------
> 
> !!Module: snd_hda_intel
> 	align_buffer_size : -1
> 	bdl_pos_adj : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	beep_mode : N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N
> 	ctl_dev_id : N
> 	dmic_detect : Y
> 	enable : Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
> 	enable_msi : -1
> 	id : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	index : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	jackpoll_ms : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
> 	model : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	patch : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
> 	pm_blacklist : -1
> 	position_fix : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	power_save : 1
> 	power_save_controller : Y
> 	probe_mask : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
> 	probe_only : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
> 	single_cmd : -1
> 	snoop : -1
> 
> 
> !!Sysfs card info
> !!---------------
> 
> !!Card: /sys/class/sound/card0
> Driver: /sys/bus/pci/drivers/snd_hda_intel
> Tree:
> 	/sys/class/sound/card0
> 	|-- controlC0
> 	|   |-- dev
> 	|   |-- device -> ../../card0
> 	|   |-- power
> 	|   |-- subsystem -> ../../../../../../../class/sound
> 	|   `-- uevent
> 	|-- device -> ../../../0000:01:00.1
> 	|-- hwC0D0
> 	|   |-- afg
> 	|   |-- chip_name
> 	|   |-- clear
> 	|   |-- dev
> 	|   |-- device -> ../../card0
> 	|   |-- driver_pin_configs
> 	|   |-- hints
> 	|   |-- init_pin_configs
> 	|   |-- init_verbs
> 	|   |-- mfg
> 	|   |-- modelname
> 	|   |-- power
> 	|   |-- power_off_acct
> 	|   |-- power_on_acct
> 	|   |-- reconfig
> 	|   |-- revision_id
> 	|   |-- subsystem -> ../../../../../../../class/sound
> 	|   |-- subsystem_id
> 	|   |-- uevent
> 	|   |-- user_pin_configs
> 	|   |-- vendor_id
> 	|   `-- vendor_name
> 	|-- id
> 	|-- input14
> 	|   |-- capabilities
> 	|   |-- device -> ../../card0
> 	|   |-- event7
> 	|   |-- id
> 	|   |-- inhibited
> 	|   |-- modalias
> 	|   |-- name
> 	|   |-- phys
> 	|   |-- power
> 	|   |-- properties
> 	|   |-- subsystem -> ../../../../../../../class/input
> 	|   |-- uevent
> 	|   `-- uniq
> 	|-- number
> 	|-- pcmC0D3p
> 	|   |-- dev
> 	|   |-- device -> ../../card0
> 	|   |-- pcm_class
> 	|   |-- power
> 	|   |-- subsystem -> ../../../../../../../class/sound
> 	|   `-- uevent
> 	|-- power
> 	|   |-- async
> 	|   |-- autosuspend_delay_ms
> 	|   |-- control
> 	|   |-- runtime_active_kids
> 	|   |-- runtime_active_time
> 	|   |-- runtime_enabled
> 	|   |-- runtime_status
> 	|   |-- runtime_suspended_time
> 	|   `-- runtime_usage
> 	|-- subsystem -> ../../../../../../class/sound
> 	`-- uevent
> 
> 
> !!HDA-Intel Codec information
> !!---------------------------
> --startcollapse--
> 
> Codec: ATI R6xx HDMI
> Address: 0
> AFG Function Id: 0x1 (unsol 0)
> Vendor Id: 0x1002aa01
> Subsystem Id: 0x00aa0100
> Revision Id: 0x100200
> No Modem Function Group found
> Default PCM:
>     rates [0x70]: 32000 44100 48000
>     bits [0x2]: 16
>     formats [0x1]: PCM
> Default Amp-In caps: N/A
> Default Amp-Out caps: N/A
> State of AFG node 0x01:
>   Power states:  D0 D3
>   Power: setting=D0, actual=D0
> GPIO: io=0, o=0, i=0, unsolicited=0, wake=0
> Node 0x02 [Audio Output] wcaps 0x201: Stereo Digital
>   Converter: stream=0, channel=0
>   Digital: Enabled GenLevel
>   Digital category: 0x2
>   IEC Coding Type: 0x0
> Node 0x03 [Pin Complex] wcaps 0x400381: Stereo Digital
>   Pincap 0x00000094: OUT Detect HDMI
>   Pin Default 0x18560010: [Jack] Digital Out at Int HDMI
>     Conn = Digital, Color = Unknown
>     DefAssociation = 0x1, Sequence = 0x0
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Connection: 1
>      0x02
> --endcollapse--
> 
> 
> !!ALSA Device nodes
> !!-----------------
> 
> crw-rw----+ 1 root audio 116,  4 Oct 19 20:23 /dev/snd/controlC0
> crw-rw----+ 1 root audio 116,  3 Oct 19 20:23 /dev/snd/hwC0D0
> crw-rw----+ 1 root audio 116,  2 Oct 19 20:23 /dev/snd/pcmC0D3p
> crw-rw----+ 1 root audio 116,  1 Oct 19 20:23 /dev/snd/seq
> crw-rw----+ 1 root audio 116, 33 Oct 19 20:23 /dev/snd/timer
> 
> /dev/snd/by-path:
> total 0
> drwxr-xr-x  2 root root  60 Oct 19 20:23 .
> drwxr-xr-x  3 root root 160 Oct 19 20:23 ..
> lrwxrwxrwx+ 1 root root  12 Oct 19 20:23 pci-0000:01:00.1 -> ../controlC0
> 
> 
> !!Aplay/Arecord output
> !!--------------------
> 
> APLAY
> 
> **** List of PLAYBACK Hardware Devices ****
> card 0: HDMI [HDA ATI HDMI], device 3: HDMI 0 [HDMI 0]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> 
> ARECORD
> 
> **** List of CAPTURE Hardware Devices ****
> 
> !!Amixer output
> !!-------------
> 
> !!-------Mixer controls for card HDMI
> 
> Card sysdefault:0 'HDMI'/'HDA ATI HDMI at 0xdc420000 irq 29'
>   Mixer name	: 'ATI R6xx HDMI'
>   Components	: 'HDA:1002aa01,00aa0100,00100200'
>   Controls      : 7
>   Simple ctrls  : 1
> Simple mixer control 'IEC958',0
>   Capabilities: pswitch pswitch-joined
>   Playback channels: Mono
>   Mono: Playback [on]
> 
> 
> !!Alsactl output
> !!--------------
> 
> --startcollapse--
> state.HDMI {
> 	control.1 {
> 		iface CARD
> 		name 'HDMI/DP,pcm=3 Jack'
> 		value false
> 		comment {
> 			access read
> 			type BOOLEAN
> 			count 1
> 		}
> 	}
> 	control.2 {
> 		iface MIXER
> 		name 'IEC958 Playback Con Mask'
> 		value '0fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
> 		comment {
> 			access read
> 			type IEC958
> 			count 1
> 		}
> 	}
> 	control.3 {
> 		iface MIXER
> 		name 'IEC958 Playback Pro Mask'
> 		value '0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
> 		comment {
> 			access read
> 			type IEC958
> 			count 1
> 		}
> 	}
> 	control.4 {
> 		iface MIXER
> 		name 'IEC958 Playback Default'
> 		value '0482000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
> 		comment {
> 			access 'read write'
> 			type IEC958
> 			count 1
> 		}
> 	}
> 	control.5 {
> 		iface MIXER
> 		name 'IEC958 Playback Switch'
> 		value true
> 		comment {
> 			access 'read write'
> 			type BOOLEAN
> 			count 1
> 		}
> 	}
> 	control.6 {
> 		iface PCM
> 		device 3
> 		name ELD
> 		value ''
> 		comment {
> 			access 'read volatile'
> 			type BYTES
> 			count 0
> 		}
> 	}
> 	control.7 {
> 		iface PCM
> 		device 3
> 		name 'Playback Channel Map'
> 		value.0 0
> 		value.1 0
> 		value.2 0
> 		value.3 0
> 		value.4 0
> 		value.5 0
> 		value.6 0
> 		value.7 0
> 		comment {
> 			access 'read write volatile'
> 			type INTEGER
> 			count 8
> 			range '0 - 36'
> 		}
> 	}
> }
> --endcollapse--
> 
> 
> !!All Loaded Modules
> !!------------------
> 
> acer_wmi
> ahci
> amdgpu
> amdxcp
> at24
> atl1c
> autofs4
> binfmt_misc
> bluetooth
> bnep
> btbcm
> btintel
> btmtk
> btrtl
> btusb
> ccm
> cec
> cfg80211
> coretemp
> dmi_sysfs
> drm_buddy
> drm_display_helper
> drm_exec
> drm_panel_backlight_quirks
> drm_suballoc_helper
> drm_ttm_helper
> efi_pstore
> gpu_sched
> i2c_algo_bit
> i2c_i801
> i2c_mux
> i2c_smbus
> i915
> input_leds
> intel_cstate
> intel_ips
> intel_powerclamp
> irqbypass
> iwlmvm
> iwlwifi
> joydev
> kvm
> kvm_intel
> libahci
> libarc4
> lp
> lpc_ich
> mac80211
> mac_hid
> mc
> mei
> mei_me
> mei_pxp
> msr
> option
> parport
> platform_profile
> ppdev
> psmouse
> qrtr
> radeon
> rc_core
> rfcomm
> sch_fq_codel
> serio_raw
> sha1_ssse3
> snd
> snd_hda_codec
> snd_hda_codec_hdmi
> snd_hda_core
> snd_hda_intel
> snd_hrtimer
> snd_hwdep
> snd_intel_dspcfg
> snd_intel_sdw_acpi
> snd_pcm
> snd_rawmidi
> snd_seq
> snd_seq_device
> snd_seq_dummy
> snd_seq_midi
> snd_seq_midi_event
> snd_timer
> soundcore
> sparse_keymap
> ttm
> usb_storage
> usb_wwan
> usbserial
> uvc
> uvcvideo
> video
> videobuf2_common
> videobuf2_memops
> videobuf2_v4l2
> videobuf2_vmalloc
> videodev
> wmi
> wmi_bmof
> 
> 
> !!Sysfs Files
> !!-----------
> 
> /sys/class/sound/hwC0D0/init_pin_configs:
> 0x03 0x18560010
> 
> /sys/class/sound/hwC0D0/driver_pin_configs:
> 
> /sys/class/sound/hwC0D0/user_pin_configs:
> 
> /sys/class/sound/hwC0D0/init_verbs:
> 
> /sys/class/sound/hwC0D0/hints:
> 
> 
> !!ALSA/HDA dmesg
> !!--------------
> 
> 
> 
> !!Packages installed
> !!--------------------
> 
> ii  alsa-topology-conf                            1.2.5.1-3build1                              all          ALSA topology configuration files
> ii  alsa-ucm-conf                                 1.2.15.3-1ubuntu1.7                          all          ALSA Use Case Manager configuration files
> ii  alsa-utils                                    1.2.15.2-1ubuntu1                            amd64        Utilities for configuring and using ALSA
> 
