Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893932;
	b=XsNamOf/P6NGuK/lSZUME5eR+fFTKH72ZvpSZ/hYGNEoQWopKYANOwAm19Lu+SnH+sc9
	 uUJq7UxucXhslg1AKi4Gn/+1txvWv/jMSdlByB9hc2JdWABeYBORWFkLoBsc6wXIzNhxW
	 7B3M+VPkPxfkctDUXx++xumhYd+ZzdyzroLYgS/NHwsskfTWW8EUqbgU32nKidRMhiSu8
	 XEg3W4dbbplZU7ylQ4ZnXvqj3FxOn8DqTNxAQieW8kyhoQiVfg6kPt4GbwMOOv0cJGmRI
	 zzN3rrZo324Obv4sc9O09Ugorg7tuF8Ib0VdxfUJSHLyVXSK3PusBtpLePqbl6SqxRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893932;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=TUQcClPI7vNCOz94yatdti54zFRw1+hNyJbi7mrM6A4=;
	b=ezZbXxk6RBI2vD7QQY8Qw5OeVCHy5XgBnb1fosBMbFCodhUP89tRgjOknHNtO/19C3P+
	 vRlcOuICX+irYO77OyKrwtX1CSQt3X1eCc3W7U1feKgNsu3K56xPzaLrMuLxagLk/vT6t
	 cVL8K8ePZjihgohjAd9GvZjUFqAyiXxI4PNXE+4NW/O09w1F8cGYaMFSIaraXMRIEgRRT
	 BoqA3h7kE7CeUYpX56tXbtDWQ4nj3T9+A0NV9zsK2y6ryrnCV+lYSf+76pckgWWJAuiTW
	 SODZfrkiZQG25Fa1LAuTgcIOPwJBa+KdLBF+S/hcniBF1DBQQIHAUHpErI4nnzBvRbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b="fB0PL/4d";
	arc=none smtp.remote-ip=188.68.63.98
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0868A606A333
	for <regressions@lists.linux.dev>; Thu,  5 Nov 2026 15:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0868A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=fB0PL/4d
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jL6J23Nxxz6YSd;
	Thu,  5 Nov 2026 16:52:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793893922;
	bh=kheHXymN8hP5CCxtHtz32PhpI9/kZxAXJ7JMIdcD7zI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fB0PL/4doNJqL322sTR03Zlnv2F/3DMCShIRRtfXN40m+AO1rurgvGbsTCOzqhiSW
	 r3WX/eBSrv2VzgJCrhwVorgYAL8/diDgaQa6U0LU2DhXTNTzVfjMzQz9ztXqfEEtl6
	 ++sJ1O223ceKCTbRt+mZAh+eTeNqS0H+jP38V49cWA/p5YS7ML6DX50WRIn40OADwg
	 AqrKMiqbVjv8KU5L6lLcZUVELOljqaFglDWNBV0M1G6xLNsbhxThUcsr5NkAtM98Tq
	 tycRR8EO8oBx8G2ttr/POPSPLrz2ZU+iwBJa+Tt8r3OCag3kRPVyhZ5bvH0OtWl5Wm
	 iB+tAVxd48AEA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jL6J22fhyz4xc6;
	Thu,  5 Nov 2026 16:52:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jL6J11JmTz8tkQ;
	Thu,  5 Nov 2026 16:52:01 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A9A375FA54;
	Thu,  5 Nov 2026 16:51:51 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <79bc006d-1c60-419b-a6f1-c4c4ce329168@leemhuis.info>
Date: Thu, 5 Nov 2026 16:51:50 +0100
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
Subject: Re: [REGRESSION] rt721-sdca: PCM open fails with -ENODATA on 7.3 (AMD
 ACP SoundWire, ASUS ProArt PX13)
To: Krzysztof Wasiucionek <kwasiek@gmail.com>, oder_chiou@realtek.com,
 Vijendar.Mukunda@amd.com
