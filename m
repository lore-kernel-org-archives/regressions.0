Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795625219;
	b=K8wH57Vm84LpLN17s2vDF/OwlXW2WubivBnymSANe5BxqqBp9epC414vEQGvn/4rvRwc
	 NqTEEvX++GZcKPXytWbL9SG79CDh5unHgwU5rGmb6i5qeMkAnMUyVb17fyz+WB3aZ4lpF
	 fZpedK/H6tjcDvTTgIhDzUJ0pElGU4qOzPCFX9LaKs/KhtGxltzB9QlFr8g4o8u8tZT9S
	 FcbLdejKepml5+aOKUE53g2X1/pF+oMzc9wovUDbYbpYH5gfFkSfxRfqPW1ineBSD6Qt6
	 dptnw4HP/DlzPPPqE/uykDDExEitRXO6O7jJpBKkxethey0s8bRB7ioO7tGoFkmo7ZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=4l6su8J/2b05gZJamYLmbEnP/+CVAtPv/Cq+tXm1mwI=;
	b=sDIPE6tdmfR4P4dNmmZcwY/4bVcsHx8xqRfhfsUIt7pZftkMKbEC3RJX0RlsgjTAFx0y
	 9582kZbcQ3kFXO8T0pQlSAXZJLrmpeIeT6Zsj9JgX6uppqTqjjzYdqjCtleO5s3AvFlO4
	 IdsFsRTgMzYBqo5A36nvx2UrADVUYyDwoAMxsBAlS9rjlqauFZY8P2FXwzU8XrYY/DWQf
	 BS5/qBEGob8gFPCksA3AjBKXVLhYsJicSCnC9W0RalECff3crFgYfTvB1k6EHP6LeArhL
	 7TekbX7aHcL31pUDDnOHTz/N0tWHfZqPgs2qfLsc5nNk4jKBdMBFNb1tKaM2najyXhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGace+59;
	arc=fail smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BACC606A31E
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 16:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BACC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGace+59
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f0458cc9easo47782365ad.3
        for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 08:46:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795625219; cv=none;
        d=google.com; s=arc-20260327;
        b=UR/VPS6tD/xF7S/LXkDnK7aolTVS/pULbdyRPauCoUNjfY+fymyscvkeXkk9znmU9D
         xnTkpRppj8yYWRpg20yExBHpGDMDEt9yyTr7zjASmls8iE+ZLapf6HD4ceBFHd/BAoGX
         3zq1DreHbdDssKjExd0A7PJkckVMziYUCdwmrCKnA0UJD5RetT3MVUtxogzJ+IgEhGvP
         +LjpSgubxsxpY53QgS6hMN6IWpodqaCT2pNQOjOrASKBqd7NPyb1L9PISRccUT9TW/bY
         XTqx9aVZcpIU7EMDBI4WBl9pW+D3oRuzRpRZa1NBymCXei3HkFoAi/BmnLk3YnmnSMba
         b2Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=4l6su8J/2b05gZJamYLmbEnP/+CVAtPv/Cq+tXm1mwI=;
        fh=n3aHtTn4OayIrqe/sesn0jLkpk5nIVDrR37pn6lsiCU=;
        b=eb3xRueXDzvYXMZWWI20cs92hJRAeAdn36DRLonsDzwDzbwerYP/2Sa2oLRKUfe47k
         sjRHk0j1t8bupzLHHax7B1Pu+txW8d1Uwh3f3dRCII2IgGbZsSYqvlvvzALnch+yXn/P
         xdrUI47mGhtXhm3+Yo5JuEyZevoPwEUld4+pKusA8n4O/gS+sMvp+HeSvBEuvBgiPAr6
         Dd1Mrv6bNmcroKk1eXPIME2GA/02+2ENeAdgz8YkpvocwTqmG65UfMAHBoR3t+KszCi0
         xUPRIqJkR8JjJtfiIg9aDf1jzd0+bwsDTjH6L6wiWIvooZdMlHHWDFyIVnALYBQYHA8u
         ywKg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625219; x=1796230019; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4l6su8J/2b05gZJamYLmbEnP/+CVAtPv/Cq+tXm1mwI=;
        b=zGace+59ESmF+ImcqaZEo3pcr0TcUCtk3KDRR+wFgzWYaL09t0/wFAmMmLwoAI+eRO
         lj63r4GnMyAvDPU5yxGF0599W5i5nUhnALh6Oj4kALdHtXM3VACHUuTlBAYYLxAiA3Dj
         PF6Yk0du64rpXS1MQaYi4RgeEEqHeeeG+BBLedEnxj3fufHNkKewFzRkOcyLV7DGKCIL
         i87QOtmQB+QZNfHJ5LnJKBeLCg4w4wHUuqxJrYPPVYQ0siY7Ims+Jt42iWZ/LvUYGYHR
         lQ6QtRdhgWcPH1GsEAXbEKskivYVuttRU9An+MOnU1echiof+2mH7Qd8bzfglwaV5alu
         GnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625219; x=1796230019;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4l6su8J/2b05gZJamYLmbEnP/+CVAtPv/Cq+tXm1mwI=;
        b=a3ugL4JWxaKzZve19odbgKvQVmc6zhIQWj7r+au+rdka/bQXstao205QTySwUKgngh
         Pp9bDmOe8ZfXVyD9/fl9MJbB8hoYnB1C4dd3SbNHCkpYD73eldvQXXO8KNCw7HZc3ope
         2dHjtFCxsTocZAB6aQ6a02/ilbjPowi9X5Lvs2MAXbqfhV0PGxWPLWlcugRu9Y5IZRPN
         S0rRL9bq855f9f7u6DiT5W9xMghim9xIO9ZenMCI0Ahddt5DjtyySM+WNq/erLPrBJXY
         LiC3d9UTkGgZbhR2ihDpTpycrNPNHcrOa6qZWn2Rv9w4y0DPpa30rznHHmAKh9QMa1wb
         TRNw==
