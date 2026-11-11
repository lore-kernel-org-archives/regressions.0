Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794388022;
	b=2iqOKe2eXv564zq6UW8HSPow6LQI/dZdZ+eTN8P8Wv9CNdaQLrkzoDWoxgeUT8jM4Qz6
	 4jdOqI1s75J0FCIuPrUQBrCQVID2lE+pWulNGh6FzefxnRdB4p2ICPh7tS3WbBxRv/ayW
	 Y/0SOUfXbYod7eniqJnokr6XQhuDheRi47lF3wVMG6MkBtbCeIJ3k06PlcSPN/OIGC1OY
	 6C68glquxpFMoWkBpu4YUIp2X//qI30iWw137lKXAiz/9JkmN8ewk+QczSGcy71wRfze4
	 mYZYbVJ7ZuAEnB0Pk139tIAOEZ/thZkT5cQeYiyd3AWX8PnvMKw2q8WCIlojAJszy+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=V+S16jvVJ/4V/Nfo9ZvQwnf9kBmWGykNbIHNb3xxxYE=;
	b=3G8X/vg/8IBFQ5X6R2VLmg07fMAx+q9DGfvQmENtzkWc71JeVlshsfmAj8Xrt4U5gXDU
	 BknvNRZU2ldRBG3FQTZS6uGMjZIZPFbKXI64ZB0wfa0j284/tWMZzlhb5mwgMl/lFiIob
	 rXuC/IZgdIq69G5RikKLLTZHP6B0zVaSpcA4wO0bIMTw1P8mQKtu/jDm/tizpMdHHCoFC
	 LHxpYUXMwYl3JPCIydgKR4mNKLBknZWuoAjhInVUeXeNT0vHWtvE6UBoHrXNP01Xix/y3
	 zL/jK+Td+l+15gKLZGAF11GxTvfexlIsGH4PFpBGz/AfkQ6J1gTwmRF0zRw5TXaachg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=CpHnNhvb;
	arc=none smtp.remote-ip=188.68.63.174
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E868606A331
	for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 09:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E868606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=CpHnNhvb
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4jPd1v306Vz8qr3;
	Wed, 11 Nov 2026 09:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1794388019;
	bh=/kbCvdOJ7QCib0T9Mf7mnkxk/okPSpYuI282WIwHn+Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CpHnNhvbzWGLvGdFMiV1oE7K/oASCqJrT/SHEw2VEDJo94ZdqF/3nav/Ihx/fu3GT
	 sHkiJ0xEmgX6A8O6wJ3RDwHDiAIlV/s5qfm5GURaqFxLQ8CAm9coi+/A44WxVoHScr
	 OkPXGZgAKQrnCeFQQr9OtBLeBpKsHq6zGyH+GOJOMWhku+hPI2MRdvUneKUSqD7wjH
	 oGVod+POD933opxN2pkCu4R3ji39KALjG+Oi3/YKhVrv++UmseEQ7vtWgU6Rikh4ET
	 4zJY32A3X/2yeqzOYVt2ALYm/0ZTE01sVclmmiQLfG4+F0GWREvP5Jsg58rvYNDH+s
	 p44Oox/5RcppA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4jPd1v21Pbz8fvQ;
	Wed, 11 Nov 2026 09:06:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jPd1s15N4z8v5H;
	Wed, 11 Nov 2026 10:06:56 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 9D22E5F9C5;
	Wed, 11 Nov 2026 10:06:18 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <eb52777b-8607-427b-a709-cf1ab76ef672@leemhuis.info>
Date: Wed, 11 Nov 2026 10:06:18 +0100
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
Subject: Re: [REGRESSION] rtsx_usb_sdmmc: RTS5129 (0bda:0129) no longer
 detects SD card
To: Philipp <pjjonas@web.de>, linux-mmc@vger.kernel.org
Cc: regressions@lists.linux.dev, ulf.hansson@linaro.org
References: <523eb7d1cc0811df4a5e4c534538f3dd@web.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <523eb7d1cc0811df4a5e4c534538f3dd@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179438797893.651191.2239725785049408778@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 9D22E5F9C5
X-NC-CID: OyAd3oB1dPEk2svXE75+9uKgLyuDtW+DPjOTYIBvlgcyR17OLmM=

On 11/8/26 19:51, Philipp wrote:
> 
> the SD card in the internal Realtek RTS5129 USB card reader
> (0bda:0129) of my Lenovo V110-15IKB is no longer detected.
> 
> Works:  6.12.116, 7.2.x
> Broken: 6.18.x, 7.3.3
> 
> On broken kernels rtsx_usb and rtsx_usb_sdmmc load and the platform
> devices rtsx_usb_sdmmc.0.auto / rtsx_usb_ms.1.auto exist, but no
> mmc host/card appears (no mmc0, no mmcblk0) and there are no errors
> in dmesg. Reloading rtsx_usb / rtsx_usb_sdmmc, re-inserting the card
> and disabling USB autosuspend (power/control=on) do not help.
> 
> Since 7.2.x worked but 6.18.x does not, I suspect a change that was
> backported to stable.

Might, but might not -- and I wonder if you have two bugs, some race, or
if some .config setting is disturbing something. Overall this situations
is somewhat puzzling. The best way to bring some light into this is afaics:

Check if 7.2 is working; if it is, bisect between that and 7.3.3; of
not, bisect between 7.2 and 7.2.x to find what fixes things. And ensure
to use the same .config as a base during the bisection, as explained here:
https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html

dmesg outputs from a working and a not-that-different version that is
broken (say 7.2 and 7.3.3) would be helpful, too.

Ciao, Thorsten
