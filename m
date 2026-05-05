Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4BA38F65D
	for <regressions@lists.linux.dev>; Tue,  5 May 2026 14:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777993148; cv=none; b=W2bifqzBkh7NsNvUCfOhyf/Y/zgkGbbHp9MKqmWujSWNXQP6yCLZaqrhBI96ksOMaiz3g1oh6a51ffAKN/3lLsom6AFo93fpVuqJTCBj7T8jHBo/YrWWP713NqHNfhN/wIJNVmI+s+bqoQoW2ZOkMDX8XIRIBNLrwAl9JN0J95M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777993148; c=relaxed/simple;
	bh=3ko3A4kimfuWBvgGqRXOJUht8CCrfn4FYAasG+Lug2c=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=deNdteiWcOlRyI8qMhOhuRTtjpJ/+K1eVSU48+OWa86SWOuP098IW21WrYNWErXA7a3Lw/yadjVE4rcRFYVvx4YbkTyBZqp/HmtQ18GyVXzUi6w1VcES/dEPmmzrwFXelIvE7KZbb3+xbz8kR4Dc0OHGGkY6ywjuTE4KQHmd1BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=eluZiZhp; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="eluZiZhp"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-130a4aae5ccso3771363c88.1
        for <regressions@lists.linux.dev>; Tue, 05 May 2026 07:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1777993146; x=1778597946; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+JNAHsC4qi6OiUkol5+kLRuL2+NBa4HUfFXhnGmjXY=;
        b=eluZiZhpV3J9VBS/zRla9TUBIhRFpMByHPC6pUEIzxzWiDz7dvvdyENBIoud3fWSL+
         teVIDrEaOZAn7GtGZWHDNJ5UjFKXwk7+E+W045tQEKZKpvuEdg8ej8N5lvNNb07QEvpr
         ssUe4HJYjzd+v6gojZ2pv8on7Ox87La/ZWHZtcVs9buQJYyP66dtAVNw9dPaV724Rgqw
         jt2bjkwtLwJ/tUqZ/JzIV1PoGYe6gJPji0MKv58l1a/O3OdOF/+WpTih7AvQjaaDpG+Y
         3lNtIPcuCRZWOl74vuE6h7JK/N69QFG6BK7P1q4YaN0f9cFJ698o+vOFkZ0+4I6LkvcX
         iHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777993146; x=1778597946;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V+JNAHsC4qi6OiUkol5+kLRuL2+NBa4HUfFXhnGmjXY=;
        b=V7gFRCG/4idqKqNzubdnTcBXq5DHK/Q505KdwZXIWI3I7UC6IthoV5OpQxs2npXsqJ
         o9U9m1eAx/ciM1ayfUGkB6V4LUHQKMcUBduNtX2bQTzIOfDV0pprgTpAilBJdYij8CDy
         oSG9TJpRiZfpmZgAT/50aAP43ZuaPjsvby+MfwblbPJufIY1c0pLqJpYsNSQS/AhLnkA
         06CT7W2KB6NNlqrQolC61sWFxfO+71TJ6KW9W6cC9kkGG7itRGm04k//h1WvXlDRHK4k
         ptnjcJNtVDFCaeAOEQR0PSonC7rSaTNdf4ObUeiE7fAsZlMhVNI+YHb8x75LXYBRKtZ0
         q8tA==
X-Gm-Message-State: AOJu0YxPDUM1XNmsg15i6OiW9/9s73GGy3qyaTkWdeZ7CXwHztVgQJ9Y
	+fJUUNmUA3WxGVldFQvxF80a618zkyOI0OsNsVwlqvgPJlGYaiDNh5Iv3ZLs4Xw5Wo0=
X-Gm-Gg: AeBDietQ2PgNEzYetgJpw6MxEn79IGxSgabeyd2d5AN+Pn7yobzH4YT9HNh94h7zwHU
	mvUs6mfNOxQbSQsD+L967Vu2wqG1T3lXIs4/et6XTquViskFG/dutyGulfQedfCYye3vM0x9BBY
	38ACg5xPTjHxxB6euv8Y7LuvKczLq+mbRUS/BvL+KHxmu3EYOCFc5SdisRx2mbBDFGdBYU+rC+K
	XRBa5wckTYBqQHW/yfKPpS2LRYjz5WUV7ZRJdESOYWAg8tDUP+BCWgwWvKKwdIndKVNwPxpbQlU
	omJJ5aGRMsBcMcmBSm1VLEXZw2A1U2b2bXoqDumjkVgadFm2c98GLEBe7r4cuc3Wi99DLothXF/
	WzinOHo4jwAtzJReKXhDMgTLRjQXDNF6e689GYS3FjnfBoMu46KuIliga9/V2IIwRH6tta9fmWN
	yjfz8fqnsE79K1EQGi8ZV/2CLmHBg=
X-Received: by 2002:a05:7022:523:b0:12d:ca31:f1b5 with SMTP id a92af1059eb24-12dfd81a74cmr7152860c88.26.1777993145586;
        Tue, 05 May 2026 07:59:05 -0700 (PDT)
Received: from 997d03828cfd ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8278e7dsm19358808c88.2.2026.05.05.07.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) variable 'jack_state' is
 uninitialized when
 used here [-Werror,-Wu...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 05 May 2026 14:59:04 -0000
Message-ID: <177799314451.2848.13872601558442495235@997d03828cfd>





Hello,

New build issue found on next/master:

---
 variable 'jack_state' is uninitialized when used here [-Werror,-Wuninitialized] in sound/soc/sdca/sdca_jack.o (sound/soc/sdca/sdca_jack.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:ed6f3327055b3d832c87e92ead3d68396560c4f5
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
- tags: next-20260505

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
/tmp/kci/linux/sound/soc/sdca/sdca_jack.c:211:5: error: variable 'jack_state' is uninitialized when used here [-Werror,-Wuninitialized]
  211 |                                 jack_state->mask |= type_get_mask(type);
      |                                 ^~~~~~~~~~
/tmp/kci/linux/sound/soc/sdca/sdca_jack.c:193:32: note: initialize the variable 'jack_state' to silence this warning
  193 |                 struct jack_state *jack_state;
      |                                              ^
      |                                               = NULL
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69f9efc40e4ee292cbd73c6a


#kernelci issue maestro:ed6f3327055b3d832c87e92ead3d68396560c4f5

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
