Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240051B4C43
	for <regressions@lists.linux.dev>; Wed, 14 Aug 2024 15:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723649224; cv=none; b=OF7h6c5iQJhIiXMnsF10xRuCk9AMIHt8vbBC294RSozlF+tGU5eu9urN4VWXR0CTm1W3BG8d0AT+WZMRQr3lEpQrWgE3RVkXuuGtm9WSmST5X5b6MwqMqlqKpp9ggRyV3bEku9d3uv3J0Bfa7VKVGDmLkH1CkI0aSLEfnv9IX+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723649224; c=relaxed/simple;
	bh=YdWQZHLQfEOlIvZzzDpAY/ZBXs5czg283ng3qf4BLPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSpnVHd/AIgzs3F1RYQnh9C4kKGNoo7Pgo/O65lXnQqmTg6Jc32Ei6o13IjK3qeajd1Z7c0+bBp7s+MulZZBVH6gYbfRyJZAZXISwqRO2a6kxHo1Ho7bmGYgn/8LMg+7NLR+kqlV0UqrrZxTTzsOVczUVUfXUirKmSbLtdFvnuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fgJjn2JX; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fgJjn2JX"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-49288fafca9so2054137.3
        for <regressions@lists.linux.dev>; Wed, 14 Aug 2024 08:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723649222; x=1724254022; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tGZroB5X7Pl+enXhuskasq6wF2/j8/lEP5i8DomsFLE=;
        b=fgJjn2JX4gHkR+8oUCTkGm5qhz22s7gPqc+PgtUJ6QBIvzl58wCinyrsF5nQQX20oY
         bBI3NeQS5+1DkWUCoe/5bQNz8wCJ+wtZ1myFvjN6wrCR1DEAqoNmJmbWszXocs1SGhYa
         Hz9zfEAHNrsOISYJFAdiiY1gleKfsuh28vlFjmLlHNBsmRBpy2nPAiksdhWeiKHKcmiV
         w/4/92cbdFATSKAh1RHYJj6+dGPegsZAE0iqGgOL6zGMC+WMzHUyUOGqtcOKS/KRK82p
         89jTxzg52pe6Pg5WzgwkcO8vKq92IgAe5chtA6Kilq8WO7hBiiLbAKLiKjWxPL2udsSz
         WXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723649222; x=1724254022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tGZroB5X7Pl+enXhuskasq6wF2/j8/lEP5i8DomsFLE=;
        b=bsFAgQPhuJcGpfA8M8JqrnjjX/EXd/tkm4c/LtOGuUXaKR0/zqPww0lnim1ms94wH+
         ks30pfMUX/WLJgDnb/Orr4WxvPwvmNHb5ndNaUKf4viE4t8YWh3gVli3jCf1YK5wEysO
         xLV6WkH1GBEI73ek0pt/xnGF8aKjEv/6GsZyk9C2dCUc6RWR5si5Jg9zdyAtY2X8z+9+
         uwwem1Fl4HCxDWIxHhpHRk5JAsUQ+bdm/srW/UXzYb08XKizyOUfkYRxhPT8i9XyAEFb
         OX4Hc9wQ5Gcxkd/VsJCWwgUXclstYFVJf9nKIoMMCs+e2YnBnMufavupdBk6sUPUIwzC
         lqCg==
X-Forwarded-Encrypted: i=1; AJvYcCXXE7BmRAdoNhx5SgiyS7VdcK+w4uonwtu6s/0H4yOHeUt5hTFpXs44f2zfIlpcWZOqH1phg8oRvLwfdVbszpYBnZEo4S2Oi2X/eo8=
X-Gm-Message-State: AOJu0YyS6FRtejWmxpdvlQzFuy0mHr1kz7IXApIAYilYBI0aHaag8UbH
	krL7MTJX9COrJBwq1IMPt+i0dVaGLwWawEhazof8YX8FEZcJaDberriHZ7V7UgeJxYpDP9S3iNo
	bYaCgrmved9Cqnw7NcS+3upkBpNo7Xubvlll5UA==
X-Google-Smtp-Source: AGHT+IEgfzR0FD1O0F71t4quG2CcOM5Z6z5auTwSCp+8WSlc2ZtgyEZhNZCJdIh7MtVeZ0TyFrPhPkiwMsa7LXRZiTE=
X-Received: by 2002:a05:6102:5107:b0:497:8f9:e7c9 with SMTP id
 ada2fe7eead31-497599c6d40mr3988947137.26.1723649221744; Wed, 14 Aug 2024
 08:27:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuncv0fuBSC0A1z1G_UOv_XuMQz=DsrLZDK-Wc=10ghag@mail.gmail.com>
In-Reply-To: <CA+G9fYuncv0fuBSC0A1z1G_UOv_XuMQz=DsrLZDK-Wc=10ghag@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 14 Aug 2024 20:56:49 +0530
Message-ID: <CA+G9fYv2M8tqwXQF5At4KmG3PFJoiv3D-4Tn_q87MfBvAqLmag@mail.gmail.com>
Subject: Re: next-20240814: bcm2711-rpi-4-b boot failed
To: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Stefan Wahren <wahrenst@gmx.net>, Florian Fainelli <florian.fainelli@broadcom.com>, krzk+dt@kernel.org, 
	Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Aug 2024 at 20:54, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The arm64 kernel booting on bcm2711-rpi-4-b boot failed with today's Linux
> next-20240814 tag. The boot failed with half boot log [1]
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
>  GOOD: next-20240813
>  BAD:  next-20240814
>
> The first investigation show the following to changes and I have reverted the
> following two commits and the boot test is back to pass [2].
>
> $ git log --oneline  next-20240813..next-20240814
> arch/arm64/boot/dts/broadcom/
>   6e7b99d720da6 ARM: dts: bcm271x: add missing properties to local_intc
>   eb81f43c901ff ARM: dts: bcm2837/bcm2712: adjust local intc node names
>

Anders bisected down to first bad commit as,
   6e7b99d720da ("ARM: dts: bcm271x: add missing properties to local_intc")

> Links:
> ---
>  Boot failed log:
>   [1] https://lkft.validation.linaro.org/scheduler/job/7799601#L430
>  Boot pass log after the reverts:
>   [2] https://lkft.validation.linaro.org/scheduler/job/7799885#L440
>
> metadata:
> -------
>   git_describe: next-20240814
>   git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git_sha: 320eb81df4f6c1a1814fd02ebb4ba41eb80a3c7e
>   kernel_version: 6.11.0-rc3
>   toolchain: gcc-13
>   artifact-location:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2kdXLykPUNEquDyvXHZbubB5T4p/
>   build-url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2kdXLykPUNEquDyvXHZbubB5T4p/
>   kernel-config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2kdXLykPUNEquDyvXHZbubB5T4p/config
>   build_name: gcc-13-lkftconfig-debug
>
> --
> Linaro LKFT
> https://lkft.linaro.org

- Naresh
