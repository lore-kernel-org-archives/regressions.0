Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658346;
	b=ou6R1hfw7djCFQmF9dhn5z1Ned5vbJ9wRwmla8CU43I8sj3PMOk46yx8p2diXJ1NhAV6
	 bXfpCBsOThJmVORgB6cNPIF7ttjlXXuRQrXMon953MOjosSyoDQY985AYBfqx6y8LHabq
	 uDutsZOZBXS2ZiDmPNUW+UQKTuP4G7g5NRmdqEmjSZ5YXy3qH8uvyJiOgy4Zdj4TQxjsB
	 RvIDMHWwoOwpuUn6bKKPeU0tHQWZGZxxVqaSfpBbPxJPCAhJr3r66JuDl2CsvngisWV6U
	 oRcx7+0rfsllPHR3sTYFFN65oWLU4L7jr8AGD8K8gYS570V8P51Ylre1jsXajHKF4OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=RItvsZSZ4nMlOicP9PBoYcNVkPyxrefYEhhq/daX+N4=;
	b=SQFHnOtahl2Y/Q6JfBPoNXtmltY+sdGO4ijz6mHehVeHnx8JiEJ97/ROXp5v1w4BGXK6
	 wEqxdZkj7GBq6kG9nPbdws6qwP7Q2PqO4O5LPTPylJRzZXm4Ey3/XjqFY5Mxf4SF5cBE2
	 M7W/FPPa5E02/Wxo8ecL5B/in7cEskIIlAZi/Zj9IIUOm8DWEYXK0fv+u34IX5cKz7z0v
	 6waE4272w9Ah5G6dSbhW3OO48Sl/64tRAUIUmso7/OUk6eftsPHiIEgphb7JyvhK7l+1S
	 NGwRLR4k0Ij/faAuXMozDyYhWz5IdYAcah3FHSa8FYfeO48WyZE9Avyp9fSieYZ47Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=L9NwsCzD;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF28606A31E
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 01:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CF28606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=L9NwsCzD
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3869f03af6aso5664299eec.1
        for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 17:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1795658344; x=1796263144; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RItvsZSZ4nMlOicP9PBoYcNVkPyxrefYEhhq/daX+N4=;
        b=L9NwsCzD19rItWYVXaiDcAlCA7okTmWFzSQ1W8dj7mZJwief8xFkmZIt0UKRVqus/Q
         U8YHLfAzpH4LIhXpWWi44zgjVXFH6+n7UPP4uUlTLw3DlSscGv4bH+o4e7As5K0y+Kt/
         JK8z0P/wUttqGuX2RpWtWbWlGynBX/2R2ZPw2ULia3W4NOH4/etM+NSs8IpYYV4UnHLw
         uSHiWgNczNdix53hCGe4pKD04WlQ6S4MNsNG6qE0SSRECwtDtJF2APWSX8vFZwhTYnLa
         zjniwzQwkhTfTriXZXeVHipD3MHYwdtTtFEblKnHsLLx581V/2hF08n47oLdZQPQVQHx
         sM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658344; x=1796263144;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RItvsZSZ4nMlOicP9PBoYcNVkPyxrefYEhhq/daX+N4=;
        b=XGQU4Ef+Wwdds2KW7hrBqRfZA1GIKyP2/2f4mw4FiNZ2GfcufEdJL3bF/PqQ4B59qj
         lLNsh+IJ1cQCECtesIY4wKTl0g8balQoKT+/Dt8a8KKGSb4faqEA7+WvmY+cXMFGTx7K
         Yg4bQ5miOuX8l91BgrQs9+dBRAcPYIJuDORwGRx9/BPKWFCxqCORu32lES1uDIfSwuXX
         iSy/6cZxe476jq4SmZHpn9cPq7qK2Lyr0M4TE25jDjHofzBeW5orq9OiM98p1/AsysVo
         TKw9zxZqEflBphxXbU//rfMhgCBtELwBOpAKI2MWYoYTdmXGin8cocggnCsnEOBlAs/c
         TfkA==
X-Gm-Message-State: APuU4Z9Uw6rGObkX78U4GynLK7HtDcif2fs9ylM2SDptgFzKudT0Jt5m
	oa708N0CIaexcuVMG2sRwR4OIVzsI8OTykl7O/m0b+NWUSo23+jQhtKQjE8mCrJ+r4XMKcYOjKt
	J2LDV
X-Gm-Gg: AZFdTZdFkvUPnigC4IqjgDaDkFIPTDDJ3+Q6fxwEXX8MlTvv/hdUNyKgODBMKDfi55r
	kaljTMmCS1UeOzxy9Po+NgSnywGJhq+yWcLzq34lFjpOUWJkLBQ0XDHccv71rh4FQA29MofynDp
	ylSZzU7dqmkFJUJ6S2iTlUl3hg66HXSADXPxZULrOhOGW3XLSzRECVX3DOTBLeb+GV/WpbBUuOh
	6ThPH3X+tbk8gHnrq//+o0iDgnfOPNLQ2m5CovOaM7+3aAcCzldzr485mquv1hy12rZXHken5Fn
	fK4iafRhKrK1AbwH0tgsvQku6q5/dvWuZRawyDp5OfXxZI9t8cxFCxA6l0ofkqTJJebuHMEveH1
	eejJJ2zSGcAx+4NF4k+t3MxOzxIlsH543+BNmDorWEfQx+ShIoh+/0SkjW11X82N68YtFPkhPXc
	pBS0zpu0aiaC1lK5Q0n+Nkbg8UJUtLr6oKo48HtPIyL/MmdWyJzne4Nls1JZ5cC0vOnn2/mcn4q
	G+wpd8PMxvqQVS42NErjDfGRESW4smq+sRSvc44wCgUzUQ/TYrGLTIdeBOteJO5iOKmRAgQPlHA
	JYjaylI93KaDDcuSAG9m5g==
X-Received: by 2002:a05:693c:880c:20b0:386:ab85:a011 with SMTP id 5a478bee46e88-386ab85a718mr12232166eec.27.1795658344260;
        Wed, 25 Nov 2026 17:59:04 -0800 (PST)
Received: from 52d83ede7c60 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm69828349eec.4.2026.11.25.17.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build)Error in
 /tmp/kci/kernel_build/python/exported-sql-viewer.py.mypy_l...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 26 Nov 2026 01:59:03 -0000
Message-ID: <179565834336.126257.13425349986063073932@kernelci.org>

Cc from: regression/mainline.yaml

New build issue found on mainline/master:

---
Error in /tmp/kci/kernel_build/python/exported-sql-viewer.py.mypy_log (Build:92) [logspec:kbuild,kbuild.other]
---

Log excerpt:
=====================================================
make[3]: *** [Build:92: /tmp/kci/kernel_build/python/exported-sql-viewer.py.mypy_log] Error 1

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179565834336.126257.13425349986063073932@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:e2faf068afb79fc4f5ea3e8be7310c1e7279e2f6
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  ebb7a8dc1e74c705daffe11c2faf38ec2628f838

# Builds where the incident occurred:

## defconfig+lab-setup+perf+perf-arm64 on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6b077fc4286e1965ecba0621

#kernelci issue maestro:e2faf068afb79fc4f5ea3e8be7310c1e7279e2f6

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
