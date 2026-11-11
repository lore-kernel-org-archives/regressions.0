Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371010;
	b=kgdFbMrlLCS1VF1fgTnQHZ37xdIgCPX4dJF1xWx9f6bXBgo/4uZtHv6wC5o3eaBc2p4/
	 6jf5Kil65se7gDrN2NP3u7zbhNv8akLbOSx96QWHAWNWsn5LHRM52+I+H/ledtAvSEXEg
	 RU2vqeuBgTH0ckaiQ+jgCcMuVCwTS6yM4fnKzQJItXRtF7QBI5VY4yIoU6n/crPPxtL2B
	 7iDMAN91hbE6NFtZiwFrWWzJnRsgrIfZ70Tg5JYpBbZikPE4NpVVmmgW0I38CIPspVLqY
	 2pPFfx0TLV51Jn1LbKDJNWJvr5A5JtvXsRdmPG/WDB8Xr2uY1C5kNtkSozAneRxrTTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8TP2cltB6myhAN3zqq3XC6T8gNcR9V3LAoG3G2EM6wY=;
	b=Wv+c+jdetnKfoXttImhC7hIYw+gsiq9ztsTqDklQdHrypORI5YrlllLQC7vSogn8yi9C
	 mpETUv/IMM9f/iuVK/ayMCMie78dDm4EIb/GObFY1g89mOEM/Tyy9+f4j4LG9/MrMEgd8
	 D88B5njVjOexJnmQZ0sDlbD2MV1gSeKV300+urIstKmPsPqr4aS1rz8rfZsiMTjGMz+bk
	 yhAe/VunEmy2wVuu02Iu/fLj3qPOhLLduogmndcx4wcX2rNzqd7V4ehLpl7SMUk2+OdH5
	 +NqgkpIgspryejVeu8TB5riROvWAX2P40A0wekOQ1cFFJ6nZGbsIRsMszKVpc+eO4Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="K/wOb/OK";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85A4606A320
	for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 04:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B85A4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K/wOb/OK
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b24f4b15c4so768747c88.1
        for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 20:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371009; x=1794975809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TP2cltB6myhAN3zqq3XC6T8gNcR9V3LAoG3G2EM6wY=;
        b=K/wOb/OKyTcHSfRUPmncdWLPMpj09SHFmLZsbAZAx9ePKzSsB4pHlko8FeDdAUe95A
         ZRw3iWxz5pJ9sQcgZInPmAo0BHN25pEFxMGVNNvwC7N/rEddjY1zWkkIGR7O2E0zlcQb
         FvIBlxUWDaXOnUn4NCMjE1iAZLusSkJ/1s6QD/KPaZ4YPTZv+xA9fA9fxA4/3aw7xt+H
         Q3CeWL2aE92ArSDcUNsrqrxDKAMVoDzzvLl3ARUSf2AdEJJ89F4T/LxMSJMP+UrJI+lN
         zvhrPmtPDeleZtTFrnS8CSEIW2R3wzHrRrLa/FNCeacvM1N0PnCEXOknWGCxoj+ouv6F
         MZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371009; x=1794975809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8TP2cltB6myhAN3zqq3XC6T8gNcR9V3LAoG3G2EM6wY=;
        b=MCjVwBuuEzH9ATac/VLkCDpyD+us4jrYa3DdGRGQLMjOiAhpIvSJmbXFWwQooflEhJ
         h1jkjEwAWE0KDdgQDSgwhKTT7refaxgP/U5MDWvgXHXNkLNaUMAmq2uzgMbRheDVK+SM
         c9fsMf3ukqrBDMtP+YoYPHECMt6X+CBDXbOTAgL/GFjys9qBe08Wj44rrjeT3gteFX7R
         v6+SfglQ0AH5Gq4E7oKuako37XZrHr5R8Q9YR4kPd1U3PhEPvqVQTlqGi/zpX1WiBVWH
         +PM5cNqiOkMWCSvfr4VtpurgTZF+u6E9wV1vkdCo4oEDLsyFvYj+oxhmKfM8AHctPoIJ
         Ktfw==
X-Forwarded-Encrypted: i=1; AL+hErFV6Oc02EbADjLDpCaH9BCp+sAE0R1PY/oAORf9L+KtK6V9R/I49/fvr3puXEOJLbA7t6mJbUQ7eyv6Ww==@lists.linux.dev
X-Gm-Message-State: APuU4Z/G/t6KBhP5ngqZqi+00J4l3f0bUHO7kLjQPd3nu/JA8JdpnqTN
	6sCA0X1D2racz5piwA4SA+fE/mqtrmtt/qwFzJ5x8F1qZk1WmbZ7hnNJ
