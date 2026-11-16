Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817837;
	b=XwtvKDNKF+GOcmH2GhpQP+6tnjFLMBGG0cJlh/n8gl4cdgb2q+gkHgXoVvRSagreVjZ5
	 gDHx3IK6srfEXJFQ7+8lUoZDswe47UCieWwCl4ivvDuHgFshpAOfn6Kd5C7LUVHphD3Xc
	 fXylqKREtRYFcvMPwlkVpWrk4loTfyUpSGTZez29txJN1YoMvzZvhveRs4g86SXUCT6fR
	 cWexjRg2J2R6/pHbQxE0IQTJBnuYKnNmXiGntfHlg+Y4zo3HPRBH2IMCtcPdUGTO14j3Y
	 qPVdJg12/gb7MSg9IJmIdMxRUtV9p6KqW5ffapFGe938fsFoth6WQdaceNr8r6NxHYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=stLAgc75/toghgFHRoMTWr8wGTVjN6A6wa8FXSVhWeE=;
	b=i25WyO016pTPx8l3WHaXbz5SznFOfkq+Esy1XZi98YNQLmkVg3Ybp0IE1D8ZlbfkBagd
	 RZgeXNTI3tnX3s7drlFjFlXqz8qZST8qgE+IDtmb9rSGbFuqP5Ay9G3iBY6My3e5XxivO
	 Rjd1MrBV3GOiSYhCChDSjtA50Thy+dGT3PQDdjnd296ziHhZOFrx+Trgj3Q4kn2dgeM2W
	 zM4TCkjXBKpcFGEfBYGz/g1WXCuh4VUa5hUC8AzEU1t1H80NoVEzbi+TQz27KQT38QlLh
	 0xzRFVDGSLnc6qPRI7girRDFDdTxbU6JgCoV4Ul3dIFzVh9HHwN4F7NL3ysjeX4zMGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=FG6OLmW8;
	arc=none smtp.remote-ip=188.68.63.162
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DC9606A31C
	for <regressions@lists.linux.dev>; Mon, 16 Nov 2026 08:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01DC9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=FG6OLmW8
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4jSgyy4c5Tz3wFW;
	Mon, 16 Nov 2026 09:30:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1794817802;
	bh=DZTBprXxK7kjJ5gp7FXYKcB+Rb/buuRguswOL+ZnbEo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FG6OLmW86jfyOMU+R6zPiTLbzHk18vBdKvo/fD5Ot6MKf4vWvYIH62bjCUooqcg0k
	 uom2OoV9H/uXi61VkySBhUzI+O8XCWKi9cNcdMERK94mviWOhQM1tfDhyoe8hTVhFi
	 OE8cY4s0V2ONH9F6RLpO7PufJ4Y/d8SqGPE0BKb2TGHPnXUtJM/j0sqAytxa3p8yJr
	 1hy6+OMQLbX9uZ0jCz+FdUYxIwuAWFRr6T6fT0DW1tqw87Qq5MaFtbaeAjAbbTL2R2
	 bfgpWVk8LN8Wb6PGjK8k/LEUfX1wwQ0lnFasmrZL/pBNAnlly4bWCwDP5n5JZeJAKa
	 rwefq9b2y44og==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4jSgyy19RTz42QT;
	Mon, 16 Nov 2026 09:30:02 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jSgyx1Mb0z8tHp;
	Mon, 16 Nov 2026 09:30:01 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 6B4945F9EB;
	Mon, 16 Nov 2026 09:29:46 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <380ce8f7-1d88-4d5c-bf3d-108be7055ec9@leemhuis.info>
Date: Mon, 16 Nov 2026 09:29:45 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ALSA: hda/realtek: no speaker sound on Lenovo Legion
 16IRX9H since f2293e7b2ddd (PCI SSID 17aa:3842 shared with ThinkBook X G2
 IAH)
To: Greg KH <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: tiwai@suse.de, william <assassinshalo29@gmail.com>, evgeny@devduty.com,
 stable@vger.kernel.org, regressions@lists.linux.dev,
 linux-sound@vger.kernel.org
References: 
 <CAFjFWEjt+DPJ_gM1uTBZ_NoV6-3mi57ArjZ_Qdah2DqY-GCD1w@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CAFjFWEjt+DPJ_gM1uTBZ_NoV6-3mi57ArjZ_Qdah2DqY-GCD1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179481778690.466935.124532524917592183@mxe9fb.netcup.net>
