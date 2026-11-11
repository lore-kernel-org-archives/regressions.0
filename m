Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794423111;
	b=pkF0A2rEa7Yi47OpgTE6Q9Ouhgy6xt55XCNFGKUHegAp1ibq3gMmH8fAUtRiZq/CRWkS
	 xEv1GVLcQTzf99PCbsUWoafACOOg3gs4BBPRaFWA2OUbaWyAFbmzHIXsRfJ2SZcs+e5Qv
	 /Q+Zz3KoxhTBzkT0hp4aj8Bei4ypBJZMLiX7wFGiTXVsFn2mxB11DIrpFeC6sGjyjfh4R
	 8Uo6FW2tWtcyDR6WNK5kRiIPSPjJNWdWKH+vKn94tpuaZHU1MeecSij7iJUfbTMj+XuaI
	 nsGpyrC5hCId6Q9/8x00EFA8DIHFn2a+KfpgywjTjKDl3stNelYnDAHqFr33+35LbqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Kxeu0KQoBvmpLRouEZIjBFskam4zbU7LQPE+XYGjDNY=;
	b=wJ4+t435VP5BlMXJZQllvzxlbhsznhHW1pmEKmYmMqiPa9SBsJvietDLO0RE9sQwjcXY
	 et+/Pamo6U0Uay/1KJqXcoR9I6vPcKkM59Y2Uo4At0b/rU4wawsAKT4BMdyq/Eksx00sH
	 4b8RoF6ctI/NZqA8oZ1SGUgSal+KWd5maqdqTFxI7wBZMlnozTijnfOUb7y7ugbzPtdxG
	 55Y2I3n7s+bQjDrVqixqQKgU1KB2TXLcKsZWGfQbAPZWUh6wVylxhwj57IPpa7GwtuGGC
	 12vWgRe6CxKcUDgF+ihDtvsYU9KIaJ+H4DjqI7ErrxQ9NX7Dw0mCDrLKb5A/d3ma1eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZgD6HxTT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09C5606A321
	for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 18:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B09C5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZgD6HxTT
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b0d63f60bcso46629177b3.3
        for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 10:51:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794423110; cv=none;
        d=google.com; s=arc-20260327;
        b=Bi/xGQgbYs0f9Ap60yN4bNX9NUFPP0g7nLgInVSSiQENx1ZPXbcKsySaDwmsrzRSnq
         LoogoLUdMoK3amp25ytG3CNPu7/9S/xg/YFNvbxOI8q2TiV5REQlwCAuVulfZh8NZ0YA
         1ZyEjkcCZ8MTuq6kNl0uED+7iwTOkSfijB5VmgHwzVSMQzd5JGhlmjRBeLIgb7EogJdg
         5j/kjlQO+M+vbjQm9wDUIU92l+PGSUe0ba5kRw57DxbKCYooCqFkSm77C5bgPOYo0ais
         ErNlij+45HAlqgLkIMyLd1+uVVLdPikk8pU1bTz6nQyUTR6g2JMyjd9E+OOSvB9VL6cY
         XR2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Kxeu0KQoBvmpLRouEZIjBFskam4zbU7LQPE+XYGjDNY=;
        fh=5RXE/yznpUOYRHmJGmLKlhruNGFtGL9QatUJpebZ5OI=;
        b=VsAnfA3yxvRLDllbo8FQENPXuEEQrB5Umpo4ZcPtJRVMQUgM6LdfzPN8Fw6bhLY7Mj
         ZgnZCVkwOoRo56NMDGNJWgt7OiGEp/MrHmhi+FnKOGv6YYSGByUzbot2Jj8LFjknA/Y7
         DQRuxhHXssL3aCL7iRDGETIrIOyAC8F8krZHX+ynsz3ei48eRW2pxhOWu5fIaxfd1k14
         gld4k6sA9RNgyjX6a0pDITkqJRzi4dsFIHUzfh1jEv8aDvrapkARqXwdZqsiIO3jtppN
         td/p3TbMj3OO6hqhSrNOCj5hkwAP9lQm03M2HbpwQxTxPBEL8CW3XO7KUei+JbIykOmE
         YH9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423110; x=1795027910; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kxeu0KQoBvmpLRouEZIjBFskam4zbU7LQPE+XYGjDNY=;
        b=ZgD6HxTThfeIAwnnjHGbxR0QiBimRb1NuZ13ePJWrSz6L1xkHq7TvHN8kIk5CeS+oY
         T2ghvat9adUr2PvCUdC1n1blIYk+JFS3Kb8xsLXOMOk0EnsZY7dACP9uPpFkMdZJOAF2
         K+o/B4L2pMYpq9AOQzCiAI2S9pda7YfRj1HxGuc7qXevICa8SHm6w2BLkoRuxgbDH1UU
         Ceiscywgx5JGlBhEO36TyjpGt7Ds/WjsKWlfFhmZ1DMJo3ZAOXQYBnGq4Vcffz/jajqK
         u2HHkl4dfgqEefMJg5Sm2lXXpldFHH5taz+KOVjShimA7rgQs+1eep6owaFASG8b4kQH
         1lpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423110; x=1795027910;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kxeu0KQoBvmpLRouEZIjBFskam4zbU7LQPE+XYGjDNY=;
        b=Q7jNFfqgVsz7XPcvONkU4+ijAGdPViY8DSl7mNLWke/QuaQm2DxSypwExuUCHUXXR5
         VQv6MxhAX/BlsURAeo3hJXWCAJe36z2RUnd1BlJtfdo4sly5iZaiMOR6SXMnQReUIi6Z
         Vv8X4FDUEKiHkXifHOA3YFju5QonsoX/ohn6r4gW7UpXfaASGuAo31mk52n2AEd8r+9V
         69rjY/GMmiP0pMaPmC9gYcFR++1iR8UeOWomBWK7toZ4tK0oSqxaI58I1OTxEZmsOqL5
         3phAE5iJ8o5GN5cTc918VSSfIR9eUBmah28+ME4s1VMGcg6KMPcwxzSE5XLSrZaZAxMo
         JhEA==
