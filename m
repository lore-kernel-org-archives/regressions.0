Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792473148;
	b=EGHSCFcuzr/k8sWQXzty2Itq+NvkqUwLgg+6JYccb2iTZKiKF8HMvM06XwWiRRxfr04F
	 rPuZF9U5FeYlpRJi/9VqW9T8feMmS/44oQ07o3/bdSwJZ9xJjYNdlWZNB1qZjkWa+BXoh
	 NRLLGVIR8AMRQSYAgTSYE35rK0bNS3iMmrsoAzQ68YTwSds8JAw8iMTHXknmN295VYWoB
	 cYsO4W4XsPGMNzHzA2ysIQ6HFNcE9dncG076/gRAWOdWkj0dwBh63kIy/xWfZJItaYXrD
	 dzVjlF9AI6NmZrLKxSBgqxtuq7q1b5+O0eWkdPTqjtslWiT8QjLM1rqGnGSbTjs9aHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792473148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=PyynqMl4ncW1eB9AWHZFc/qe+eQxWGhcfOaNkw0KWyo=;
	b=Gw3TLtHDmG67BMhUIC+/FqKwqwtSf4VC5rvxdP2ps7Oxdofr66cOjubqT27TSchz2zqt
	 cJ0OdHrKVefx7kO1rbu2q/L+L5j6P1Uoku0jgvzVNAlZn4g2BnzAgEf129GnwSzxI75cZ
	 lfogFSyt8RdH0wNoYKtGIzN975M0eO/KRmKilCJ9ZYBWx+bwzJ/Jq1++vZtZZtU9io4Kv
	 AYWftaiGEcwQOo8VN7b8ehrSKm34VKoJtFmO3UczSCa++sTJDunOOEoL0qlodWbyHskgH
	 fko6Q7u0FM/8lxU934P7AWOqZv+5CIkfZOtrW88/dRhDKHW3EfxwmHfNZq3ux05H7yA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IH5DLuQU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E4C606A319
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 05:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39E4C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IH5DLuQU
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8726acc5eadso22841357b3.0
        for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 22:12:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792473147; cv=none;
        d=google.com; s=arc-20260327;
        b=kW7L9zCQpMjp/e8Yg8C//Ri15GBc0c7BKzbuSO9LBvdOjfd30MYN7JXeJmBiSJZUne
         Dkb+VJUtaM6fdFtn1BnCHmSy8N4Y0A9O3hHHbYDS74bHvgXmmNlQxfWxixhM1ACjYBkF
         5vafY6Dugum5DLvRm6MY7KWQJ6ubVf6XLP/E4hqcpUVNuJBCVlClSvfSztCASjJmPe+A
         O0M/+paJiqOxoniQeVvRmqXa/i4Yv5wZICdyuKnIzYHEEreNqnZcTfoF6YzqzGSgrNR1
         /39yrAh5E9TGaUyZG2Lq0JsQBq21fjaSAzy8/oZhAJncYZmaWI25ZIrR7edwLtMxqSmj
         4dLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=PyynqMl4ncW1eB9AWHZFc/qe+eQxWGhcfOaNkw0KWyo=;
        fh=7eCfURJeW8NaFrEJm2n3sJ/nhqApp8flE1VbDhs/b+4=;
        b=XxZFndBEx0punwGr2FYHmPvvteC1CwFxWFgrVQKcAQGzVOvtDLo1rJLeLjV6bHZzoN
         3V3WB5b1hNrR9SkwtQ6ZhV1aR/AoIHKYwhi1ruvcdLRvL4KgQAA1iQFi8L95TTb78R3o
         SexpWuErc8zGrDoZWMeFV9f+c6ggAEscAO1jPTI3efBc6NulsNI83gb/PLyG8bZYHuOn
         tIsuaMGQsCRMTZec5aQxq5GJpDmfUwzrnpTt9MLr0Wew32EkftDYikYFEkoH9U5yZZS2
         KgQ/dD2FgKO5AhEeuB9q06lX/O+eyS+LMRgfNlWrdNlC0XstFo8g6nK+gNT5Wqe/O4ym
         Ij2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792473147; x=1793077947; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PyynqMl4ncW1eB9AWHZFc/qe+eQxWGhcfOaNkw0KWyo=;
        b=IH5DLuQUrDWvzJaZf6XDocavAu+GFIY5VP0QWbe0d5BNTs5v3bdTdzXqPT7XwZGbnx
         fv1bmQL2zjiJk1xdmF3HNxBO3d7cfoCHpN+RQdWxYRoKCkTBhcE7yjUsiDy8UiKGhhC8
         VGaEvo0gc05YgAxpyVa87QDY+zi5dtqp+blmaqnvS0mpX1yJ42qp0UpWeeiDqVvEt2N6
         ywLCPY7yESyqeHnk+ylq34qwTPm20F0uSjmSXXwg6kRf+1hl28mEYqZmyPeqRpE1CTSz
         amEJbf2VOQ2Icb3mGZTvci0ZghB0TtJ+Hn8NTgdfxKSgRf9v9seoTTATWoB0XCDOxHTv
         Jkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792473147; x=1793077947;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PyynqMl4ncW1eB9AWHZFc/qe+eQxWGhcfOaNkw0KWyo=;
        b=Q08P7dtsbSG0boprUnXukDouzTvnk0f6kE2fleC/FKZdBGt9LFHuhFDy8iOmT7hq/x
         ODoldssjDADU6eanah89wBSHeayesbnZYmyFFxhNXFb+n57VCx3vlJbR7kWOkCYSVM6e
         fXkbxF/v3AKvGJW/1FG45C4uUHfek+RraZFpPewt9dfNKIWzsV7DubsoyaVjzNAbZ+Od
         IhCUYly7nOJ//1DwiyNIc6LfEgMT9AVIxNleb2/v3YqAMgPFkeK8n5ntyHQifrCVxyLN
         U663rmaKYMztI91W6oMwcUtUeanTw8J1LbKVIOvSBc87x/Cby6sK8gvv3A6b/sT1JnJl
         HYqg==
