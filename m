Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296081;
	b=46l2Do/8DEKL8aMQOx/JvlJM+DJRLNut/tGMfmQmOwYSJBBqyx29Ol/eCYo3WUtDhA88
	 4aUnVbVpArTT1esL/Xri5yBzo7z5vMF+szS+oBM0bLASpGaIv2qT+HwhP2o4qDPRC1OKT
	 vqqIPsyhhPYrjCKFspKOC0AuBjSGe72mbh+WJG7HCgK+ej/3T7GER8YnoHuEzr/YCwGQq
	 /Cqpm+KHPmCGZtsUk4vF59Yr8z1GZPkUBm2Lo2w9csvDD5cwi4taKGEpZ62d2w67WWTB8
	 3qesEBOOQdvIkJVeAsEQpYv/MoIUXpcBvQQj89FBoXsjw+gbg7nXcsw1ve5m4/DzFuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID;
	bh=O3ljys2G/dfGrzQSHlcDxa7rlNuO9sIfulWEdwLNsJ0=;
	b=w9sPiTaeeSVrNtTfzCURmwmgwqZcUfr2Oi3mFQTUz+5dljE6MxCW1JUPPYuxenk7ogot
	 o15xlrpUdN/1L0jaRhoipLZY84Abxu2WMsDnpQ5rHQ9ZNUFTxiMP6Mk52B+37uNH80N14
	 xjIjl8p1huh7YHUs8IM7mzo7MKlQ8PhUewHPlSh4IvMjz/P8gn1DUOuWFhfOIp2aOGmfA
	 mqfk5fogHOotUqbtb7IB3j2oOeKPypcLqDjJiu+tIrMXFBNSaIEuTkSer+VJMUNb6xkL9
	 b9IpT6hsDHMPJTNd6I37xwGl/JiaYIjqqgkozw3dmvxp8XoD1TRODQ0sfMBj0HGErFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0BOdCix8;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1794606A331
	for <regressions@lists.linux.dev>; Sat, 21 Nov 2026 21:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1794606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0BOdCix8
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4322d310e7so370074166b.0
        for <regressions@lists.linux.dev>; Sat, 21 Nov 2026 13:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795296079; x=1795900879; darn=lists.linux.dev;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3ljys2G/dfGrzQSHlcDxa7rlNuO9sIfulWEdwLNsJ0=;
        b=0BOdCix8z7f8oPIqjXk2qIzxsrNgqaU25cJVAEH4ONeAJAVT6/4JZT4Rio4mRn5XLZ
         KJUs4TUx2yuD/bE4RNF9A0ZxsAGGXvj/451kiL+ecXQmR8fymnVau8zIt/j3BM0KL9yd
         cesnwXyF1XfK5oI4u8Ot0HvO3LbO7vdWsKHlipcGZ2TbutSBjiXv/LluilVuSLswJpHw
         0+in2R/yCDQnwCsv6HjRlh2M2XxaWvYG6bj6WNxo9FvI+fJKBJ0RF6Hzp2sKRZUNy6vT
         seyZFNDlPq8yzbP/5j2iE5DBV0pVb/LSWmrpM0P7IHnAViHS0YYqE6CSjiQE15a/kQgy
         1yZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296079; x=1795900879;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3ljys2G/dfGrzQSHlcDxa7rlNuO9sIfulWEdwLNsJ0=;
        b=aGD6sH7pA3uD83MWg1+uXhmt48p9PObCj2LBAa8vHbOroNjRsDeIU4oCCN2bERiYjs
         l0kqEeZ6h6Ov8cCO7f9oRWbtrEwmSA/DraLik4hcI43e2rcGnfmelzy0dUanvte72Scr
         WFttGR37xBF2zL8kufpUWF+VDS0vswDDkErPnf1JyebL7uFzW3QvsJ1pj8r4yLsxF0VR
         gBIRlMlR6wTuvCDJyGwquCYjuFZzu8czcL5YTP23Z9KNDRf1ZSSzmnF5Fz4Sjjt5d5hF
         wo74a4vI3K6XltN7pOAXXwG9USgFiSq5XMbLiCT8Y+TuirP30EdAPM7qJJ4QQErO2+Nx
         B5Xg==
X-Forwarded-Encrypted: i=1; AL+hErFFIgF4vuIbGZW0HdwLucCyefJeBzyBwdLLMRX+pmn0xeS6iGCEr6SMZLDnzgPyq1qjwIQVWIvEyFgGvw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9RQWjQtCIwULgsrq8BFkvPSi0NxH0iK1mb/JvO51UfgcaLQnyB
	PcDOKHkKG/btu02Ie2HUcmwjMDu1ekV8CtQideUXg+fVOvax+Da54UK0
