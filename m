Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799586;
	b=gDgijXjsojetRnLCufqNzqh9V9lBlqX07xC1pFpIdGu4P895qP/D+RNKDZrxUQU+8gQx
	 7H65oraFTX3QEjmkvIstitqZNAjDq5CdFtNMCaYH+ZLVc+FIGCWs/zCzegy7TRQhTiN1K
	 VHpHIZMDrE3VJPS0opPvwGsreuH6WMCFDT/ck6sRg2CDrO1EHszBZT9QYG/Ew+07SuRqW
	 /Dx1I/7fmRvtpvuSHVp3+NkkbEE/uH6Z9SClruPC45TZOpIC5DgFPNEWsrjmMIzkhuuJZ
	 Uy/Dh38JMppf+ZqImjsH5749Yv28BB+jP428dosYGCoouxFVyMuyRGVlgd3PBoNgtiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7S4J0Oj3sYJi1UqXP5r2+N/vXgyTszyUgul/cChtfHk=;
	b=Aq4yyd3WIIClEvGQopUJb9W9wuciT2YoywFbt+X8uP8MWf/68AQW38waoRCU+3WSYyOc
	 rHLMPLTEi1+RC2Nv2Fl0KQoHvQD8wjoJyra3tBN+pOIdnPJ3xXsbTjyBia7J00mIYXVi5
	 8Uk1tp+kdKAxMGfHtrzxOhS6EWL4YUxQa0fP1rXFLazNHUxZct1kQf4kfF0oR8DHjfX25
	 Aithoo4NdnNZBPZuvrR+K3xaegNCdd95hzaTamflf8XFnrgvhI1fH0vDYtd6EBp5Kee1c
	 hvNq5xQv8t7nkSw6JVr6kq66dQoF1pNM5Xq0NemapIeVESkC0CgkoMezmx2VlaWIsVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cuT2qXe9;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FCE606A31F
	for <regressions@lists.linux.dev>; Fri, 27 Nov 2026 17:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2FCE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cuT2qXe9
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso4244133a12.3
        for <regressions@lists.linux.dev>; Fri, 27 Nov 2026 09:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795799585; x=1796404385; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7S4J0Oj3sYJi1UqXP5r2+N/vXgyTszyUgul/cChtfHk=;
        b=cuT2qXe9Za9Rd1ZtNkX98hFaGF11PQCyElwqKPvzL97KTfNyoOPNbGGh8pB+oiSBZk
         WRn9hiHiyO4+P3V8ibhnIkzQ6qgLy0GLo+EW0F/KOTJTwacafKLRs/lFOoxws0PnIbZc
         MgFP15IbBou2NtXK72ugL1J42ojM6LACISK0e0yH0eNzO4FinNIrCPTx031lmW0fZcb7
         nRENzlILkE9Cm2/uXo29vxyb03Htzp0Qy7G/YKZW4DYbfzAuM5xCoGJ7uGC3o4GZC/RB
         UR7wOQpltBVvgmDD9RZ/foQOaHN3F09igqbT00AVzoLnfdWuN7AF0en5O3s4PSJovN5i
         IXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799585; x=1796404385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7S4J0Oj3sYJi1UqXP5r2+N/vXgyTszyUgul/cChtfHk=;
        b=o17kUtvRKQmeOlV6tKViPvAmUCnRZjrnuJi/Tv3720T4eOS9+N4cFLQ7eb9r6oR/dY
         Prm8HIFDUz+LOc092d3HXBahBdc/aBLjrDbHUfTi+AJb9XoEY9f2BKWfAecDS443RbY8
         YMrQJ84X56QlgMsvrQLIRFqTfgqzExAzG4UGf+8RB1zrL4mLdymE22xnkrngv16BVNiN
         bBQTWUnXRej7eWUkrEvPLXaNh3bH47/EYg+IecMLeAEhriElc40uL8W7zQgZfWcbSDLi
         feSgB7IywfI0fbpy+OjxsD0tzoEkJPQnxxmPDErcS8IR6JbwAKFCDCUdLLFMb4/+/kQ9
         f4iw==
X-Forwarded-Encrypted: i=1; AL+hErGwh7S4CMfQ9mLtObxXm9458ICm3GjX3wsc+yKsVlJvVVFQETNRiBmRU+EbtZYG5pxk4glmuZKYwdBzDQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/O8xmzCWBjkQ8t1nzE8ZeU9HDp3Q/Ja0TGgJeQOY3YwIS1MpHd
	4730t4Yy0dsUbCZ/U6cwmFUQZuNniOrZH2njxhLijphOjaD2CYK3EXYn
X-Gm-Gg: AZFdTZfHRQF133GROXQ1jkFFwat2pkUirOSnQhDQZWb5wOqNiq8P4Y0JchIbne/0Jjc
	EzNuh5WmlKjhuhr+2ZEdG4+qh3Qd/jan12bjH5j2Fb5NcWopwLxWRABtaEXdEWK0rXetqdpV2q+
	QvoDg94tEvGZ1lA29xr1vhLN3lrpSHY7PkUZFP//x5XJzcfgQ57n9DunI4d+VoqceOUGd9Vcb/7
	g8BsXNuJQLcXrayHpGu9fOEUzK4+2sz6HkyL567dN6yJx7jcJVLJKhCZA7wXY8ofU9/qoPiO6aQ
	yTfRBlYkyiyfAB8Eib2gne3Rf1gWZrUUDX8PMrT/MEHOw9Nu5yAbjqDgWHj28yKanTNAmMQG5id
	rZm105igeFxaIjg6pPLdt0xvfSvQycJ59bW02+z951PlE44hLrXQkCW0BAd0OJvOqxJQy94A+Wu
	xSQA2yqTfkFcmfAz4WlfUYymvz2BO4k/j2EwLedc8KWNlWO8U6IYlncj7fX9uuS1V5YIXHF2l94
	nmklr3c3dtkATOx+4xumLHeoQ3oBKRUV3qJc/cF1oRn5lN/zwDjtkdqpCmFKbuNpZtEiIWq6UWT
	UWN6rfAPoipZ7qpNfZA4AQjrv68YlsD2Lafv4PKR3dB6pRxq3iATzB2vfZcFHnX4MUGhJ2WcTYJ
	aFuVwJ4Sxhj+aEXSuYpqE1F0znCcbiVTQ7xcpf0ryiRs/ZRRyz6BSO2k0Sd4CIobue25nK5gEFO
	iW+Nr9+JjjWR55ZIsHEj1q