X-NC-CID: cUG7y3e30E7GrDwrudyUN+lU/QL7i9S2qYrjAbXb5gRBUO6D5yg=

On 11/16/26 02:24, william wrote:
> Commit f2293e7b2ddd ("ALSA: hda/realtek: Enable all four speaker amps on Lenovo
> ThinkBook X G2 IAH", Cc: stable) matches the laptop by PCI SSID
> 17aa:3842, on the
> assumption that this SSID had no quirk entry. The Lenovo Legion 16IRX9H (83DE)
> has the same PCI SSID, so its internal speakers are silent on kernels that carry
> this commit. Headphones work.

Greg, Sasha, that change made it to 7.3.y already, but is in the current
6.18.y-rc afaics -- so might be something to drop until this is sorted out.

Ciao, Thorsten

> Hardware
> Lenovo Legion 16IRX9H, product 83DE, BIOS N2CN32WW
> Codec: Realtek ALC287, codec SSID 17aa:38cd, PCI SSID 17aa:3842
> Amplifier: ACPI TIAS2781:00 (i2c-TIAS2781:00 on i2c_designware.2),
> driver snd_hda_scodec_tas2781_i2c
> Kernels
> Works: 7.2.10-200.nobara.fc44, 7.1.6-1-cachyos (live ISO)
> Fails: 7.3.4-201.nobara.fc44, 7.3.4-1-cachyos
> The 3842 entry is absent from v7.2 and v7.3, present in v7.3.4, and still
> present in v7.4-rc1 and master as of 2026-11-15 (checked via the GitHub mirror).
> Analysis
> snd_hda_pick_fixup() walks the table and matches PCI-SSID entries before the
> codec-SSID fallback. Before the commit, 17aa:3842 had no entry, so this machine
> fell through to the existing codec-SSID entry
> SND_PCI_QUIRK(0x17aa, 0x38cd, "Y790 VECO DUAL", ALC287_FIXUP_TAS2781_I2C),
> which works. With the commit, the 3842 entry wins and chains to
> cs35l41_fixup_i2c_four(), so the codec master waits for four CS35L41 components
> that do not exist on this machine.
> Evidence on 7.3.4
> dmesg: "ALC287: picked fixup for PCI SSID 17aa:3842"; no "bound i2c-TIAS2781:00"
> line (on 7.2.10 that line is present).
> /sys/kernel/debug/device_component/hdaudioC0D0: master "not bound",
> four entries "(unknown) not registered".
> With dyndbg, after "echo 1 > /sys/class/sound/hwC0D0/reconfig":
> hdaudioC0D0: trying to bring up adev
> hdaudioC0D0: Looking for component 0
> hdaudioC0D0: master has incomplete components
> After unbinding/binding i2c-TIAS2781:00, tas2781-hda logs "adding component"
> but the master still reports incomplete components.
> Workaround confirmed
> Booting with snd_hda_intel.model=17aa:38cd (alias SSID, handled first by the
> picker) gives:
> ALC287: picked fixup for alias SSID 17aa:38cd
> bound i2c-TIAS2781:00 (ops tas2781_hda_comp_ops [snd_hda_scodec_tas2781_i2c])
> and the speakers work.
> Possible direction
> Since both laptops share the PCI SSID, the ThinkBook entry cannot be fixed by
> PCI SSID alone. One option is a codec-SSID entry for this machine placed before
> the 0x3842 line, e.g.
> HDA_CODEC_QUIRK(0x17aa, 0x38cd, "Legion 16IRX9H / Y790 VECO DUAL",
> ALC287_FIXUP_TAS2781_I2C),
> I have not compiled or tested a patch, only the model= alias above. I am happy
> to test patches on this hardware.
> Separate observation
> After the workaround, speakers still stopped after some idle time. It went away
> with snd_hda_intel power_save=0 power_save_controller=N and keeping
> i2c-TIAS2781:00 power/control at "on". I applied both at once, so I do not know
> which is required. This looks unrelated to the regression above.
> 
> I'd really appreciate it if the issue is fixed, as I'm now having the
> same problem when the laptop is turned on after being suspended for a
> while, and I haven't been able to solve it.
> Thanks,
> William

