Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA9D3B05BC
	for <regressions@lists.linux.dev>; Tue,  6 Oct 2026 11:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287133; cv=pass; b=N4E/wMPnHFsK5KWMqUDDFWDY9MM71VV2E33rIpRS0byz5JO6TzdGMp+RlJwFaUmhvwrqbzxbQlfQtBnnzsjs3pmWaO2d27WAc1L6qVF33yJO2lNLgaHrArm1UZxDezZEc0h2Wfqkl0vPoDAfOFptGnDlmHPtLGQb184V986k/LU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287133; c=relaxed/simple;
	bh=KWIm9uSpGoSIN+R3P1gUQ+9JvIW++8a5LwJI2335PJg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Wt7AXFuwY47zmUtIOnGQj5pv/zK605l347XqqFjI1u8Ngwtw0tWIecv7dCEvo/o48QGenaFgn4BXXtMaC858ppfhutRoGuxjmn7bUxxKRPEHxmED2eHIum4dVY8+eQapPBB8Xd/ID9jmh3TlL1WoCUapE4XAaBsA6dip+GrUDGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz; spf=pass smtp.mailfrom=sairon.cz; dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b=aHr0jxph; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sairon.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b="aHr0jxph"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2dd76b1361dso18244615ad.1
        for <regressions@lists.linux.dev>; Tue, 06 Oct 2026 04:45:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791287129; cv=none;
        d=google.com; s=arc-20260327;
        b=r5PHZvywy/sbv5HJMx3ReJ7za6G7Mjc91vLZX2XN2ygCuq8t2VmP4paHRMUOZoa8Xe
         yum0B+/CXXV1wsxwmrLMG1MlUITsmpEC+keI/yUtMc6M5eqWtfWuGtQzIZa4BZxNaTMa
         pP6mAVNxHuM3bfyjAhdwPFWgE5YDjkWccAqVJOmT5i/EOfSDx7HAemANrD+Xdb73pKbB
         DVlrxWAFz9PoOb6zFlJDkSSUU77bvox0g1PY35/yzf6uVzWqOmHSXy7c20QuvLp7KfuK
         cTaCODP4DfBJvZimrxPCp+mr+Sc/gz8hD07pjcaY/n3DyiwZfNY0s9taEdkoUdWv11m9
         B+7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=KWIm9uSpGoSIN+R3P1gUQ+9JvIW++8a5LwJI2335PJg=;
        fh=+G32YXrAfn+2cyoyqyqU3K+6HYlnBN2pVIMkoyq3/Xg=;
        b=IYZQs86nQ+qRHdiw9iLiqCGalu+BEvTXiBMK/uYVtUM1mddC3AfOS2cHHnAbH+uQHL
         JgzgL3GbvF/PgeAOOR95m2Qdbl7rw8Y9cU+spcGxn5rCWJB4JUjFMFCRzhgZYHyV/Jc0
         m4kfhsak+Aj/OM8vSwZ2tWzbpTXKDPtIriI2OcR9Uc/4ZE3V5pXSSz8OmUjFXhvXeLpz
         geqr6HSC6vjZE2Ibr7VkVejTUO1B7v8ZCVqKX+tDPm1qPikW5ze3lTmMwfnhj4Vojvp1
         /y2hGR50iB8tKEWdGg1EUFvrTcZT2NQcOhlXm80p2JtB0ycLifQFUh4NWrJv6n53t3pc
         LaKA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sairon.cz; s=google; t=1791287129; x=1791891929; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KWIm9uSpGoSIN+R3P1gUQ+9JvIW++8a5LwJI2335PJg=;
        b=aHr0jxphhIrQIvMz+B+kBWmwg6rkGx1rQCypayP9gv/RD3ykENQJXZAjKEsyCLVj3i
         LkH2aPd2grXrePBEKzjof6sw8b1WpMUupSxvRrZKqdMw8En44Qf3v7wEcSo74DJyPOSl
         TjoOqnTB4tGP07tOFH7aKTBNZue8m0Lit7Jdds7D2hCGEV6GdSfSnQ60re09Z6jYkZxr
         XhjCoyzDqLJu90sEPvMmJsBUs0Qvg2y4QyX+TEaU5a/egxQToEHAxp97ye/Xo0ZYonT3
         YNU7jUZK7kzj3HqSxIzef5jcYOX7HX8mfyTZ2/gqYTwi11j5pUOBd0it9K0xVkq1gPPH
         yzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791287129; x=1791891929;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KWIm9uSpGoSIN+R3P1gUQ+9JvIW++8a5LwJI2335PJg=;
        b=n0MyKJPtSbgiE5+bvV5tXV9MMOGSsM3DqXG7iHNkS+XDG2K1dZiB85AZl8CRKMU+7m
         +SIh67bqQWcASHu1FIXKBfeDz+pJ9ER0ZNZ+HXJntgQKoiXQkoFrcsqKEBJX9Sq5/yZS
         qCdg8Ww/Qb4dkz2rr+f0w5CZPIDKN4FG82fgtn/Dm0F8LkSj9C0RjCRvu6MlO1vgdR3/
         2viemExf4ZXMNMgl7oYmk01PGRL7MEdIjGDniUFflahdFr+AFJoAjUY0EZMqWlKaY6ph
         dZCNiaaHAHRLrT18LCB/aRMmH3G42Bu5O8maDbE7l1OpH+qIOQEMe5Wl24RnkjKj0OK2
         Hziw==