X-Gm-Gg: AYBFou2s+bmLHFVCUa4ukAV84crAc41OmMimkw6hmdR+ji3dk3DdZMTTkLnUeHjULtb
	rT8w/FC85TmDfIjVLp1EplBKBotqWMPVoL2tmvTzdEjs/IR6Q+acAcRSFDUkRxx38AIE10knFft
	Ke9pS9aTOYUh83lKUb4sboORFTwQ2SjkJDt7yQ8VpZH2b8ht9dEd6yXcGwdyZv5dacQCY+vDstb
	KSs81iPiXeitBodByl34RehdqxERMoPOqsDDXo/u0rwDQe6Qn6zhIoOfj27S3kY7KiB53ODB07D
	RGY+Pkjjm/fnP+X7pLpvIn0hG5woYsxhsRUoz327RyBOl6rnZISwHKuKXHTPyWwyMtvWz7SZu6a
	itZAzM2zQ0ySjS5dFZJzgc4uJcN3bIuZWw0G2AbPPVIW/xSs7oUtmGadht1Hk3RyXFWeNq7Ybi/
	FVPSSgstYD5dbVHkPpV4iK0l8+NjhqXIRQNzhRiqE89a5SFx7jsIAtq7XjianAdTFgeLL5OZKy8
	ejKKHKPRfD5nsqAEn9l+8Cu73pI0P9XvE1wZ46ORlB6H/R0ZB48S3b8mH3zs+0fmjNPwXSeAOWM
	JEcHXNcNcL7wprVp2gUeKWANN4sJHoYH/gmYp0ZvDkMg4V6FdKS1L+zbNouXM0FYz610FePmTKF
	1Z2nOCmT3QDA=
X-Received: by 2002:a05:7022:130d:b0:1b2:3e1d:17ee with SMTP id a92af1059eb24-1b3bef0a955mr1889024c88.9.1794371008492;
        Tue, 10 Nov 2026 20:23:28 -0800 (PST)
Received: from LAPTOP-KD1TH5BD.tail375eb4.ts.net ([47.11.96.168])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11150sm15985536c88.5.2026.11.10.20.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:23:27 -0800 (PST)
From: Gopal Malaviya <gopalmalaviya53@gmail.com>
To: alireza.haddadi@it.uu.se
Cc: jack@suse.cz,
	willy@infradead.org,
	akpm@linux-foundation.org,
	vishal.moola@gmail.com,
	fujunjie1@qq.com,
	roman.gushchin@linux.dev,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	tracekotae@gmail.com
Subject: Re: [PATCH] mm/filemap: let sequential faults restart mmap readahead
Date: Wed, 11 Nov 2026 04:23:10 +0000
Message-ID: <20261111042310.191979-1-gopalmalaviya53@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109-mmap-miss-v1-1-8b44b33f3358@it.uu.se>
References: <20261109-mmap-miss-v1-1-8b44b33f3358@it.uu.se>
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

Hi Alireza,

I had sent a different fix for the same regression [1], reported by
Trace in [2]. Jan prefers yours, so I have dropped mine. I ran your
patch, also with the v2 change you describe to Jan, through the tests
I had: a KVM guest (x86_64, 2 vCPUs, 3 GiB), mm-hotfixes-unstable as
of 2026-11-08, ext4 and XFS with 16 KiB blocks on virtio-blk,
read_ahead_kb 128 unless noted.

The reproducer from [2] (2000 single-page faults 1 MiB apart, then a
64 MiB sequential read), major faults in the sequential part:

                       base   as posted   with v2 change
  ext4                16384           2                2
  XFS, 16 KiB blocks   4096        4096                2

Touching 1% of the pages of a cold 20 GiB file, larger than memory, in
random runs of 1, 2 or 4 adjacent pages, MiB read from disk with the
v2 change (first of two runs; the second was within 10%):

                       read_ahead_kb 128     read_ahead_kb 8192
                        base   with v2        base   with v2
  random                 259       234        1057      1070
  stride 2053 pages      271       236         992       992
  random 2-page runs     257       373        1135      2538
  random 4-page runs     240      1146        1200     57748

The 4-page runs at read_ahead_kb 8192, which is what this guest's
virtio-blk disk gets by default, read about 48 times more. As far as I
can tell, each run now has two misses and up to two hits on the new
window, so mmap_miss stays around MMAP_LOTSAMISS, and each time it is
back at the limit the next random miss gets the full 8 MiB
read-around. My patch ran into the same and kept mmap_miss at its cap
on that path; something like that may help here, but you and Jan know
this better.

On the Fixes tag: with the commits of the series built one by one,
commit 0b9c0aeba938 ("mm/filemap: count only the faulting address as
a mmap hit") alone does not show the problem (1 major fault with the
reproducer), and commit 9b0fcac3cfe7 ("mm/filemap: do not count
FAULT_FLAG_TRIED retries as mmap hits") does (16384). [2] is the same
regression, in case you want to add Reported-by and Closes tags for
regzbot.

I am happy to run these again on your v2. The tests were set up with
the help of an AI assistant.

[1] https://lore.kernel.org/all/20261109091444.128521-1-gopalmalaviya53@gmail.com/
[2] https://lore.kernel.org/all/20261105192517.228523-1-tracekotae@gmail.com/

Thanks,
Gopal
