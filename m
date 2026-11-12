Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794445891;
	b=U23UomAGmegcsuc0l/ocjvgGdG35XGThX21l0crF+Fy252x917uf1NHYYp2q7ZPruvLF
	 mBbMYISMcdPEj8qZUP5iB8ejsX3+nZHXKEA5Xu7KcrXFXFzu6Zz31Vwa9HMgfvyjGydex
	 +zafRzDgLF1MIbnfYvtGAf5ARmTcOP+Zpjp5ip0V/tFXnNHmCc81DdVEpcq161KGcB46E
	 5FWBJVHcu05RWPybBTglNzJ0Y17PZdTWEo9iywL6iQ7Xzgp3PzHhVJJkhex1Jy3culBWn
	 NmV0B8KAMnh61YlmBe4UVDw8gHVodbZyHTtA0oQ17w9LfTx44+Gdn9o2D5P8xPv2Iag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=xvLH80QhcDE1RiaDk2FJzwKTRJlmrkikJoyyX/2FYOM=;
	b=tOKX2B43W06ptJgY8DPXA1DZ1TLxskQO0c2x8hSYifzOjJoRzWpTWjLUDgubbfPHU5mU
	 OULseZuoSrgY0xCov2zopb6KAKmlsQgAxP4MuOEZ0MeXlDczC15HYRtINbymn4VHTJ15X
	 lYxX4rMFoWUPf1OpctQnEgCHitVccS03WjRZEvazFQbPuFi/o2YyE9MJj86elYP42taw+
	 adFWxLSgRGWSDzx0NZJyKAaMZ475jOcDZ9U0sStd/Gk9B1E87t3J5TcmXC9GaomKZ9qaK
	 298JYTk3EAfbgrn0N/RHVFVIKaEzV3tjZTCRM050OHMcIHXKp8gUxuVP7h5dUfYwpGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D1XE2yMl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7F4606A8A4
	for <regressions@lists.linux.dev>; Thu, 12 Nov 2026 01:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA7F4606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D1XE2yMl
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5364648ae07so32933021cf.1
        for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 17:11:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794445890; cv=none;
        d=google.com; s=arc-20260327;
        b=m35rGhVuROYTUc1O0hHcOxKz/socnvBhb64V9h9kJ/LAlsFxvlqbY2vOZowyImON9u
         2SihlLmburWESCf1rcnraE06KJnppnL5nw1n2iKgsptPrnYzQ7L5J1p3xINvCtzmHXqZ
         TMl10/YotZoHvzzxGDpZ7lnApB0UcJNc4upvjKW5wzVoguWu6odj1ox8TK3lybQWyk6d
         RHrB5EWbrBby/fX+RPi+W73xtggk6Rhw4De7peQY2bD+TAGCXEiFR5GQYFslUDG0WAtF
         kqJ1VtO5REXdRPL2PnialyaWLk/F8LbIl/3cgBK6OrF8hfaAV82i0ABRHSlHa/kXUoF8
         HLbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xvLH80QhcDE1RiaDk2FJzwKTRJlmrkikJoyyX/2FYOM=;
        fh=pUcKyDrfAzGM3eo5MOpUHdxAhE2LQaY4JbPGns7cjes=;
        b=UYkt22z5ABVyOp7OWOU9WPuEFgtq0BFTrSup0YlhxR6Ut7k6O72mFeokNbb0Y7XuPN
         uQzIEGVs8B0lHLH3m+bLVgealZaP3MXa4anHD5OARMiJJuJdwimXSfUjdjjz+q46kPSt
         sP3s2gDl4+jiyTLfHWxXyJKQcHoHH+XNNVnIbE2H69JUdxcxl+hBzrXMxHWdmbhBPXQm
         EB5E+6wZng6cvKon7bFkmLSqkARzV4TwvJicTdFNZeSynXsS4O3bIMrA8AIxEbt6ZFbm
         4xvqob/cOyVhPs84m/qMbFNNto61OEf9Ija2x3pJFkR+Ueu/sBg1eYoh2//3o1jeBtEl
         GdXg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794445890; x=1795050690; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvLH80QhcDE1RiaDk2FJzwKTRJlmrkikJoyyX/2FYOM=;
        b=D1XE2yMlW8y/kwuiv9V7+z62TiaV5o0p2UC41oYCUIe/ne9kjQdrxO+airSHmd08RX
         lo5qF/73ylolx4SuSb9EmiX334C4w0tHmgMKIkiztXJ2+utrvvd22oals6LSHHSREZDc
         ozeJFw7sgexYAZLlA6pRqlRb5Z3PKwMgckZVywnfQRdy5Zq2J1Xs1xdKLOwXvOt5J9KG
         Vf7kNwtXK/1XxtJOBdvv/PM2FIngmKVP/Ll9xKCN7LbcF3t6G1u5onUFFCCsNQ6CHFCI
         vPNWovRJUvHjNE52enB12RT7ySHLmM7Kw9W68Pw/ejTHnr47327WDDQsXq3WCNVyONBN
         piGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794445890; x=1795050690;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xvLH80QhcDE1RiaDk2FJzwKTRJlmrkikJoyyX/2FYOM=;
        b=mpnwNrR1kmPjrG04FX/29ZGWfJClx9quHEiyVHzbMVXO94+TFykmj7Vtum5rNvJGRL
         +XxWSgevycK6ayQnIllT9X+NXGrsuuLpau39KbpAXkAR2CWRYdHG4GsMmsxsjN4Sca8Z
         F07ddIZNflvl8+ygGO7u+6dbn1MG21F0AjUxdYWbRbGkn6x3A5xkubj1GILWyfOd3V2y
         /1UmHFKcGTqRX5o504sLjIuk4Frx6pydQtqX3DcxCE+oYOe4FiOdHS3DfJyZAYw3DYu5
         wL3TfFovR/D4VodE2Or2phaTfdaFMVxVqZrp8fap5m7rzkqISTrIvy/J7iW0AGgp5wyW
         ocKg==
