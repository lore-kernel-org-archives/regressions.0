Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794427639;
	b=2n+iPnHFstfGU2fQFYWzJICBfyO0voPT9tt9KtTppc8U0BtYyLjioZ+b+z8beufZYlj0
	 NDUVxOr4S3KAbkiHFI1/YVc0rnRbWGQc4+k2/GGSMTStm8GSBEC100LKItRI5CZNY9Azn
	 9fOJCh0E0x/jug68d1ypR2eSaOx9XNyUjFzv17hMejjZ4zx2kEgOj/30V1QIGIKwvdoTE
	 PuzH9LwQFQDkV+/xpEMToqPziGjTDc/THmaepbHiFO408qFdKxEYy+uFvBADlzJ4eloM4
	 Ssv8xVwOoB9iCx7mka6I+BSqQ2VOwwDxt8twDqOHIyYh+L24yFN4qiO9cVYOiewiD9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794427639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sVQ0Je+7TVtBihMq71F3r/qets7jTV4f1jmnI7R96Eo=;
	b=IZKNU3Xb2Cdx4hHYq6/qmlpetCJZzEqlwMmDh00LUAmCzAoUW7NJG5ef6cMQD8nxUBuv
	 czwyt/5ehrVHn10Ts6eOOewROnxiEZpHRKTs0RbVGTfKrfwfctql/nn8jLb1DKNJPILHZ
	 z+v2Z36nI2itzaNS+5tUEe2eIUqoOQ5g9o9kgbuKZO80l2GWJsb/yO17IG+2YTT9UyjMR
	 IUuKkhr9fWtKw0tAHNk7RYU682bQ3eXAWzwEekCzWwvYxEYOYefson27VU0EFYEpo+zHw
	 wTVH74mtJr0CMY1WQtrvaQDsDOXYjJtcU9Gcc673aVvXswsFuxFLQOne1o9k/3P+6kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WJJXgDdM;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B278D606A330
	for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 20:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B278D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WJJXgDdM
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so31381835e9.0
        for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 12:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794427637; x=1795032437; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sVQ0Je+7TVtBihMq71F3r/qets7jTV4f1jmnI7R96Eo=;
        b=WJJXgDdM+YD2JL5IwwtbROUUQQmPcuJ6yGtSuiSPgqtyV1BJu+0rSpsA7UwlqtN9El
         j8a5WpxBI5V5O3Rt6jSe5R3BB3byMcMN9fW4KJI0V1oU5O9NTJvRsY0vXhEUbBO22ZIZ
         f0DfpaxWH1LnZBUbJjeNZ4zZ9uvFKM+62sEyRI+zirJRDjKbVQ/js9qPNyTX/nxzOL5Y
         C3fd/E/NMrhF+5qwvPoQ2DKkEI+y5etJRtB7IhHr8SgQtQ5Z2GdSi9E4cPSk9Vr+vB2k
         hlDtIS6wa4XH9dg+VBpnPdodUN+5jTHaawO6B2zmSc7Q+tFGJE4XVf8DGRrpCkcOKnbq
         rd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794427637; x=1795032437;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVQ0Je+7TVtBihMq71F3r/qets7jTV4f1jmnI7R96Eo=;
        b=Kb39QXgsDQBucr3+4mTLbDMyeW8VqlYsMl61VY6VaC/BoVX4+edaVdxzSyQiz5vPB/
         4VG+wcNiXiP+CeNxpnZW+3KXjLCR7tErPnKytnrjARzgXQ032XvhpT76J36qGEyLOggC
         qQdzWQJQMoMVHrDuZt9wYyF96vtg8unTaEl3HHC+weEk0yKwm35OS8oLVmJ4om6PKCuO
         hY+aGe4A7sNWbs973N3mAkwJqI1+NSqcnrZHu1HI1A2KLQde6n3bpVWwR+VQ4AVvBZFR
         SGrnYWZ+ACl9TdDI9d3UvLGA6qvdZCws/nYu3jtJjzRCUejeph5IJEEe4q/y6Tm7jEMo
         AMuQ==
X-Forwarded-Encrypted: i=1; AL+hErFADlP9QN9cjXwpbXPfrQLHhAyI9BtDijGL01y7TDqfDl/i3vnTPNzRQt0P2OY54xglSTsLI5SvvQ60ew==@lists.linux.dev
X-Gm-Message-State: APuU4Z9mmCxQaagfqpw7HHslyX7+O+TgK9IMUF8r2pa9FxYdodptDFWb
	z/E9niNJLcGEFnRfcuSJlinC0a7c+2c/1mc1SXw/gKYjQhrD4nWOQXyL