X-Forwarded-Encrypted: i=1; AL+hErEUZfn7CudGFHpHzSXVP/uQ4sZI2annt8rkk0Or4hL6jfRvKHgxK7K+wukZPfsCT0igBsd3qvhjiz+ixQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z850ouno+sUVSZfP6F8d4Mt+WE3z5SuK3xaxdy0B1C1baljS/mW
	BkVGgStY/1FIMZzh4OQ+l3q5pcNTXCo4D4z0yGRAulQUa6QGGPdkkut6+siPgSfGR9oFcfYc2oP
	SgAyuMcAiHg/TFE80ynTFkkJgbGtk+Ks=
X-Gm-Gg: AYBFou0NSDvUw4U0MW9MEey06im8GNr+WPNNB15b4rUZGEurCfGUGN28eR42o7cvNeB
	hSotaNvSfRiwVr9UscMMjcx/Yxea9AfRHENjHdXfO8VLm0k+GDVFP8SWOe6PvLEpLS6myVnkG2P
	AxY5ZCpzCAuWad8Z8sLIytbId5k4AYfTQqStH1IGUt6woQPBV8LVjYlbENonntleHdbwA+tYydq
	Pc+vlnrWtSfHMpEFPEoqCXGlqOZq1eOs3PzbhoewY3MWav3vmU46vKhPOntsD6GG5F87iO+2GQ5
	NHDUfTqZO/8ACtROTpcspNiKvEQcmVtnLQRrPznSoRILYeZYnkYLihkuxWHVnwWZZyjcaihUokP
	JQXzKOfB3kZVBQxhWLFu2Fo3RzeO0krWfuLu+gA==