X-Forwarded-Encrypted: i=1; AL+hErHCXSj5XsQvC4qLkx0i7QQug6qrCxt2OKPsAFdWIyZ3wSgsc3+ZfQIC2loKCvByreq0MwTL0xhp5PVxjQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9GDKOLw0JL+4DgftsaTpNt5Y88FzaVvdkTBgJhzNkCKPIlipU1
	Flw3lxaywXjLgxZk3mNTYn3G8YzPIS5/G8C6nodnq+yT0TVl5Y1bW+Lu2jUKbRl0g31XtEkjzDA
	4hE+fbte4PTakahGJmFolQ8a83qQOmH1Iq1r302HxUQ==
X-Gm-Gg: AYBFou1UZzPeA1Fi8vjgQ+qAlUB0YQXmO6ibvyDhleJlCcPcUi3he6yGJQe0d3I8YxV
	s7tLhfK5++w5JDYqeCSmSQFiw8tY5iqwGEtg9STfZw4tU4Fglw6dnPp9szYYMaZ2T1pioLcAk8D
	rz42ejQbeCSebLo+UCE631zjwO3/rSKvjJ+BNe30eM0dNiKyzFB2/8e1p8VhuvA1dlUvIWhvJem
	5X1CLGMzvVDoe/uAaHye123y+aWUA1OaC2Rl54IJjzkU7E2bLTSV2KJATvm5rNbx/5uta5VOBkw
	y6oxE/u0HW8NsemLViUwnZR9+CPbigYzpeHUciopAW0fIz8PfsTb/zMEixh2agDTTVypySgyOqY
	oY0n+9AxX1zOjKVHA00UixK2N92mcnGaNNJ3ZSgt1LSRAGAf5T60TcnE=
X-Received: by 2002:a05:622a:5446:b0:532:c181:8fe9 with SMTP id
 d75a77b69052e-556bd8fc8eamr66026521cf.9.1794445889503; Wed, 11 Nov 2026
 17:11:29 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: William MacKinnon <wh6cyy@gmail.com>
Date: Wed, 11 Nov 2026 20:11:19 -0500
X-Gm-Features: AclHuK92XBLs4pggJAPY-YHfAP27q3cqUycenuZdKtnP92jH0Ag3F1p0XKU6R4g
Message-ID: <CABWzDro3C8e5+7ajDRJ+iabbkROHLYSbWEKUpJ_t1ZT6DdTSuw@mail.gmail.com>
Subject: [REGRESSION] ALSA: hda/cs420x: MacBookPro11,3 internal speaker
 half-disabled by 8086:7270 quirk (82cfab6a5262)
To: Takashi Iwai <tiwai@suse.com>
Cc: Jonne Vuorela <jonne.vuorela@proton.me>, linux-sound@vger.kernel.org, 
	regressions@lists.linux.dev, Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"