X-Gm-Gg: AYBFou36ccZG6OdAG5ZEUa4g7pjmooEKpCE9sFJk27KJSHUQifuOC/BUjjIk0Fm1YTl
	ojtHAD6JSR4Re9Kc5J7lgZ58D6dI8p/ACaU3RNTqIkD7qW7QZZWYj56Rt9tgWmHncRVW4FtEtVT
	b4Uk5jG3hT6tGk1NvT3W31Dox/inExvrwoiMYPRQI+dys4dyLAvQVBVYoqYGVxz3CecE/mLZ9lm
	UXwTqeyNl9lGyEt7MsXjvS0v/ScdzxVnDSE8pgbfhJHdVy7pKUfUc0xh5JQJDxsZCyZ3aAPwEN/
	n7uFZwvwhs0q5X9JNTNZx2OJTxsU2KqfaNYiTcAKS0ubkiluvok9H23GmhkCoWkW9Wsxg3LuMlt
	SMP5AJBVM7cBM74FyI6A/2ZfnZuFeFUsh+QU7gNjGzJMzwI//FZjieWVJ8KpAD05QoTeJsUrXfe
	r4LjYd+GhnPVPxG98gDONSQPzcVegP7rEXRhBk3J6kihO7tSrBsOt1Z8oeszyv7FKSIpQaQ1VO5
	w8JO3pkMOeDVfRyFiI81tsaGMhjDex9w5TwzVPuEqeq82HpBhcPYuBcWe0ervxfpXJdm5QlzTc+
	8TowUeWCSlXru4isAibdT18XTfsKIKrpwySEl4E=
X-Received: by 2002:a05:600c:19c6:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4ba093b1bb8mr61724445e9.35.1794427636860;
        Wed, 11 Nov 2026 12:07:16 -0800 (PST)
