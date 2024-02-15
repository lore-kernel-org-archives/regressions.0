Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE4169D0F
	for <regressions@lists.linux.dev>; Thu, 15 Feb 2024 10:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707991892; cv=none; b=cQgKrkso8MCxmnRi1JXs+vWznA+6h3t+Pz05gqze7UpZj5HLhibdstR1sgtGRs2UuG671LiTWG6QBsoB10q7hf3xPPAujG6SX1pmsQe48I0+kFWGYE4ps2B3URrHvL5ztMIpzAxrGi9VoQvS2TefjpiwymN7TTS5B4XORm6RBdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707991892; c=relaxed/simple;
	bh=a79toeYJmYUPXuCP+VQUzup7jbk+ihceTcg7eZEHkY4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=OKlzoRVsxAlDd5kWMGuNWh5k4QFZrzzKyjDLP8/aFdkK5tAS083no5PmZkc4dVWX76y2SZnotoIsLXfn2xbOCejZW1HImv0CWWXsB5/I/RCjerzMsWNvFEwDZck43pwODkYKKYL3AEA9E+eXWx4zLl9mUyOM+s5qOWI2M5b6xZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qJO5bA/2; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qJO5bA/2"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7d5cbc4a585so237360241.3
        for <regressions@lists.linux.dev>; Thu, 15 Feb 2024 02:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707991889; x=1708596689; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a79toeYJmYUPXuCP+VQUzup7jbk+ihceTcg7eZEHkY4=;
        b=qJO5bA/2eH0E/po4AM35v+RhPKVQbINHgXiKY7O2Qkkyu+F9wAv3c+DRlvTMpoTqfj
         /fGoazhGCacMxX1WKxOcrOBJ+Uo5Y0H1vWPvuT2DoBenlTyRnMJvhQod2RtVuMcMZkKE
         KqgtNw181gAupqkn7v37bKDC4fHBLyiQB4YJSFjrOoRr+ufZx44ZGgUhSbLvIlcIfJWy
         nMuVDL/UN7hu4tVzXZ+myksMxsHIXfIj8Y/Y0hY68W0/2VBnwTHdDJYD8mhilAxZsxjP
         YswHxThISJ2kYa40137UmnYo2hua8grzFX9HWPN7Xbu4leUdIs9j+6tXmwoMKWKsRSZm
         Bp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707991889; x=1708596689;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a79toeYJmYUPXuCP+VQUzup7jbk+ihceTcg7eZEHkY4=;
        b=LIYdYbPPDwXI5Qn/dmP8IaDyfvDKVqEvbQNCIrfU+LvtzdF8438VsTyUSy9x7RzVHd
         AjamQ3mwpv3PZCICdm//yhT000GM7RZy8InflAQD+UIWD6M1i3aBT8b89Y70aMGMyHMw
         ydtoKwA69zMqt7E1TsKOqRRspapz6ph/vwOofljBbXM1MiIBh4LNQwTkXwN0RsTiL3o6
         kAL3qkb07op/I41jvwB8DxF7yjEL3BTYtJ2wG1raVf/a1PmkQBhIjOTi6DdB+2aRh5NA
         LYj7kaA03eeLjHVFh3PGQOyJ/5Mi+UIUSxqAH2sIUe/aE8CauPB1SNHVzJRGECbPEvAC
         B7Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUHL35lUTfOpx1zea3KifYtKaGYT2/neLBiDKQ6LLyK2aA3bgGEYo79yD5u9Cg/cHl3d10GFWRVIy/LuMK65kicpCfiWzGPocupBUk=
X-Gm-Message-State: AOJu0Yzyy5DO45INkMVDY+YR+u1CBoL7CaxkQkLyFydx2CBfoKvUhT55
	JCpG+jRQrgvXUA5IoHJzhTLT5gb+SMKzO0zQTNtSssyiTdHcV4Ht30aRCRukLjqca93n3mOxwI2
	OQdIAQNXLU5wqFArRavjlMddmuefRi5EnhY0U9g==
X-Google-Smtp-Source: AGHT+IE4dAp0+3pjqzG/5JaQHmc+LoQBsUmyYeVIoxgjylBum1+YCV1FOUa5yOT/OCSjTws5nQmPvSW4yQBgfosYdig=
X-Received: by 2002:a67:ce1a:0:b0:46e:cf01:95fd with SMTP id
 s26-20020a67ce1a000000b0046ecf0195fdmr1108822vsl.32.1707991888925; Thu, 15
 Feb 2024 02:11:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 15 Feb 2024 15:41:17 +0530
Message-ID: <CA+G9fYuHF34bSbN9ktKuMAv1eOFVrf+Gw1MC_rG5trUQv9A_Pw@mail.gmail.com>
Subject: next-20240215: workqueue.c: undefined reference to `irq_work_queue_on'
To: open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On today's Linux next-20240215 tinyconfig builds failed on arm, arm64, powerpc,
s390 and riscv with gcc-13 and clang.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build error:
-------
aarch64-linux-gnu-ld: kernel/workqueue.o: in function `kick_pool':
workqueue.c:(.text+0x9e4): undefined reference to `irq_work_queue_on'
workqueue.c:(.text+0x9e4): relocation truncated to fit:
R_AARCH64_CALL26 against undefined symbol `irq_work_queue_on'

Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2cO8iztCdxtnbSeW3ekjN25sY6G/

--
Linaro LKFT
https://lkft.linaro.org