X-Forwarded-Encrypted: i=1; AKwUvByr06AKbdcl7oWO4z1R4ASotbPRvD24wAaaFnHWBKGP9vRJO9TREa9VzbtagFXOIt4ploEJTP0MSQQdlg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIO8DkgPbJyt5cp4ASdk2npSfIGncQGnX/c3FjBTi/JzQo58fkB
	aCyu+fUbQ3LON7bzgSOSSJTs3JEqBBuA/hBimnjqOd8oTFPX9KArEbmsvGgatw4OJqtIc7bhKnk
	ygzzH5z2kYbxlqiHGRBRBBggR9BumwAI=
X-Gm-Gg: AYBFou0fZkO1CmpUb/CdWWvXqIqHjzz0ah5cb5iFIMDRAXppMiadoARm6pXtEZut90W
	ATrivRIdcbynEXLhUwiGgz0e6EeBtnBJMfFcgtP3JVs80eQ59cUmWnaVmcUsNmxzYvzftuq40Bv
	0HgJy2zkab6pWzwG2I7UQw0ju1jcvP534ffAyVY/OIU5MsQIsv8XRbJnTsIf36Ui8ykpPI0b8dv
	O4b1ZB5+tzUEgdB3p/Jp0JHhNDj8W0oLXS4PLqIAM4wHuod54icqeP7jsqWTXmfPLjH03WiqcQQ
	8bKo3KrTX8Vt1etRJNlRuigre2LnI1pIYzMizGHMvCphg81R1tefJi9Z
X-Received: by 2002:a05:690c:4147:b0:8b0:d9ff:4f7c with SMTP id
 00721157ae682-8b0f219aa70mr29146857b3.17.1792473147001; Mon, 19 Oct 2026
 22:12:27 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Serhiy Shliapuhin <shlyapugin@gmail.com>