Cc: broonie@kernel.org, linux-sound@vger.kernel.org,
 regressions@lists.linux.dev
References: 
 <CAMODhBLTBPb5DG_kfjsF2Pj_8F+KFmG6N4vd=8MJM6n07nCC9A@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CAMODhBLTBPb5DG_kfjsF2Pj_8F+KFmG6N4vd=8MJM6n07nCC9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179389391204.3067274.2964442021918174871@mxe9fb.netcup.net>
X-NC-CID: 6V1O+4+Bia4ft1/KZobX+OW+hak4xtl0LNFbvTD858h1/QP/gJ4=

On 11/5/26 16:17, Krzysztof Wasiucionek wrote:
> 
> after updating from 7.2 to the 7.3 series, the rt721-sdca jack codec on
> my laptop can no longer be opened at all. Speakers (TAS2783 on the same
> link) keep working at the ALSA level, but userspace loses the UCM HiFi
> profile because of the rt721 failure.

Not my area of expertise, but is this maybe the same problem that is
discussed here:
https://lore.kernel.org/all/8a12a2d9-1b56-4e00-8ccc-cf31325f8366@crazyrussian.pro/
See also the other two msgs linked near the bottom.

A fix for that is here:
https://lore.kernel.org/all/20261027-rt721fix-v1-1-42cd4b1711d2@realtek.com/

Ciao, Thorsten
> Hardware
> --------
> Machine : ASUS ProArt PX13 HN7306EAC (Ryzen AI Max, "Strix Halo")
> Card : 1 [amdsoundwire]: amd-soundwire
> ASUSTeKCOMPUTERINC.-ProArtPX13HN7306EAC-1.0-HN7306EAC
> Link 1 : rt721-sdca (sdw:0:1:025d:0721:01)
> 2x TAS2783 (sdw:0:1:0102:0000:01:8 / :01:b)
> 
> Kernels (CachyOS builds)
> ------------------------
> Good: 7.2.7 - UCM HiFi profile available, jack and speakers work,
> no rt721 errors
> Bad : 7.3.1 - see below (7.3.0 was installed in between, not tested
> separately)
> 
> Symptoms on 7.3.1
> -----------------
> From boot, every open of the rt721 PCMs (hw:1,0 SimpleJack playback,
> hw:1,1 SimpleJack capture) fails:
> 
> rt721-sdca sdw:0:1:025d:0721:01: ASoC error (-61): at
> snd_soc_pcm_component_pm_runtime_get() on sdw:0:1:025d:0721:01
> SDW1-PIN0-PLAYBACK-SimpleJack: ASoC error (-61): at __soc_pcm_open()
> on SDW1-PIN0-PLAYBACK-SimpleJack
> 
> $ speaker-test -D hw:1,0 -c 2 -r 48000 -F S16_LE -t wav -l 1
> Playback open error: -61,No data available
> 
> The peripheral is enumerated and attached:
> 
> /sys/bus/soundwire/devices/sdw:0:1:025d:0721:01/status Attached
> /sys/bus/soundwire/devices/sdw:0:1:025d:0721:01/device_number 3
> /sys/bus/soundwire/devices/sdw:0:1:025d:0721:01/power/runtime_status suspended
> 
> Writing "on" to power/control does not help; open still returns -61.
> 
> TAS2783 playback on hw:1,2 works on 7.3.1 (speaker-test plays both
> channels).
> 
> Userspace impact: PipeWire 1.6.10 / ACP rejects the whole UCM HiFi verb
> ("Profile 'HiFi' mapping 'HiFi: Headphones: sink': output PCM open
> failed"), leaving only the pro-audio profile, so the internal speakers
> are not usable in a normal desktop setup. Same userspace on 7.2.7
> gives a working HiFi profile.
> 
> I can test patches or provide full dmesg / additional debug output.
> 
> #regzbot introduced: v7.2..v7.3
> 
> Thanks,
> Krzysztof Wasiucionek