X-Gm-Gg: AZFdTZdc4rnZrpo75Ct0KWirHTVY1TChP9WkRIV/Xx4VQu0KoH0wYlw89uJwVij7MKc
	3ZU+w/pTW2rmpmwkHyZ9hVUJwmxg2p9xlr4ogSDd7CoOK9ayBFkhyqpWDD67JJlmjOn+8AyqMWi
	ypPrYiOYZEtQ1m3Fml1riu1v5p4fuOG5M2AZua/SwcIkNOmHVgaMCHr/+JvFM3aZB4eMjxOpzxc
	NW7JlZw2XOA/TsuMz4DudowfRldRO5PSbKyfnGg72fSoNWvhR+wblXL7jLjg/GmPHJXJlb7qRvW
	qlSx4vmOIaXFfwNnJV5KzoQ64rQCqJOZVtgKGCqj3F1aQ557HcTP2gWf7YosY6I60EJy9AqOqFA
	AUyIizdukKmIIYwmhYjmSpBl3Ixwz/wMdY9wKQ77OveM1SL4LDa7XTYUj1yReZCRBw2p4OoyVJd
	Ttq8Ja/0EywaBbYCpxiv6w0Jf0foOl/haDM7VDAJNHoEfmvA82Ron431RW8gzFV36FAq97zMRMR
	au9Lf+GyuERNmZotEpwLyx8ApiFkVNY7dWZulyNaf/5oc4DkWAsLZA/rDYGjTALlpRlDUvrPeZV
	TaBdj3NEkWGdrVZ8ATDtSB+nhvE=
X-Received: by 2002:a17:906:7f01:b0:c4d:2867:281c with SMTP id a640c23a62f3a-c513a89466dmr477367466b.1.1795296079086;
        Sat, 21 Nov 2026 13:21:19 -0800 (PST)
Received: from [172.17.0.1] ([2a0c:db40:0:80df::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010a6sm243362266b.7.2026.11.21.13.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:21:17 -0800 (PST)
From: Konstantin Nikiforov <helllamer@gmail.com>
To: linux-raid@vger.kernel.org
Cc: linux-bcache@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Yu Kuai <yukuai@fygo.io>, Song Liu <song@kernel.org>,
 Coly Li <colyli@fygo.io>, Kent Overstreet <kent.overstreet@linux.dev>,
 magiclinan@didiglobal.com, xiao@kernel.org
Subject: Re: [PATCH] md/raid5: complete unsupported discards successfully
In-Reply-To: <179299857972.12222.2729359466842183358@gmail.com>
References:
 <CAO96y0V6oncv54ihXnHfJMYiG_QAQ-NM8BOdqPDXKL8r8-kR9Q@mail.gmail.com>
 <179299857972.12222.2729359466842183358@gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date: Sun, 22 Nov 2026 00:21:15 +0300
Message-ID: <179529607529.5.3302391929789139470@gmail.com>

Hi Kuai,

I built and tested md-7.5 with b964c9240a37 on the machine from the
regression report.  The reproducer passes and the machine runs without
backing-device errors.

Tested tree
-----------
md-7.5 tip c526b7cd32f7, based on v7.4-rc2, with b964c9240a37 applied.
Built as 7.4.0-rc2-md75+ (x86_64, Arch config, gcc 16.2.1) and booted
on the affected machine.

Reproducer
----------
Three 256M loop files -> raid5 (64K chunk, metadata 1.2) -> bcache
backing device.  devices_handle_discard_safely is left at its default
(N), so the array takes the raid5_discard_limits() path changed by the
patch.

  md125: discard_max_bytes=2199023255040, discard_granularity=131072
  blkdiscard 8M on md125: exit 0
  bcache1 over md125: discard_max_bytes=2199023255040
  4x blkdiscard 8M on bcache1: io_errors=0, no
  bch_count_backing_io_errors lines in dmesg

The same reproducer gave io_errors=4 with the unpatched 7.2.11 module.
With the patched 7.2.11 module, and now with this kernel, it stays 0.

Affected machine
----------------
3x ST1000DM010 (no TRIM) -> md126 raid5 -> bcache0 (NVMe cache
attached, writethrough) -> LVM -> ext4/btrfs root.

Since booting 7.4.0-rc2-md75+, md126 and md127 are [UUU],
/sys/block/bcache0/bcache/io_errors is 0, and dmesg has no
bch_count_backing_io_errors or md/bcache I/O errors.

Caveat: the local workaround (udev rule zeroing discard_max_bytes on
md*/bcache*, plus nodiscard mounts) is still in the initramfs, so the
HDD-backed array has not received discards on this boot.  The loop
reproducer is what exercises the changed code path.  I can do a
no-workaround boot and a scratch-LV discard test if you want that
before this goes to stable.

Note: 7.2.y is EOL (7.2.15, 2026-11-01), so the "Cc: stable # 7.2" is
stale; v7.3.5 still has the old code, so the fix is needed in 7.3.y
once this reaches mainline.

Tested-by: Konstantin Nikiforov <helllamer@gmail.com>

#regzbot fix: md/raid5: complete unsupported discards successfully

Thanks,
Konstantin
DeepSeek Harness 0.2.2-rc.5; model: deepseek-flash
