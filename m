Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906713;
	b=lwqzZDkRhf6mheQ83UBJNo1yx+tZ1oAMLjjpN+l5rHtwVQyOQ0q+JPxn86n/UVfQrxMj
	 AFoZ5tmUkpyE2GPbnnWAa0rPPsa5B7zshdLqNTw3gYT8ZoItQo43kQS5YrxN8dzuxX8UN
	 ndVhN8Vd7ywaEGczuWTR56XPHB0Mf3IuD9+HwDqgd21KRNMz5EGNOVmshBmFtSSOkOmxH
	 wSS67JnMuifLLdc+h5VEDnTIvPAl22Rn2yB+50IU1bs1xnLkwLNhCJkXnK9LN7K2LMdzX
	 hoqWbyvQbybdXHZDjNQ4iQyk9BLpsT3UOdY3e9zsNfBVgEgbMVgLz+UqSsJp6z3zXlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pK7uBulsQM5HxeaDcs0VER9nyKXu9clIhlJ8nf2FkJ0=;
	b=Y4aIDQA4ryVkgjUuNLmgHqoAezMUW3aiD2auyQwkcF98kPqRwCVLMwA/CvjayrwQX452
	 VCNaUV1fJKmtxHhaCrJMIbmkzG1ftPVIirEXyhf+iHzMJ545Fw5m55Ekr79Z5pm+svWCx
	 IIZkhf2o02yZL3lV2nQN2yrwZaDP2ZMtFuzxlIHbfd/6HlFCtJ6f2Zl8Tgd27WVjbjQL0
	 lavnaWEIKJo7r2GY+i82zX1JanKwTVYIJqfTTbx91Wa/5Jqx3Sevkf+Q+Go20Yi2N7gri
	 Y3F/CP0D6ZpVvGRtfQoO+15jEU3MoG2hhZdu7k2qKel+uNexi5EghcMGKZNgDqCZ3MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qybqYHme;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E072606A326
	for <regressions@lists.linux.dev>; Thu,  5 Nov 2026 19:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E072606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qybqYHme
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3acd239776cso19842221fa.0
        for <regressions@lists.linux.dev>; Thu, 05 Nov 2026 11:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793906712; x=1794511512; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pK7uBulsQM5HxeaDcs0VER9nyKXu9clIhlJ8nf2FkJ0=;
        b=qybqYHmeI2DHnzK3VBBZqZZO9JHMo7lEaR4WGfjumOBNCDSYBUIeSTYmyu0eWJ/jwu
         Ah0/h6n5iWjaot2Bmy7HvmKzqIo5I0THSEPie/uOhEhIiKvuDCuHVL4KtzYRZLj0BQJA
         8r4J674hSOJ8D58LskIQQhVMuE8v7AS7lkRtpBg6b8zlTdbF+WfGL8XQR9neZjZasqMJ
         IEVJ+0C5k1BGFaT9MaXx0LEV/mWnykaFWwi1KPY3TNfHvsf7XF39xz7kiRYcnZPnHfuZ
         nVXxkOyFh5UbnPbzsvlJ2ETr5gBE5snoIVaZVHDGDERhLWTng27OXJxtwrma6sgtqpLv
         hW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793906712; x=1794511512;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pK7uBulsQM5HxeaDcs0VER9nyKXu9clIhlJ8nf2FkJ0=;
        b=wT0EIdp7XF1WsaGEBaMmS8hgiXIKO6I1CK30Bspj7vo9SOKpACK/VOXDINh55GGP0U
         dS+RnMnBfBq86Jp1X6INLSD5d1p61bxJxB6jw4jBudPm4wTN26A+npBG1CoZndC0EvJZ
         hW6VGb9asC5AtNv8QpH14jJo093Nl+SlM3uvNGlAJ1tt2fxAO8DadDzjVky7OIuYsX6d
         7UvNo0V/O/0BUEDH9IqR7pTN06GgautTArHEzbLdF7qbz8TS503D+MySBWDg6JgoB8GC
         LvRfbnOCoyJ0MGn8Owb7FOlAo0H98IhETPLmjbAJBnFTLOAUg8Er/wjMU9+PCFlQEcQG
         3Svg==
