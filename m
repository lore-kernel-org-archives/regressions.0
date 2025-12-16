Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA5927FD75
	for <regressions@lists.linux.dev>; Tue, 16 Dec 2025 02:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765853948; cv=none; b=jG8lSJpn6eeYarn+4D8kYCQcNbgG3gP1I0soncnT/Q5sfgNuQqZvqC+utdUOcUouV8YA8intYxF4VevQa9Nk8IX3T3jz9K8ZK3qIdn2LHR094a4pR6JfUWCiGxnv6sxF8nulMJaFoNBSHem2Uv7E3DJguCU1CMUzdjo1KmJaUG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765853948; c=relaxed/simple;
	bh=DUsH4njXYV/87KI9/shJLeF1p067+v/sEI1OXGiiHgo=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=B8kwiLcFhyGkwrYt9Afmz4rf6gJL4OXzNctKltI1/6aQNdZlCiML/Y7XsWSC0O2Y4LDoNCGqVHdHggTIHMTHkLUmK9rw7DtDexrMvB5lT5VbmAbaDF7sL4ZGPNvfbDrR2hleiNF/roj8wkPs/WQQNybd0nQ6vbttHJgPi8Ht6YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=zzuUY9Av; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="zzuUY9Av"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a09757004cso30246435ad.3
        for <regressions@lists.linux.dev>; Mon, 15 Dec 2025 18:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1765853944; x=1766458744; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQKXw8YrTILdKKNvHcHHluW3GvbMq62ie+hNCacGkuI=;
        b=zzuUY9AveYP4n+5xrkOVTy6rUlFarkcixAxxyk/CVl4qlnqGPM9Nn5PZ+TviYUk1il
         dW5f6cqIiXff7Jqyi/6co4wkaH7q3TC2BY08Mb2Z1lqqElflHdeC6q4SspQyBAXeGIih
         fcG/QZU5UX9ADzHd9gAxGiu7brIddJcDiEf8RW69kRWS5FE68Y5oy/urTBxZACfArVaY
         hz4N38X/QkEFVJGYJdKxlV4eXzvtDH64wXW+h1RJGiAh1azuvA00OmT5ODITMZulu4Ho
         WpHH+MnhSyU+/WP+cX/0lT4F1IvpEMyTew3djZTcTPtL7InP2fE5P/gTlMSOoefyYynQ
         AzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765853944; x=1766458744;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vQKXw8YrTILdKKNvHcHHluW3GvbMq62ie+hNCacGkuI=;
        b=K8CET0eQwWDjXgn16pUEPeCeMxwQeAhJkZMCCPgvSRDexjwkUpkMNQsuAvM/tqRPKG
         5qGfKbN33L5QdJsuGGQwcWyM9JK50SuixvvHtMPZ+XgS9Li8CdwOTRXnZmMsjxf4XftH
         14+A2Zp1ek3pDF8kOFHlX0zyqLwYEK4VMqITxZeaV55aOxnttH3ECPDvzC6vQFFYscdd
         hSTNJwjYFLGo1HBNIe2Nlr3/9Jx5nyrYWjlSt5ywESt67bghaOSALN9VIkjgostctjYl
         d2DiXHYwAHQXafnjbxyewm/Oyc51mV5lYiFnafI8SBKB6VzMvp57n/8VfLKNEcwzPyH0
         +Xlw==
X-Gm-Message-State: AOJu0YzgTI6K7tGqH3SizdNBqLD3fOIrJ+7fcv7ybT4VOMgtGIBYuaQF
	OBoHeadLrWhjVhjJ1NJaWx811pAQl4M8RTr4e8fITuFpSk7bzH/YYaCk5KJimB8tx6s=
X-Gm-Gg: AY/fxX5qHtrJK4209MWMDbT2yVS/0V6Bz4481EbCNpweTM2PDjLbs1WZs6m5Pec6ws0
	Y+esiX2+1v+x+NNyGOWTV4BHVvzc7RXj90HeHKNvSDdVXsKDihxCFP+xuAwVM/i8Abgo9sLMfsp
	lHktISzp/P87WObRc6NkLeICi0rIMqGPogO92VQAFxkyF7I9kNdvUWTG0SI7H61ExGAZGsaOZ46
	m68CiJE9oU9L/kQ8saXxYg08QuggdF20cwVLvk9R5qH6M1AXROS38irvefLpfbViRuE1UN0fXzh
	PFX1m5rA19Mmve4QW9I21h7iQ6Y6p+Jr9QJ/qiZr7F5mAuTh2jnF50TEoQbqE7y7VOEgB5r8VOj
	nkXVdAF43wqH4rV9FY1udc3zgKVMq4Tuav0hjKmoFIi9AAWz2Mxz1YZY4lAuWdR+AHNKUtnicfN
	wkdwHRmKhi4SOzGKI=
X-Google-Smtp-Source: AGHT+IEkPqJ/fj+EpTYs3+K+FUWlhyi59xcdqv1bkVIAG5rD10t7lFjrIwnc3R4q4JDhXd5SvTEBeA==
X-Received: by 2002:a05:7022:b8a:b0:11b:d211:3a64 with SMTP id a92af1059eb24-11f34863cd1mr11179721c88.0.1765853944156;
        Mon, 15 Dec 2025 18:59:04 -0800 (PST)
Received: from 77bfb67944a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb2f4sm47974769c88.3.2025.12.15.18.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 18:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?b?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpIGluIGV4cGFuc2lvbiBv?=
 =?utf-8?b?ZiBtYWNybyDigJhtaW7igJkgaW4gZnMvZnVzZS9maWxlLm8gKGZzL2Z1c2UvZmls?=
 =?utf-8?b?ZS5jKSBbbG8uLi4=?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 16 Dec 2025 02:59:03 -0000
Message-ID: <176585394290.2610.8656861889938723251@77bfb67944a2>





Hello,

New build issue found on next/master:

---
 in expansion of macro ‘min’ in fs/fuse/file.o (fs/fuse/file.c) [logspec:kbuild,kbuild.compiler.note]
---

- dashboard: https://d.kernelci.org/i/maestro:efd5e2937b906561246dc835406f3fd74dd15d9d
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  563c8dd425b59e44470e28519107b1efc99f4c7b
- tags: next-20251216

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
fs/fuse/file.c:1326:16: note: in expansion of macro ‘min’
 1326 |         return min(((pos + len - 1) >> PAGE_SHIFT) - (pos >> PAGE_SHIFT) + 1,
      |                ^~~

=====================================================


# Builds where the incident occurred:

## 32r2el_defconfig on (mips):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-mips-32r2el_defconfig-6940c4b8cbfd84c3cdba9ce1/.config
- dashboard: https://d.kernelci.org/build/maestro:6940c4b8cbfd84c3cdba9ce1


#kernelci issue maestro:efd5e2937b906561246dc835406f3fd74dd15d9d

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