Date: Tue, 20 Oct 2026 08:12:10 +0300
X-Gm-Features: AclHuK9lKSLAXYJcseLToAmTFHVV6FMHM4SpSTdy8VRD1egrrcMTKB8ZuQrU_UI
Message-ID: <CADGd8gGYm5QmnDrjBzfWsWcKg9_ULAAV7o8RzDxi1p9doN5gCw@mail.gmail.com>
Subject: [REGRESSION] platform/x86: bitland-mifs-wmi: platform profiles cannot
 be changed on USB-C-only RedmiBook Pro 15 (TM2017)
To: "qby140326@gmail.com" <qby140326@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mingyou,

On my RedmiBook Pro 15 (2021) none of the platform profiles exposed
by bitland-mifs-wmi can actually be selected. "performance" and
"balanced-performance" are always rejected with -EOPNOTSUPP, even
while the laptop is charging, and "low-power" is accepted but has no
effect. As a result power-profiles-daemon can only stay in Balanced.

This is a regression. With Ubuntu kernel 7.0.0-38-generic the
Performance and Power Saver profiles could be selected via
power-profiles-daemon without errors (only the intel_pstate CPU
driver was used, as no platform_profile handler was bound on this
machine). After upgrading to 7.3.0-9-generic (Ubuntu 26.10),
bitland-mifs-wmi binds on this laptop, power-profiles-daemon also
uses the platform_profile driver, and profile switching no longer
works.

Last good: 7.0.0-38-generic (Ubuntu)
First bad: 7.3.0-9-generic (Ubuntu)

#regzbot introduced: dc1ec4fa86b2

Hardware / software:
  DMI: TIMI RedmiBook Pro 15/TM2017, BIOS RMATG5B0P0909 03/31/2021
  Kernel: 7.3.0-9-generic (Ubuntu 26.10)

1) DC-only modes are never available

This model charges exclusively over USB-C; it has no dedicated DC
barrel jack. The driver's DC power check (as documented in
Documentation/wmi/devices/bitland-mifs-wmi.rst, "Performance" and
"Full-speed" require a DC power source, not USB-C/PD) can therefore
never be satisfied on this machine.

Platform profile handler:
  $ cat /sys/class/platform-profile/platform-profile-0/name
  bitland-mifs-wmi
  $ cat /sys/firmware/acpi/platform_profile_choices
  low-power balanced balanced-performance performance

Power supplies while the charger is connected (no ACPI AC device):
  $ ls /sys/class/power_supply/
  BAT0  ucsi-source-psy-USBC000:001  ucsi-source-psy-USBC000:002
  $ cat /sys/class/power_supply/ucsi-source-psy-USBC000:002/online
  1

  $ echo performance | sudo tee /sys/firmware/acpi/platform_profile
  tee: /sys/firmware/acpi/platform_profile: Operation not supported

  $ powerprofilesctl set performance
  Failed to activate platform driver 'platform_profile': Failed to
  write to acpi_platform_profile: Error writing
  '/sys/firmware/acpi/platform_profile': Operation not supported (15)

I have not been able to verify the behaviour under Windows.

2) "low-power" is silently ignored

Writing "low-power" is accepted without error, but reading the
attribute back immediately returns "balanced":

  $ echo low-power | sudo tee /sys/firmware/acpi/platform_profile
  low-power
  $ cat /sys/firmware/acpi/platform_profile
  balanced

power-profiles-daemon then sees "balanced" and reverts its own
profile, so Power Saver cannot be selected either. It looks like on
this firmware the mode writes are either ignored or the current mode
is read back incorrectly.

Summary of all writable modes on this machine (charger connected):
  low-power             -> accepted, reads back "balanced"
  balanced-performance  -> -EOPNOTSUPP
  performance           -> -EOPNOTSUPP

I am ready to provide acpidump or any other information you need.

Thanks,
Serhiy Shliapuhin