Hi,

Since v7.3, the internal speakers on a MacBookPro11,3 (CS4208) sound quiet
and thin, with no bass. Headphones are fine. Bisected by inspection to:

  82cfab6a5262 ("ALSA: hda/cs420x: Add CS4208 fixup for MacBookAir 7,2")

#regzbot introduced: 82cfab6a5262

That commit maps PCI SSID 8086:7270 to CS4208_MAC_AUTO and, in
cs4208_mac_fixup_tbl, to CS4208_MBA6. 8086:7270 is a generic Intel
subsystem ID, not unique to the MacBookAir 7,2. This MacBookPro11,3 reports
the same PCI SSID on its HDA controller, so it now gets mba6_pincfgs:

  DMI:     MacBookPro11,3 (board Mac-2BD1B31983FE1663, firmware 478.0.0.0.0)
  00:1b.0  Intel 8 Series HDA [8086:8c20], Subsystem [8086:7270]
  Codec:   CS4208, vendor 0x10134208, subsystem 0x106b5e00, rev 0x100300

v7.2.15 (correct):
  CS4208: picked fixup  for codec SSID 106b:0000
  CS4208: picked fixup  for codec SSID 106b:5e00
  autoconfig for CS4208: line_outs=2 (0x12/0x13/0x0/0x0/0x0) type:speaker
  (plus Mic=0x18, Internal Mic=0x1c, dig-out=0x21)

v7.3.3 (Fedora 7.3.3-200.fc44):
  CS4208: picked fixup  for PCI SSID 8086:7270
  CS4208: picked fixup  for PCI SSID 8086:7270
  autoconfig for CS4208: line_outs=1 (0x12/0x0/0x0/0x0/0x0) type:speaker
  (only Internal Mic=0x1c; no 0x18, no dig-out)

On this machine the speaker uses two pins (0x12 + 0x13, assoc 1, seq 0/2).
The MBA6 table sets 0x13 to 0x500000f0, so half of the speaker path
(including the bass) is never driven. It also disables the external mic
jack and SPDIF:

  pin   init (BIOS)   driver (MBA6)
  0x13  0x90100112    0x500000f0
  0x18  0x00ab9040    0x43ab9030
  0x21  0x004be030    0x430000f0
  (0x10, 0x12 and 0x1c also differ; full tables below)

Forcing model=106b:5e00 or model=mbp11 via hwC0D0/modelname + reconfig did
not help: the Mac sub-table lookup still ends at PCI SSID 8086:7270.

Workaround confirmed: restoring the BIOS pins as user pin configs (HDA patch
file [pincfg] = init_pin_configs) brings back line_outs=2 and the speaker
sounds normal again.

Matching the MacBookAir 7,2 by something unique to it would avoid catching
other Macs that share 8086:7270. That could be its codec SSID (if it isn't
0x106b5e00), its DMI product name, or a check that only falls back to the PCI
SSID when the codec SSID is not an Apple one. This MBP's codec SSID
(106b:5e00) is Apple's, and before this commit it was matched by that.
Jonne, could you share the codec subsystem ID of the MacBookAir 7,2
(cat /sys/class/sound/hwC0D0/subsystem_id)?

I can test patches on the MacBookPro11,3.

Full pin configs on v7.3.3:

init_pin_configs     driver_pin_configs
0x10 0x002b4020      0x10 0x032120f0
0x11 0x400000f0      0x11 0x500000f0
0x12 0x90100110      0x12 0x90100010
0x13 0x90100112      0x13 0x500000f0
0x14 0x400000f0      0x14 0x500000f0
0x15 0x400000f0      0x15 0x770000f0
0x16 0x400000f0      0x16 0x770000f0
0x17 0x400000f0      0x17 0x430000f0
0x18 0x00ab9040      0x18 0x43ab9030
0x19 0x400000f0      0x19 0x770000f0
0x1a 0x400000f0      0x1a 0x770000f0
0x1b 0x400000f0      0x1b 0x770000f0
0x1c 0x90a60100      0x1c 0x90a00090
0x1d 0x400000f0      0x1d 0x500000f0
0x1e 0x400000f0      0x1e 0x500000f0
0x1f 0x400000f0      0x1f 0x500000f0
0x20 0x400000f0      0x20 0x500000f0
0x21 0x004be030      0x21 0x430000f0
0x22 0x400000f0      0x22 0x430000f0

Thanks,
Will MacKinnon
