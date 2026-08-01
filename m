Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B602D592C
	for <regressions@lists.linux.dev>; Sat,  1 Aug 2026 14:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785595560; cv=none; b=LH2cNZnMMlBtcBa2cy08RtLS3pFZorUYObh6yJzlwb58/jk7KYSFLOyqLJ8zzAZiFCpp27lVcc39/rRYlBOgP9Nxvc1zW0QnwRjFCw6h8v50kUg3AQlt2iON1rI7QAT2x5rGKW5WRmxID5lfMXcUmZhpvQHfLWvOLG5QPLDAFqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785595560; c=relaxed/simple;
	bh=KQOed2pypt6Ma/meVK6i5cx6qB9B0YpNenFSdwTXauE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OC6RmwV/aCjzy2XPNLpgxL9Z1zepjU7Xg/Uslg9wicFis93hSn+DGEuewaTzogxlsOcj3mFxje7D2YfkH69cBIBhXRJukZkgTi2slEZJc1+m4DULivX9bk55vm5J9lz8G5tKwU1uohbuqhIbkM8zAZCWeyQue+I9eaQgyC8aKWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethicsbowl.ca; spf=pass smtp.mailfrom=ethicsbowl.ca; dkim=fail (0-bit key) header.d=ethicsbowl.ca header.i=@ethicsbowl.ca header.b=Pc+mmqxY reason="key not found in DNS"; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethicsbowl.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethicsbowl.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ethicsbowl.ca header.i=@ethicsbowl.ca header.b="Pc+mmqxY"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84a2dcede83so2858219b3a.3
        for <regressions@lists.linux.dev>; Sat, 01 Aug 2026 07:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ethicsbowl.ca; s=google; t=1785595558; x=1786200358; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5QyIVdP2jnluVAcr0hBunwnf19HKMctrMwfdu/rLVKU=;
        b=Pc+mmqxYQTbqGCWJkWHqGMqlQdfswMtLZZ3MD6R/UMJntX/6cXy9b6hfhIc7kOgf4P
         CVFFGwjZWEjryK+exdz4MN3GuvMsxxxj7jU/krFJwNVRT8NcYdZXhq6M0DNtrJidOvLE
         mIZooFwgoSIPbMGr2Jo3Dl50Yd3ORAhp+UUW8geXQogxerUXcP+1XUBIZScKHStU8BI4
         ZMn9h9ASynQQo7by8Sd/hVp7US9wafVwlovHpSQ4eNMLwIpmgkIgAq/ZXjmKmVGkObEm
         R8k8/78ON/8R907qPnlWOUDjjEwi0O6PqsgD0MXxcWE7NEXBCxGtvMxBy5yCBYedbThn
         7rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785595558; x=1786200358;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5QyIVdP2jnluVAcr0hBunwnf19HKMctrMwfdu/rLVKU=;
        b=EI3s0KM9Mh6EINub8g6npYPGerD9LKgmdKmorVEfzOo7RvpgtL6r2hioSY/zfpYc9j
         VJfXDY3vg2tlSag4sgmLgH9hgkF4Qz+hGsAeaTNxKQJ6nTIlvvWjdUftvImQeJA+Pyud
         fhsUNDN6Ar+Gc8WXA7GdYWegLsTYJRlPRJJLl0M/ApMDfG1C+HM+Lk1DyI4CojCC4mI4
         WUopOIc8h/29Oa1iYboiWWcP4ej+Krs01DUlEU+Jrlogljmpn4ZjDIfrRDieGRmtrG2o
         DYwSk33EuDDwsH2kr2NQ8GWp6SwjlqnRA9GcNNkFH7BPSAMRmJdHa0vzSeYrpqiQ9Ohr
         LXwA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4BSi2qrUoWjNGlMPaFqKu9QVROR/mNBbrbhW+F4z3HTs4ud62H+989AkJxj/OU9fgscgyc5dzVRGBnw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1MBWpl0mzZL7APklOFgO+FTw3Xk7EMZdTWqSiF1t9pPi9A4Fc
	kVhbKX+UlE9e4WJH3+kBIyltsutJbrPx8ezAvzidrzaimCX4Dt/TTBPu5ETODm6EaSNFnbW6eAz
	shex3/cRZzA==
