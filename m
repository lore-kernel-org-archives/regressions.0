Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795298143;
	b=30JsQXxOk3YLahee+VLZD+/SiVHl+qsd8txYUNnl+eilZprJKJiqklUKf6DFOusj2uey
	 +AVbpWjwyTlbyOhLoT2XdpB9b9mSnRmD/uHysPEvsoC3hOx2+KTewECPtmTJwS1vtaq9d
	 ExNGI1zMrER24Fz2qEKemtWpy1uuvdJWM/svRdxkBC6ymNjAC9eMnfKGhLC+EKI+Xchek
	 h9dismnNA6J9NTX/r8BJRnXyBm2H5dl3VCB9Ker2oG8VSxAGTcaag1X/CvrT9FZQS5mAv
	 eiNd5WZglAnYIN8J8fc8mI0uEo48xuWBPy/pXIrYypym8AFNeiSsrMr9WAdNBo7jvkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795298143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID;
	bh=KCjUtohJo1syh5AF9wt+LVHJxvbyrd0qzAwW5js+pGw=;
	b=hNr/B0Ga2KD9/KwKEwiZkIN5UYBgWQ6wQYnCrkAcjosvmqsggAo3wQJnhFJMnOjnhVNo
	 RiUeIwqa7jOe+AshHGwfTQveDD1eBjIa/VEVJKqUn5H5v3fdWPQjl0sYrdINwlKFy3I6K
	 aucych+guZ6Ou627ZyW3MP3TKEiHiYD6HzE7feV0WdUqsAarHJCYseErnEK0YtGW2De6d
	 9qxKAbtkoBig5lLBUH/M7TXMxID34/qnrvwzkcCuWt9RtY6fpKPA4MG852zG2MxtBLWMO
	 eYQm5ryEk3JIzR52TynR4IGc/6lCZg7PjKhkioq9TaM56az5kEwrNRIDO8HqegbL/nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p3uTuMzZ;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE16D606A33B
	for <regressions@lists.linux.dev>; Sat, 21 Nov 2026 21:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE16D606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p3uTuMzZ
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b88d143160so2418902a12.1
        for <regressions@lists.linux.dev>; Sat, 21 Nov 2026 13:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795298141; x=1795902941; darn=lists.linux.dev;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCjUtohJo1syh5AF9wt+LVHJxvbyrd0qzAwW5js+pGw=;
        b=p3uTuMzZfSHSm87qecJj+yoUPJJOYOm9F/jWl1i+BNg0UMUwbMjW/hoXQ36GGUpxFx
         QiQDXNvvnpL/wrWLLzR7GI+rZTbM4q0WN3eunupgDO4fny3lXMijROdVKiVsDnI9qQ7V
         ZNrkYwiBi3Oq6mj1/1Q8S7sMIpf5yforVY41hhZ5hvsr1Ku++XWC1oUFndHhPMT9c/ZH
         euqiI5Wtag892IKArp9CojoRn25FhDaNK83AaScJ1cCa3kOyYlME4K3dW6IiR1snmFHB
         zTDQ28P8NVrVNBcQ4bevG1nzyUnfzcotu7lQBGstt8XMjhp6AtomlHriWiZGY9VmkorE
         sxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795298141; x=1795902941;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCjUtohJo1syh5AF9wt+LVHJxvbyrd0qzAwW5js+pGw=;
        b=mQCbJhTn/mJEtTw7f/e8Sa9QurxjPsZktB1NK8u9CqdWfRHC9Rm/crGnOUgjnS5wCJ
         xw9k6SvCvluEtzQhOYGPBOkUF40XnOVdMbmipc/U43JMafPakTrCUV9Hxsj4DYNsqmqH
         Uy3mwAxlpSE1esOedsqWdK68gM4CU3jn9KCoykXOaGlHQL4/e9czEudt4eliBfsj7eDN
         HOvbsi+V+REZ+YHUVqXPYYL6DK3WSLgFKrqVHGDaQsUVxHJBru5mgcrnFH2CV9x8Qj92
         dJFmjb5fgK4zmXd4jRQxXzB7BL0guTR/VnyyzsMEBq9oDH2BdMqNBhNu4I4u8onE/IDA
         LyFw==
X-Forwarded-Encrypted: i=1; AL+hErF0yxXMY7ng74dyP4RyKgBpd1+F28lKxm/a4mSbxa5gUXvChO/HzhScpVQi8NOhILhbRx1FgJU/F3bRyQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8MdCmNm9OrjJf7mZcIMt0JDDFkefa3SRtDO71QT6XROZjJCh6l
	nNUa2qAjCPgq5UjqRXe7CjJGdhrQAuXm2NiXtQCHOTyoKZ2GS0JUsoFI
