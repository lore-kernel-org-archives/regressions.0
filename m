Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC69912F36F
	for <regressions@lists.linux.dev>; Thu, 15 Feb 2024 11:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707995023; cv=none; b=aygYuNdFOtZ7Wa8IDz2wmNoeHQvEDGpiZKvQTox/V2F/d/2sH/WwBbUy6Nwg7WhJBNViuQVPFeL7eI90raFpTMVlUoBTib+vKqoRmrYJ0b9W49yrscyHMSZvAK82V4qTu8tn8yVPOZB3E8V4oEolnZPUsZsprW26YFmP3+CBZkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707995023; c=relaxed/simple;
	bh=OBvnn+vLzA5myTGqwxaRCsbH/Eb4JV3XiuBr+hyLuMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=unhgcFVGP+805UuO2au1o4FCEdXpl5VQ63TEYF8lDzs5pyaeC/Z3Z4JGs3KzlUx5wBUFPQTW7HlskxIROjg4k4Z4Gfgth27DYeNtUCSLYt1GP48d+xb9UTAw1AHYNSeaati7Blc35b7zJwpCdeEeN3OiB3f8BjSgPA/JW68rNRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hm+OlInf; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hm+OlInf"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4affeacaff9so179921e0c.3
        for <regressions@lists.linux.dev>; Thu, 15 Feb 2024 03:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707995020; x=1708599820; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OBvnn+vLzA5myTGqwxaRCsbH/Eb4JV3XiuBr+hyLuMo=;
        b=hm+OlInfMcinyAVUJA1txicZLkTngW/xgUFzJ0qMaQoC0ZdvfvudLI7Dc6ABDt4XoY
         ZJBbjPK0BASWGQmruKmbQ0kTtUXPFIqK1Vj2p+QZeHyRdhK+UbACGo1bYTtgJ5Lb+O+K
         HNw8H8lsp8AddkYPV4LAgTmjtwHynnE4ognaFIocpII8bLGGlxU1Df67gHdzIUVI9Tbh
         lMUqmy7MsHAugt68gjCmtaATASq3H/QPr8m16t3ySgwCebAGNFCyK5fTw8sFZEsXLQFw
         Hc5/b5bNlSrz7Ab5VYqhzbTIWVQaaM/OHSF9dizx7mv+efFjz+jMFKr6EaT2dpVLjTZW
         4Tpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707995020; x=1708599820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OBvnn+vLzA5myTGqwxaRCsbH/Eb4JV3XiuBr+hyLuMo=;
        b=GFFM7/zQ7f8g/0xMbCHXGWb5CSZwIwyQgj6rLJRiZ9d4P9ui8DhpX8er9N5Xn/oZDQ
         +ilBOHri3qZj3DrftVhrX1UH+P6KRYN3G7Zv1k6tt6T0Lv0PoL2rsPDLM8S00q2bMvGW
         V07JNuQ7YXy2GqVPlC6zvLZAGMLDj8vXxqK0vYM5g0Mj8o3RJsOPbTSyISUzxF0ffuQo
         K9YCDd5I/DQ2Dpjo0g4uPcoMqJS8eRmNjWDeYS0hwyPIqbxUrcUV0wgl6w8+2ziiiz/r
         QW/rqN4ZPXHyW7vC3Xt49+V4yafi9dNKl2DNZgXPKUyuBADHZcsaVIUntEX0d2tSkfqJ
         mgng==
X-Forwarded-Encrypted: i=1; AJvYcCVrHE/2P3u/m3HQtTKsKzKnoevkf1OijvZTjxfS9APtqqATRk9+RzGefDF2Y+/SEiScJDRS/OUQC489Lu9AwZ7wwjl0rHn8CLvN8SA=
X-Gm-Message-State: AOJu0YyF0+smFVtpDQKtNNwiEVrZlQ29UNNMCYSD//00EkEZABJPmdtc
	hBaY8OWjvcM+iKnSJLo7SPc9PP+EBjeoWmblmHKlJ9O4SrspKXAy6KQr+kwly2larQs2R9+AcyV
	u9ckX5tpdungPTTG+/fBu2sS7tDqtS3yhaMlwAA==
X-Google-Smtp-Source: AGHT+IEYRlBkhUM8iWKwiW+yr8eYjy4B779TPoJKTltHiC2zBtjSq3OeyP9rmxZ3uB2kTMQTsVbCA3nxH7Tk/iDNTWQ=
X-Received: by 2002:a1f:dd82:0:b0:4c0:2802:a1d8 with SMTP id
 u124-20020a1fdd82000000b004c02802a1d8mr969343vkg.15.1707995020685; Thu, 15
 Feb 2024 03:03:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuHF34bSbN9ktKuMAv1eOFVrf+Gw1MC_rG5trUQv9A_Pw@mail.gmail.com>
In-Reply-To: <CA+G9fYuHF34bSbN9ktKuMAv1eOFVrf+Gw1MC_rG5trUQv9A_Pw@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 15 Feb 2024 16:33:28 +0530
Message-ID: <CA+G9fYu1sEsMRJg-f5e-y9PQ1hyNDWJhnWo21w6BB78Y9-9yhQ@mail.gmail.com>
Subject: Re: next-20240215: workqueue.c: undefined reference to `irq_work_queue_on'
To: open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Feb 2024 at 15:41, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On today's Linux next-20240215 tinyconfig builds failed on arm, arm64, powerpc,
> s390 and riscv with gcc-13 and clang.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> build error:
> -------
> aarch64-linux-gnu-ld: kernel/workqueue.o: in function `kick_pool':
> workqueue.c:(.text+0x9e4): undefined reference to `irq_work_queue_on'
> workqueue.c:(.text+0x9e4): relocation truncated to fit:
> R_AARCH64_CALL26 against undefined symbol `irq_work_queue_on'

Anders bisect this build regression and found first bad commit,

# first bad commit: [3bc1e711c26bff01d41ad71145ecb8dcb4412576]
workqueue: Don't implicitly make UNBOUND workqueues w/ @max_active==1
ordered

- Naresh