X-Gm-Gg: AR+sD11JhKAny3zJxHGip877Tl+MNL4/0j9WvZiQcwyLf+pa7EDb/Bqm6whuT2qoIdB
	LTKhf+MCf7Gc7PetraACt7JqvnPLgg6vmmMxidLeN370vxlIdmiR/wpXk0wxVRW6azaXzAtoQup
	5UXbpb7MiI1+hmB2B+mHTrYcRf3t7WTMKJou07h8TpJXIF/iSqWF0mj83EgLMHdke20nmwpLiX9
	jAttILbdlca5oAEBmb8A36AlYCmp4/OTRpuINtimx3EdOkHmj/1AGY6Be9HBdxRIfYCa6FSMr+7
	QAhiSNkH6ou2FIg6WFXQ/Qy7pJsv1nRbvpihlJSnSoeRwxlqv/024VE+olam8GuG+Mk1QxlRo3H
	RU0BAK4Uq7x6HZqWeIFs3dENTm9v/TwqYb17dxq45mtonwjdAqVFPNRjSKtBkQ6Pex9vRb7eChG
	DZUEKes4Reg3gyUYv88Bi7DNEwqX0YqmaH27zxYmMRHTU8e1Ga5b1K9f/93N8JcIuNhWmdO1YU2
	A==
X-Received: by 2002:a05:6a00:4146:b0:845:44c7:5e28 with SMTP id d2e1a72fcca58-84ee4834c90mr3325978b3a.31.1785595557756;
        Sat, 01 Aug 2026 07:45:57 -0700 (PDT)
Received: from [192.168.1.90] ([64.180.107.235])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39e9f22fsm1739760a12.22.2026.08.01.07.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 07:45:56 -0700 (PDT)
Message-ID: <977f3650-326d-4df9-843c-5e12194afc1f@ethicsbowl.ca>
Date: Sat, 1 Aug 2026 07:44:52 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Robert Munro <robert.munro@ethicsbowl.ca>
Subject: Re: [REGRESSION] bitland-mifs-wmi: power-saver write is accepted but
 profile remains balanced on Redmi Book Pro 14 2022
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Gladyshev Ilya <foxido@foxido.dev>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 regressions@lists.linux.dev, Mingyou Chen <qby140326@gmail.com>
References: <ae3f4f58-0326-45a2-bbee-b71ec44cd28a@ethicsbowl.ca>
 <e9fc777e-fccf-4173-a564-3846396ba6dd@leemhuis.info>
 <036a5e30-1eee-4dca-8fd0-268a1d6536eb@gmail.com>
Content-Language: en-US
In-Reply-To: <036a5e30-1eee-4dca-8fd0-268a1d6536eb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-07-21, Thorsten Leemhuis wrote:
> Side note: Robert, have you tried if latest 7.2-rc works any better?

No. I have now reproduced the same failure on:

     Kernel: 7.2.0-rc5-1-cachyos-rc
     bitland_mifs_wmi srcversion: 9A432DB17D1453AA4DD476C
     power-profiles-daemon: 0.30-3
     kernel taint: 0

Starting from balanced:

     $ powerprofilesctl set power-saver
     $ echo $?
     0
     $ powerprofilesctl get
     balanced
     $ cat /sys/firmware/acpi/platform_profile
     balanced
     $ cat 
/sys/devices/system/cpu/cpufreq/policy0/energy_performance_preference
     balance_power

I polled platform_profile every 20 ms around the request, which took
249 ms, and only observed "balanced"; it never transiently reported
"low-power". All CPU policies reported "balance_power". No relevant
kernel or power-profiles-daemon messages appeared.

Unlike my 7.1.3 report, the EPP is now "balance_power" rather than
"balance_performance", so the CPU-side behaviour is different. However,
7.2-rc5 does not fix the platform-profile part of the regression: the
request still returns success while platform_profile remains "balanced".

I asked the sol-max agent what the standard way to report this issue was 
and this mailing-list format is what it insisted I use. My apologies for 
that.


Regards,
Robert Munro