X-Received: by 2002:a05:690e:1385:b0:67c:c1d:e5ff with SMTP id
 956f58d0204a3-67c67a44ec8mr2651052d50.0.1794423109391; Wed, 11 Nov 2026
 10:51:49 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Colin C <ccharm480@gmail.com>
Date: Wed, 11 Nov 2026 12:51:38 -0600
X-Gm-Features: AclHuK_8HGtlGC5_tkNn91ABpmkm4Qnopf5PO5ai9P-hAuAXxuL1IerzjAdosxY
Message-ID: <CAOy1aSioNmBOPjLTsR3q_A8z2qF=7AC13TSvr=mig_XrgbVXKw@mail.gmail.com>
Subject: [REGRESSION] rtw89_8851be: 5 GHz link drops after association and
 re-auth times out on 7.3.0-4 and 7.3.3-1 (7.2.11 works)
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hardware: Realtek RTL8851BE (PCI 0000:04:00.0, 10ec:b851,
rtw89_8851be); Bluetooth
          is the same module (rtl8851bu firmware loaded by btusb)
Distro/kernel: CachyOS (clang build)
  linux-cachyos 7.2.11-1  = GOOD
  linux-cachyos 7.3.0-4   = BAD
  linux-cachyos 7.3.3-1   = BAD (re-tested 2026-11-11)
Firmware: rtw89/rtw8851b_fw-1.bin, version 0.29.41.5 (4bd6ebac) on all
three kernels
linux-firmware-realtek: 1:20261019-1 on all three (firmware is not the variable)
AP: UniFi U6 Extender (Wi-Fi 6, 802.11ax), WPA2 CCMP, 5 GHz ch153/80 MHz,
    several BSSIDs of one SSID, -43 dBm. On 7.2.11 the link ran at
600/540 Mbit/s;
    I did not capture HE vs VHT on the 5 GHz link during the failing boots (the
    2.4 GHz fallback link, a GL.iNet router, negotiates HE-MCS 10 on 7.3.3-1).
Taint: /proc/sys/kernel/tainted = 4096 (O, out-of-tree module: nvidia-open).
    The WLAN problem is independent of the GPU driver as far as I can tell.