X-Forwarded-Encrypted: i=1; AKwUvByZ3FLlx4VQ9mbsIpBhq871qfW4rboY4KdSLorLe33tLvBD2/km2SAoOGrUs4KQdQd+228Rqas8tI7iAw==@lists.linux.dev
X-Gm-Message-State: AFq9FYI38oLMPujPUlqQGUQgRTQzoQRoIcJEfHTFsMVAmWdFsSdlJfSg
	MRJx7JCApfxxdzelTRdvtYTfvEfTA8EA2gPYFDqFowdBErrl173i714PNsWg5+LSyvpoH14r7f7
	rcZXFJwZ0t57a9FsQy6lJJuiXxqzmJqoa3apLHmgxmQ==
X-Gm-Gg: AYBFou09Qb/M+Getlcr2iXvSBm+SUckBTgPbqnO8+oyz/fOYCdb8iTY44ax6w1VT3+S
	F4Di0EN9DtJJsprwOimdeQoc1ogaNvtvr2wwUhV3mRRM6LVO8BXwLHeGIaMVfhMaXmmCbkSRcGI
	OqQyKU5Fl/fhcnIrhJnk//J7BcXO06GAv0mdrSD6KftfTFStXNJlPixPwKtx72/8Vl5rc8Kv/NJ
	MLWstwY9vZYXyJn9eW44ya/nxeLgdtcxh4pHIn/OncRohBJzPwkzRMUtmH7NIZkjot2lQL7WXr6
	uRT6Xj54fagrXqJJrCoLnsRiFjIqtV5pnuWKM+xBDK6uU2efOazVWxi8wZ0oMLGU+zBvQMrM/G4
	OfLxiEfohmuSNJSBTGBoenVaz3b8EQ4Sz9jwFfUdOw9GMxbna8JrrSipHEHenHPFm32KU4C88jb
	np
X-Received: by 2002:a17:902:e945:b0:2dd:c100:4258 with SMTP id
 d9443c01a7336-2e510587a58mr90345025ad.60.1791287129271; Tue, 06 Oct 2026
 04:45:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
Date: Tue, 6 Oct 2026 13:45:03 +0200
X-Gm-Features: AclHuK8SA5n7vXONC0JbjGkzdM0ZYOjGctZLd1mE8yax76JeSneiCv7T5coxQOA
Message-ID: <CAPa5EdCj3v17tB-SF2JNecq5Q8s1Pranr-XzAFWNpNTBPgPG7w@mail.gmail.com>
Subject: [REGRESSION][BISECTED] r8169: TX stall with checksum offload on VLAN
 frames with inline tag (REORDER_HDR off) since 1517d1996b52
To: Eric Dumazet <edumazet@google.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	nic_swsd@realtek.com, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

the Home Assistant OS recently shipped kernel update from 6.18.39 to
6.18.52 which was followed by a bunch of community reports about fatal
network breakages [1] which had one thing in common - r8169 driver and
configured VLANs. This manifested as network stall early in the setup
of the system with dmesg events like this:

> r8169 0000:03:00.0 enp3s0: NETDEV WATCHDOG: CPU: 7: transmit queue 0 timed out 6125 ms
> r8169 0000:03:00.0 enp3s0: rtl_rxtx_empty_cond == 0 (loop: 42, delay: 100).

As there was no change in the r8169 driver itself, I focused on the
vlan subsystem, where AI pointed me shortly to this suspect commit in
the range: 1517d1996b5236fe69eccd9d253f725e06996eb1 ("vlan: fix
skb_under_panic and races when toggling HW VLAN offload"), added in
6.18.51. I'm not referring to the mainline counterpart below for
regzbot (447cbe95ebb9) as I can't confirm whether it triggers the bug
there as well. FWIW there was another issue [2] with a similar
combination recently in the regressions ML but that one seems
unrelated, as disabling EEE fixed that issue, and it doesn't fix it
here.

I don't have the hardware myself, I asked for testing with this commit
reverted, which confirmed that this change indeed started to cause
trouble. However, it's obvious that the change itself is not bad, as
it fixes another issue and the regression is scoped to very specific
hardware/setup combo.

Besides the revert, following workarounds were reported to fix the
issue as well:
- Disabling TX checksum offload with `ethtool.feature-tx off` in
NetworkManager for the connection (HAOS doesn't have ethtool binary,
hence this option instead of direct ethtool command)
- Enabling REORDER_HDR with `ip link set enp1s0.100 type vlan reorder_hdr on`

Clearly, this needs rather esoteric setup to trigger the bug - I guess
most systems set the REORDER_HDR flag by default, however, due to some
legacy in the DBus interface that HAOS stack uses to configure the
network [3], it was disabled. Anyway, I think that disabling it should
not lead to driver breakage as we're seeing.

So far it appears that this only affects RTL8168h/8111h, XID 541 -
there isn't any report of another chip/XID combination yet.
Unfortunately, as I said above, I don't have the hardware available
for testing but I believe I'll find some community members who'll be
willing to test a proposed fix for the issue if needed.

[1] https://github.com/home-assistant/operating-system/issues/5019
[2] https://lore.kernel.org/regressions/353419280.954808.1790290283530@mail.yahoo.com/
[3] https://github.com/home-assistant/supervisor/issues/7248

#regzbot introduced: 1517d1996b5236fe69eccd9d253f725e06996eb1
#regzbot link: https://github.com/home-assistant/operating-system/issues/5019

Cheers,
Jan