X-Gm-Gg: AZFdTZeuVc8sq7VexNf/bj/OCamRLbx7vAiUh6+nKRPTteLqmjVo+ss/Q0QPw4LQvxU
	4qMW7tVtaoCzqLArVPgiZyjSx5MaVVfUl7ZgYhiVOBz0ranUEiPaFFj6HmssUzhXKlXSyGu2NXg
	V/nUQsyu9rkme1Zh+ov8F2KEkZSl00hS8cWdGdp8fcuu6uidbGosqWkzM8yZERBlTUNQOfRmWr2
	1FItDcClA9/oGO9yTskGdVKFXYpwRuANEqVroVtwXwaRuHeKlMaYaZxlFRK2JrkjPhOsVVAhanT
	8uXcQFiagZtueel97DhcLG7g83nhxsuSfW5di7Jz7i2RcmP9m2Yn5RjOvAFu17YjS5YgW5nmIfe
	rhHCmMcewWtaUjILiDFFdJGzk+ckOBgJTEFsbbWX1igOx60dGk6+XsGY6wLyFOWtdiJmk+HqKcY
	29cs9tbptJkNdfX2o5GfyRlBvpoh/LT10XmOYIr9hCXIOTnHl+MNHywVtTw6m4p7Liz4+QaV7KV
	lPkKLcQJHuXnZhP5gLi5mxji7y4A2SQ70mp6Edx7oEHnV0erAwB6X/Izihp5KfGNt9ivcfEcNnG
	X/fdMoIpnGv9BexV8dLfqQzcYEbCfqhc
X-Received: by 2002:a05:6402:13cc:b0:6ba:88b9:71e6 with SMTP id 4fb4d7f45d1cf-6ba88b97656mr636301a12.14.1795298140925;
        Sat, 21 Nov 2026 13:55:40 -0800 (PST)
Received: from [192.168.1.182] ([2a0c:db40:0:80df::2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370faeeasm3038747a12.22.2026.11.21.13.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:55:39 -0800 (PST)
From: Konstantin Nikiforov <helllamer@gmail.com>
To: linux-raid@vger.kernel.org
Cc: linux-bcache@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Yu Kuai <yukuai@fygo.io>, Song Liu <song@kernel.org>,
 Coly Li <colyli@fygo.io>, Kent Overstreet <kent.overstreet@linux.dev>,
 magiclinan@didiglobal.com, xiao@kernel.org
Subject: Re: [PATCH] md/raid5: complete unsupported discards successfully
In-Reply-To: <179529607529.5.3302391929789139470@gmail.com>
References:
 <CAO96y0V6oncv54ihXnHfJMYiG_QAQ-NM8BOdqPDXKL8r8-kR9Q@mail.gmail.com>
 <179299857972.12222.2729359466842183358@gmail.com>
 <179529607529.5.3302391929789139470@gmail.com>
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
Date: Sun, 22 Nov 2026 00:55:36 +0300
Message-ID: <179529813639.2.16814857958553170519@gmail.com>

Hi Kuai,

A short follow-up to my tested-by report: I removed the udev rule that
zeroed discard_max_bytes from the md75 initramfs and disabled the host
copy, then tested the real HDD-backed stack with an actual discard.

Same kernel: 7.4.0-rc2-md75+, md-7.5 tip c526b7cd32f7 with b964c9240a37.
The stack advertises discard again:

  md126:   discard_max_bytes=2199023255040, discard_granularity=1048576
  bcache0: discard_max_bytes=2199023255040, discard_granularity=512

devices_handle_discard_safely is still at its default (N), so this is the
raid5_discard_limits() path the patch changes.

I created a 1G scratch LV on vgpcrd5 (dm -> bcache0 -> md126 on the three
ST1000DM010 HDDs) and issued one 64M discard:

  blkdiscard -o 0 -l 64M /dev/vgpcrd5/discardtest-md75
  exit 0
  /sys/block/bcache0/bcache/io_errors = 0
  bch_count_backing_io_errors in dmesg = 0

So the real bcache -> md126 -> HDD path also completes unsupported discards
successfully, not just the loop reproducer.  That was the last test item
pending from my earlier report.

Thanks,
Konstantin
DeepSeek Flash v4.1