Summary
The adapter has worked on every earlier kernel (7.2.x and before).On
7.3.0-4 and again on 7.3.3-1, 5 GHz association is either dropped
shortly
after the 4-way handshake or never gets going again: every authentication
attempt then times out ("send auth (try 3/3)", "authentication with <bssid>
timed out"), across several BSSIDs, until the card falls back to a 2.4 GHz
network. Booting 7.2.11-1 with identical firmware and userspace restores normal
operation (one boot of ~7.7 h on 5 GHz at 600/540 Mbit/s; a single AP-initiated
reason=34 disassoc, reconnected in 4 s).

Failing boots on 7.3.0-4, 2026-10-26:
  07:48:30 wpa_supplicant: Key negotiation completed with ba:8b:a9:d1:28:25
  07:49:04 CTRL-EVENT-DISCONNECTED reason=4 locally_generated=1
  07:49:08-07:50:35 kernel: "authenticate with <bssid>" / "send auth
(try 1/3..3/3)"
                     / "authentication with <bssid> timed out", for three
                     different BSSIDs, repeated; SSID-TEMP-DISABLED CONN_FAILED
  12:28:29 Key negotiation completed; 12:28:50 DISCONNECTED reason=4
locally_generated=1
           then the same auth-timeout loop until ~12:31

Failing boot on 7.3.3-1, 2026-11-11 (boot 12:12):
  12:13:00 associated with ba:8b:a9:d1:28:25 (5 GHz), aid=3
  12:13:07 onwards: auth to 2a:e8:29:52:c6:9c, ba:8b:a9:d1:28:25 and
           9e:05:d6:d1:6d:d4 all time out (3/3 tries each), repeated until the
           card gave up and joined a 2.4 GHz network (GL-MT3000, ch7).
  A manual `nmcli con up` for the 5 GHz SSID later failed with "The Wi-Fi
  network could not be found" although the BSSes are listed at full signal.
No rtw89 error lines appear in dmesg around the drops (only the wlan0 auth
timeouts above).

Caveat on the 7.2.11 baseline: it is not perfectly clean. Over the 10-day
7.2.11 boot (2026-11-01 to 11-11) the journal has 8 wlan0 authentication
timeouts and 36 "rtw89_8851be 0000:04:00.0: timed out to flush queues"
messages (Nov 4-10). Some auth timeouts overlap with a hidden-SSID issue on
my side that I fixed on Nov 9. In all cases on 7.2.11 the link stayed up or
recovered by itself; it never got stuck in the endless auth-timeout loop seen
on 7.3.0-4 and 7.3.3-1. Filtered logs (UFW lines removed) are available for
both boots.

Bluetooth coexistence lead (7.3.3-1, one run each, so not conclusive):
  With Bluetooth blocked (rfkill block bluetooth): `nmcli con up` joined the
  5 GHz BSS ba:8b:a9:d1:28:25 (5765 MHz) on the first try, auth/assoc clean.
  After rfkill unblock, the link was on 2.4 GHz again at the next check (about
  3 minutes later; I did not see when it dropped), and a repeat `nmcli con up`
  for the 5 GHz SSID failed as above.
  The card shares the module with Bluetooth, and an LE keyboard and an LE mouse
  were connected during the failing cases. I am not claiming a cause: the
  Wi-Fi/Bluetooth coexistence code is shared and has been changing (e.g. the
  July 2026 rtw-next coex patches for the 8922D, which are not in 7.3.x), so
  it seemed worth mentioning. The first 7.3.3-1 boot did associate once on
  5 GHz with Bluetooth active, so timing may also matter. A repeat of each
  case (3+) is still to do.

Things tried that did not help on 7.3.0-4:
  - /etc/modprobe.d/rtw89.conf, exact options (still active, and confirmed
    in /sys/module/rtw89_pci/parameters/ on 7.3.3-1, so the 7.3.3-1 failure
    above happened with them set):
      options rtw89_pci disable_aspm_l1=Y disable_aspm_l1ss=Y disable_clkreq=Y
      options rtw89_core disable_ps_mode=Y
  - reloading rtw89 modules (briefly restores 2.4 GHz only)
  - firmware 20261019-1 vs earlier (ruled out: 7.2.11 works with 20261019-1)
Also not the cause: the SSID is no longer hidden and the extender BSSes are
visible at full signal; ch153 worked on 7.2.11.

Package history (pacman.log): linux-cachyos 7.2.11-1 -> 7.3.0-4 on 2026-10-24
23:41; first failure observed the next boot. Updated to 7.3.3-1 on 2026-11-11;
same failure.

Searched lore.kernel.org (all lists) for "8851BE" on 2026-11-11: no report of
this problem. Possibly related, not read in full: "[PATCH] Bluetooth: Add
HCI_QUIRK_NO_SCAN_WHILE_CONNECTED for combo chips" (April 2026). The symbol is
not present in the installed 7.2.11-1 or 7.3.3-1 headers, so it cannot explain
the difference between those two kernels.

Related, not duplicates (found by web search):
  - [regression] rtw89_8852be: silent RX stalls since v7.1; reverting
    bda294ed0ed0 appears to fix it (https://lkml.iu.edu/2607.2/04572.html)
  - RTL8852BE can't connect on high 5Ghz channels
    (https://bugs.launchpad.net/bugs/2059170)

Expected: link stays up on 5 GHz as on 7.2.11.
Not tested: vanilla mainline (CachyOS patches may be a factor); a bisect; a
boot with nvidia-open not loaded (to rule the taint out completely).
Happy to test patches or bisect between v7.2.11 and v7.3.0 if pointed
at a range.