X-Received: by 2002:a17:90b:2e49:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3b41c90811fmr24324820a91.25.1795799584854;
        Fri, 27 Nov 2026 09:13:04 -0800 (PST)
Received: from fangorn.. (97-120-153-124.ptld.qwest.net. [97.120.153.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm38643445a91.3.2026.11.27.09.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:13:04 -0800 (PST)
From: Carl Egbert <egbertcarl@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Eric Naim <dnaim@cachyos.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Carl Egbert <egbertcarl@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix mute LED regression on ThinkPad T440/T450 family
Date: Fri, 27 Nov 2026 09:12:41 -0800
Message-ID: <20261127171241.1619113-1-egbertcarl@gmail.com>
X-Mailer: git-send-email 2.48.1
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 8a889cce1c6d ("ALSA: hda/realtek: Unchain
ALC269_FIXUP_THINKPAD_ACPI from ALC269_FIXUP_LIMIT_INT_MIC_BOOST"),
ThinkPads whose fixup chain goes through ALC292_FIXUP_TPT440_DOCK or
ALC283_FIXUP_INT_MIC no longer get their mute LEDs set up. On a ThinkPad
T450 (SSID 17aa:5034), the speaker mute LED no longer follows the mute
state: no mixer control gets the speaker LED access flag, so snd-ctl-led
is not loaded automatically and
/sys/class/sound/ctl-led/speaker/card1/list stays empty.

Commit b2d447288fa7 ("ALSA: hda/realtek: Add
ALC269_FIXUP_THINKPAD_LIMIT_INT_MIC_BOOST quirk") added a ThinkPad
variant of ALC269_FIXUP_LIMIT_INT_MIC_BOOST and switched the quirk table
entries that selected the plain fixup directly. Then
commit 8a889cce1c6d ("ALSA: hda/realtek: Unchain
ALC269_FIXUP_THINKPAD_ACPI from ALC269_FIXUP_LIMIT_INT_MIC_BOOST")
removed the chain to ALC269_FIXUP_THINKPAD_ACPI from the plain fixup.
However, two fixups reach the plain fixup through their own chain_id and
were not converted:

  - ALC292_FIXUP_TPT440_DOCK, used by the ThinkPad T440, T440p, T440s
    (via ALC292_FIXUP_TPT440), T540p, W541, X240, X1 Carbon 2nd, T550,
    X250, L440, T450, T450s, L450 and X260
  - ALC283_FIXUP_INT_MIC, used by a ThinkPad (17aa:501a), the IdeaPad
    S210 and the Lenovo 145 (via ALC236_FIXUP_LENOVO_INV_DMIC)

Their chains now end before alc_fixup_thinkpad_acpi(), so these machines
no longer get the mute LED setup for thinkpad_acpi, nor no_shutup_pins.

Point both fixups at ALC269_FIXUP_THINKPAD_LIMIT_INT_MIC_BOOST, which
restores the fixup chains these machines had before 8a889cce1c6d. On
the IdeaPad S210 and Lenovo 145, is_thinkpad() is false, so they only
get no_shutup_pins back, as before the regression.

Tested on a ThinkPad T450 on top of sound.git for-linus (e79163b531ec):
with this patch, snd-ctl-led is loaded automatically at boot, and the
speaker and mic mute LEDs follow the playback and capture mute state
again. Not tested on the machines using ALC283_FIXUP_INT_MIC.

The regression was bisected on the affected T450. An AI assistant
(Claude Code, using Claude Opus 5.5) was used throughout: it helped
diagnose the problem, plan the bisection and write the scripts used for
it, identify the cause, and drafted this patch and changelog. I ran the
bisection and the tests on the hardware and reviewed the change.

Fixes: 8a889cce1c6d ("ALSA: hda/realtek: Unchain ALC269_FIXUP_THINKPAD_ACPI from ALC269_FIXUP_LIMIT_INT_MIC_BOOST")
Cc: stable@vger.kernel.org
Signed-off-by: Carl Egbert <egbertcarl@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5c3b383bb618..003f5052a842 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -5246,7 +5246,7 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		},
 		.chained = true,
-		.chain_id = ALC269_FIXUP_LIMIT_INT_MIC_BOOST
+		.chain_id = ALC269_FIXUP_THINKPAD_LIMIT_INT_MIC_BOOST
 	},
 	[ALC290_FIXUP_SUBWOOFER_HSJACK] = {
 		.type = HDA_FIXUP_PINS,
@@ -5361,7 +5361,7 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_tpt440_dock,
 		.chained = true,
-		.chain_id = ALC269_FIXUP_LIMIT_INT_MIC_BOOST
+		.chain_id = ALC269_FIXUP_THINKPAD_LIMIT_INT_MIC_BOOST
 	},
 	[ALC292_FIXUP_TPT440] = {
 		.type = HDA_FIXUP_FUNC,

base-commit: e79163b531eca7f3fdc05031f4b43b6f7c51d3bc
-- 
2.48.1