X-Forwarded-Encrypted: i=1; AL+hErE+zyKz4+HJf979bxaZmvk456KWaXbzjaaJzL9X5qIUAW8+j9iVKQW1xo2ZEjNsd3DbYxUPxlmMpKp1/A==@lists.linux.dev
X-Gm-Message-State: APuU4Z/neTRDN2KjZg5O3dWoto4fL0HAmUCPhsIqFCEfyozC5rqQ3WzF
	tkTYWArQBALmEM2x8NAIqkJMH6rfsvkjQ02BvBRzYF5Q836ZZMyIM7oTWQUN2+dk7kvftTf0ORh
	qOhYEBtTBmSoCn0qnshvUC+xjF5y1bMc=
X-Gm-Gg: AZFdTZeVhq1pFZXew4h4LSo32W5EZo92N5aSt6MxdoEyy9Ik/Aub9u8h+YrCkznyjlj
	d7BGLhXvFGJNXsQTxH1TSjMlGGrRskOSig76fvtozenRnjwlCaONBz/AtwUK3eqHdWzC2nNLPWq
	4eDDZ1cE0MqKn0o0MjB11jlyb4UWX35lS18Qc/90Mw++SnSDlQKuFruKZdrT3hRy3QR09QEqZVM
	3Iw3AC7v6ody9oBGk89MgAwq2dvoJDAA9dZka2je5mYwqQPCoWi+NviiBQ4qEuIsBkr9WLncQIZ
	p7kGFJrcfwa3Tm6GZIc4hy8cn8yBHW0iJi6pj+182/JBH0KBBZIHy5ixoax5dhF+hntn3PUl+fg
	wVlWDJCmzcCvcoQVW3hi67/UKAJsmNjxO
X-Received: by 2002:a17:903:1b4c:b0:2f0:a8b5:4330 with SMTP id
 d9443c01a7336-2f0dc64fcbdmr24291335ad.18.1795625218595; Wed, 25 Nov 2026
 08:46:58 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 25 Nov 2026 10:46:58 -0600
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Flavio Giacchetti <flv.giacchetti@gmail.com>
Date: Wed, 25 Nov 2026 10:46:58 -0600
X-Gm-Features: Aa3M54r5hd1_jSn3QPbVycglwSRHi1SAylD7McKlbAvXL2of4Va2BSZXo0kgJpw
Message-ID: <CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com>
Subject: [REGRESSION] Creative Sound Blaster X3 (041e:3264) fails USB audio
 probe on Fedora 7.3.4
To: linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

My Creative Sound Blaster X3 stopped appearing in ALSA on Fedora 45
after the update from 7.3.3-300.fc45.x86_64 to 7.3.4-300.fc45.x86_64.
Booting the previous Fedora kernel restores audio on this PC.

Hardware:

  USB device: Creative Sound Blaster X3, 041e:3264, bcdDevice 10.90
  Host controller: Intel 600 Series xHCI [8086:7ae0], revision 11
  Connection: rear motherboard USB port, enumerated at 480 Mb/s

With the stock 7.3.4 Fedora kernel, the failure reproduced on two rear
USB ports. On one failed plug-in the kernel enumerated the device,
bound cdc_acm to interface 1 and then logged a disconnect. After
re-enumeration, the USB audio driver repeatedly failed to query sample
rates and mixer controls. The X3 never appeared in /proc/asound/cards.

  cdc_acm 1-12:1.1: ttyACM0: USB ACM device
  usb 1-12: USB disconnect, device number 7
  ...
  usb 1-12: parse_audio_format_rates_v2v3(): unable to retrieve number
of sample rates (clock 33)
  ...
  usb 1-12: 13:3: failed to get current value for ch 0 (-110)

An experimental cdc-acm quirk skips interface 1 for 041e:3264 only.
With that module on the same 7.3.4 Fedora kernel, the X3 registered
with ALSA and played stereo audio at 48 kHz. The first hot-plug test
still logged errors during re-enumeration, then recovered. On a
subsequent normal reboot with the patched module installed and the X3
connected, ALSA and PipeWire exposed the output and input, and the
earlier rate-query errors and timeouts did not recur. Playback worked
after the reboot.

This is the result of testing one unit on one host. I have not isolated
the first bad upstream commit or established what functionality needs
the ACM interface. The results so far are for Fedora kernels.

Would a device-scoped ACM exclusion be appropriate here, or would a
comparison of USB traces with and without the ACM binding help narrow
this down?

Thanks,
Flavio