X-Gm-Message-State: APuU4Z/RKMJD/AJZmBcOsUSIb3j6d06JmySsp+a6w9B5K0lp1y484W62
	45M1Mdd14TpDBKR0kzdl0b/U1c1ZP/Q24jrqyC+FZUo/0GNUvoy5Rir/
X-Gm-Gg: AYBFou05ZmV/qD54WhKMoA78HulsUW/uDvHkKXYqGP085xU9fkAOWF9H6knYF87z9+K
	aGt6+QCuASlhj0JB3Z/Ds93cjB5eZnudGS5Kdkwoq4QGE/dADpGjZCyz8J6C5A+fl2FW242K5cE
	G+3phQhrO7V2X7w/ktWaDFPcAVoWB6ECnCkoRgX6nKdaTsfA13uENpqYrNl4lsbu8wVRxDhgssr
	FCH7prD8pJ5r0F0FsDJAusduGqk7PhLGa9Y45lzNVvkJniNlE4XqWIyrRpDgocnATF1V1BQYR1H
	erv6lJS0GEWN+avlAY7HWxxZAgKvifYbN345UXg6Nv0OAkl6CMJg1diFbw81KkovsWCLUJGznOs
	SurImVYJesO7EDDNruIoQ2lOEHRD4n2rNCIOrgNhl8J/MnweJ5E/TgVTHAakWYT3usPmj4sed84
	Ru/U+B2Nv5oBeUB70q0eecilUytio//0+utRnEUv0kz+MoaG0eoS+lXJ6whbJRre1Ken8E8ow56
	m/zteCwA9MwoH6uKrdzIwaNLHtJW8kXbbfp4hC7mLb9VKm4268fTG/K1VMvDVB1eNDHGmMTDbgw
	0QufEYIIwC5TWYI/DXmrXG1BD6irJCadM0jYbCdsuI4=
X-Received: by 2002:a05:651c:1614:b0:3ac:974c:64f3 with SMTP id 38308e7fff4ca-3acf3e57dcamr438661fa.22.1793906711385;
        Thu, 05 Nov 2026 11:25:11 -0800 (PST)
Received: from localhost.localdomain ([185.65.135.248])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6ea213sm12015791fa.34.2026.11.05.11.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:25:10 -0800 (PST)
From: Trace <tracekotae@gmail.com>
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Honglei Huang <honghuan@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [REGRESSION 6.18.y] Please backport 342981fff328 ("drm/amdgpu: drop retry loop in amdgpu_hmm_range_get_pages")
Date: Thu,  5 Nov 2026 20:25:03 +0100
Message-ID: <20261105192503.228363-1-tracekotae@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Hello,

please consider upstream commit 342981fff328 ("drm/amdgpu: drop retry loop
in amdgpu_hmm_range_get_pages") for 6.18.y, 6.12.y and 6.6.y.

6.18.57, 6.12.114 and 6.6.160 took 962d684b5dc0 ("drm/amdgpu: fix
amdgpu_hmm_range_get_pages", cherry-picked from c08972f55594). As the commit
message of 342981fff328 explains, that change leaves the -EBUSY retry loop
spinning for the full timeout. 7.0.13 and 7.1.1 took the follow-up. These three
branches did not, and it carries no Fixes: or stable tag. It is not in 6.18.60,
6.12.115 or 6.6.161, and is not in the queue as of 2026-11-05.

The cost on a Radeon AI PRO R9700 with ROCm, a PyTorch speech model loaded
from safetensors:

  6.18.56 and before:  model load 6-7.5 s
  6.18.57:             model load 507 s
  6.18.59:             model load 514 s
  7.3.0:               model load 16 s with a cold page cache, 8.4 s warm

With the same 679-character text and voice on the same image, it renders
at 0.11x realtime on 6.18.59 and 0.73x on 7.3.0, against about 0.9x before
6.18.57.

The loading thread sits at 99% system time in kfd_ioctl ->
svm_range_set_attr -> svm_range_validate_and_map ->
amdgpu_hmm_range_get_pages -> hmm_range_fault.
https://github.com/ROCm/TheRock/issues/9257 reports the same stall on a gfx1100
card.

The patch does not apply cleanly. On 6.18.60 only the first hunk's context
differs, as hmm_range is still a pointer there. 6.12.115 fails on the same hunk
and 6.6.161 on both. I have not built or run a backport.

#regzbot introduced: v6.18.56..v6.18.57

Thanks,
Trace