Received: from [192.168.1.50] ([188.27.124.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddbe68sm134278805e9.0.2026.11.11.12.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 12:07:16 -0800 (PST)
Message-ID: <1b548cb5-f83f-4bb0-b275-a42112c9e354@gmail.com>
Date: Wed, 11 Nov 2026 22:07:14 +0200
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
Subject: Re: [REGRESSION] rtw89_8851be: 5 GHz link drops after association and
 re-auth times out on 7.3.0-4 and 7.3.3-1 (7.2.11 works)
To: Colin C <ccharm480@gmail.com>, pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org, regressions@lists.linux.dev
References: <CAOy1aSioNmBOPjLTsR3q_A8z2qF=7AC13TSvr=mig_XrgbVXKw@mail.gmail.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <CAOy1aSioNmBOPjLTsR3q_A8z2qF=7AC13TSvr=mig_XrgbVXKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/2026 20:51, Colin C wrote:
> Hardware: Realtek RTL8851BE (PCI 0000:04:00.0, 10ec:b851,
> rtw89_8851be); Bluetooth
>           is the same module (rtl8851bu firmware loaded by btusb)
> Distro/kernel: CachyOS (clang build)
>   linux-cachyos 7.2.11-1  = GOOD
>   linux-cachyos 7.3.0-4   = BAD
>   linux-cachyos 7.3.3-1   = BAD (re-tested 2026-11-11)
> Firmware: rtw89/rtw8851b_fw-1.bin, version 0.29.41.5 (4bd6ebac) on all
> three kernels
> linux-firmware-realtek: 1:20261019-1 on all three (firmware is not the variable)
> AP: UniFi U6 Extender (Wi-Fi 6, 802.11ax), WPA2 CCMP, 5 GHz ch153/80 MHz,
>     several BSSIDs of one SSID, -43 dBm. On 7.2.11 the link ran at
> 600/540 Mbit/s;
>     I did not capture HE vs VHT on the 5 GHz link during the failing boots (the
>     2.4 GHz fallback link, a GL.iNet router, negotiates HE-MCS 10 on 7.3.3-1).
> Taint: /proc/sys/kernel/tainted = 4096 (O, out-of-tree module: nvidia-open).
>     The WLAN problem is independent of the GPU driver as far as I can tell.
> 
> Summary
> The adapter has worked on every earlier kernel (7.2.x and before).On
> 7.3.0-4 and again on 7.3.3-1, 5 GHz association is either dropped
> shortly
> after the 4-way handshake or never gets going again: every authentication
> attempt then times out ("send auth (try 3/3)", "authentication with <bssid>
> timed out"), across several BSSIDs, until the card falls back to a 2.4 GHz
> network. Booting 7.2.11-1 with identical firmware and userspace restores normal
> operation (one boot of ~7.7 h on 5 GHz at 600/540 Mbit/s; a single AP-initiated
> reason=34 disassoc, reconnected in 4 s).
> 
> Failing boots on 7.3.0-4, 2026-10-26:
>   07:48:30 wpa_supplicant: Key negotiation completed with ba:8b:a9:d1:28:25
>   07:49:04 CTRL-EVENT-DISCONNECTED reason=4 locally_generated=1
>   07:49:08-07:50:35 kernel: "authenticate with <bssid>" / "send auth
> (try 1/3..3/3)"
>                      / "authentication with <bssid> timed out", for three
>                      different BSSIDs, repeated; SSID-TEMP-DISABLED CONN_FAILED
>   12:28:29 Key negotiation completed; 12:28:50 DISCONNECTED reason=4
> locally_generated=1
>            then the same auth-timeout loop until ~12:31
> 
> Failing boot on 7.3.3-1, 2026-11-11 (boot 12:12):
>   12:13:00 associated with ba:8b:a9:d1:28:25 (5 GHz), aid=3
>   12:13:07 onwards: auth to 2a:e8:29:52:c6:9c, ba:8b:a9:d1:28:25 and
>            9e:05:d6:d1:6d:d4 all time out (3/3 tries each), repeated until the
>            card gave up and joined a 2.4 GHz network (GL-MT3000, ch7).
>   A manual `nmcli con up` for the 5 GHz SSID later failed with "The Wi-Fi
>   network could not be found" although the BSSes are listed at full signal.
> No rtw89 error lines appear in dmesg around the drops (only the wlan0 auth
> timeouts above).
> 
> Caveat on the 7.2.11 baseline: it is not perfectly clean. Over the 10-day
> 7.2.11 boot (2026-11-01 to 11-11) the journal has 8 wlan0 authentication
> timeouts and 36 "rtw89_8851be 0000:04:00.0: timed out to flush queues"
> messages (Nov 4-10). Some auth timeouts overlap with a hidden-SSID issue on
> my side that I fixed on Nov 9. In all cases on 7.2.11 the link stayed up or
> recovered by itself; it never got stuck in the endless auth-timeout loop seen
> on 7.3.0-4 and 7.3.3-1. Filtered logs (UFW lines removed) are available for
> both boots.
> 
> Bluetooth coexistence lead (7.3.3-1, one run each, so not conclusive):
>   With Bluetooth blocked (rfkill block bluetooth): `nmcli con up` joined the
>   5 GHz BSS ba:8b:a9:d1:28:25 (5765 MHz) on the first try, auth/assoc clean.
>   After rfkill unblock, the link was on 2.4 GHz again at the next check (about
>   3 minutes later; I did not see when it dropped), and a repeat `nmcli con up`
>   for the 5 GHz SSID failed as above.
>   The card shares the module with Bluetooth, and an LE keyboard and an LE mouse
>   were connected during the failing cases. I am not claiming a cause: the
>   Wi-Fi/Bluetooth coexistence code is shared and has been changing (e.g. the
>   July 2026 rtw-next coex patches for the 8922D, which are not in 7.3.x), so
>   it seemed worth mentioning. The first 7.3.3-1 boot did associate once on
>   5 GHz with Bluetooth active, so timing may also matter. A repeat of each
>   case (3+) is still to do.
> 
> Things tried that did not help on 7.3.0-4:
>   - /etc/modprobe.d/rtw89.conf, exact options (still active, and confirmed
>     in /sys/module/rtw89_pci/parameters/ on 7.3.3-1, so the 7.3.3-1 failure
>     above happened with them set):
>       options rtw89_pci disable_aspm_l1=Y disable_aspm_l1ss=Y disable_clkreq=Y
>       options rtw89_core disable_ps_mode=Y
>   - reloading rtw89 modules (briefly restores 2.4 GHz only)
>   - firmware 20261019-1 vs earlier (ruled out: 7.2.11 works with 20261019-1)
> Also not the cause: the SSID is no longer hidden and the extender BSSes are
> visible at full signal; ch153 worked on 7.2.11.
> 
> Package history (pacman.log): linux-cachyos 7.2.11-1 -> 7.3.0-4 on 2026-10-24
> 23:41; first failure observed the next boot. Updated to 7.3.3-1 on 2026-11-11;
> same failure.
> 
> Searched lore.kernel.org (all lists) for "8851BE" on 2026-11-11: no report of
> this problem. Possibly related, not read in full: "[PATCH] Bluetooth: Add
> HCI_QUIRK_NO_SCAN_WHILE_CONNECTED for combo chips" (April 2026). The symbol is
> not present in the installed 7.2.11-1 or 7.3.3-1 headers, so it cannot explain
> the difference between those two kernels.
> 
> Related, not duplicates (found by web search):
>   - [regression] rtw89_8852be: silent RX stalls since v7.1; reverting
>     bda294ed0ed0 appears to fix it (https://lkml.iu.edu/2607.2/04572.html)
>   - RTL8852BE can't connect on high 5Ghz channels
>     (https://bugs.launchpad.net/bugs/2059170)
> 
> Expected: link stays up on 5 GHz as on 7.2.11.
> Not tested: vanilla mainline (CachyOS patches may be a factor); a bisect; a
> boot with nvidia-open not loaded (to rule the taint out completely).
> Happy to test patches or bisect between v7.2.11 and v7.3.0 if pointed
> at a range.

Sounds like the same problem reported here:

https://lore.kernel.org/linux-wireless/0A58E3B7800E469B+179421939016.46230.883154851683340495@guwolf.com/

There is a patch in that thread.
