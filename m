Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFF217753
	for <regressions@lists.linux.dev>; Sat,  7 Sep 2024 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725698947; cv=none; b=XZgx3Y++xRwE4kXZt8GgONiI4ZhwPyKrsMdOXAKlFjsVTfPU8PsPsgvfUVgSWsJ1NCIiTkq87mKzdzE+YFqwY4nJbHKnZ1V7YAXanpghC4zDq/QLosn09c/B36ixCQyM5nQ3Z8excIvSESj+Ur2JWYBHdHSc3f3h6n/4VD6tRqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725698947; c=relaxed/simple;
	bh=GsoRJJo2DovteJwgux5pAslpP9M+k1P5bnIdIwLRxiY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=j2bH3Bjv8qtgNS8c34s5tYdsjIqiiPqsc9mRxK6KLWXj9yt9nWTQSlVHQ8tSj3TKARZ9bzzCU660BuMtvCIP/amb6ILPmcAdCA/khRUskjbNJgmmXqIyC1IbhxouU1du2KwXSwRcxX/UDAw39kgzFq8FRD/ssXZlNF7FbxjRLq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbCVnG/t; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbCVnG/t"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7c1324be8easo2731561a12.1
        for <regressions@lists.linux.dev>; Sat, 07 Sep 2024 01:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725698945; x=1726303745; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BH4+XkdgytSrJblSRrneWrEK0xYxzEsMEgsFyL/DakE=;
        b=nbCVnG/tDHvOZFFnc+GPgS1oEjYohsWBvwF0WCNQnciQHTfumoDBwaffCBOAjju6AA
         fM77dpZ8wnzOOnflK/+P7Iaqos0RumrSVkfmtPQyNNnXGx3ZHpGcu8OPVdkn07ucNUjC
         jZRgODUvfA+06nfpmJ2yWwh4qJ4oK/z6CBq1WPuv6SKsn6QzsGMN6BU1BA5muTnghSH/
         bBNNU6MSDdXVORzQ5Jy4jQKv0XRldKFucdaMGO2cOswYi7uPZ2En//wTzkV2yOC7Pkaz
         l0JtQipn40HKxYcwm3vIY+2IcsWW36Z7CTS38nLlmKK+Vw8L7nXMR2P1U/RxAq7kcGKq
         yBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725698945; x=1726303745;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BH4+XkdgytSrJblSRrneWrEK0xYxzEsMEgsFyL/DakE=;
        b=syeaiSv8WfO9ccQVOKnKhjD1z31yhKPFrDgSMNdXcvwP4BK475SLfWDicJsI4F6hsH
         iWIdqMMGHnxtgBvoD4Yt9aJhCgTQoPuJtbYJnCftdrucihBq697W/umzfsu9SngkRZJU
         KigPs0NNPR07LQ/cBN4RilW6mG+hwClYhu6w7w1z+VgJ3VIsb7N69JvVJw3/pQALKqd7
         O1K9B0i1f0O5/Ww/1qIktrkAG5s9NPo9opE6hgBOq80GusO58WeJgayzBNhUWiVmCc2d
         L0vCf+oJxtPFZKA7vtETV489r1BvdU+hwAxhizBrkLjpswVWVuA2A/uyz5SJrGc3qJK0
         ZAkw==
X-Gm-Message-State: AOJu0YwigYlUH88j97OGpXL6ssDgeB+dnWLTdLW4OA+mK9q8iKLyxH+G
	QbkYFkzPGXvU0QnSF5TUN2QIV0HmXMSK/V9GFEHlBRbZBhPB0x3h
X-Google-Smtp-Source: AGHT+IGCGj8ZHxZZBVZ5qtVU3o3i0MvF8PEs2OGGek2eT1vVe3uzcBcxT+hQr2L/GhZcLEwtMSq4tQ==
X-Received: by 2002:a17:90b:4ac7:b0:2d8:3f7a:edf2 with SMTP id 98e67ed59e1d1-2da8ede7effmr18570786a91.12.1725698945158;
        Sat, 07 Sep 2024 01:49:05 -0700 (PDT)
Received: from ?IPV6:2601:644:8502:9460:d6be:d9ff:fe52:7e82? ([2601:644:8502:9460:d6be:d9ff:fe52:7e82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d823cf3b60sm615133a12.28.2024.09.07.01.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Sep 2024 01:49:04 -0700 (PDT)
Message-ID: <68b0476f-dfa1-44cb-a01a-f4afbaaa98e5@gmail.com>
Date: Sat, 7 Sep 2024 01:49:02 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] firmware: qcom: scm: smc: switch to using the SCM
 allocator
From: Rudraksha Gupta <guptarud@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: regressions@lists.linux.dev, brgl@bgdev.pl, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, robimarko@gmail.com, quic_gurus@quicinc.com,
 luzmaximilian@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 srinivas.kandagatla@linaro.org, arnd@arndb.de, quic_eberman@quicinc.com,
 elder@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@quicinc.com, ahalaney@redhat.com, quic_djaggi@quicinc.com
References: <692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com>
 <CACMJSes4cnCNUHiZUr4CF-K2c8-1VYzuh=T8JDi_erqfShkuZA@mail.gmail.com>
 <1f889bba-0c89-45db-b360-b21d6bba7772@gmail.com>
Content-Language: en-US
In-Reply-To: <1f889bba-0c89-45db-b360-b21d6bba7772@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> Looks like qcom_scm_get_tzmem_pool() returns NULL. Not sure how this
> happens. Can you confirm that the QCom SCM driver probed correctly?

Thanks for looking into this! Please let me know how I can help!


I've been building the driver into the kernel I believe. Here's the 
relevant line in the config:

$ rg -i "scm"
samsung/expressatt/linux.defconfig
1615:# CONFIG_ARM_SCMI_PROTOCOL is not set
1627:CONFIG_QCOM_SCM=y
1628:# CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT is not set


It seems like the scm driver is being probed:

~ # dmesg | grep scm
[    0.066438] qcom_scm: convention: smc legacy
[    0.362543] bus: 'platform': add driver qcom_scm


Also here is the complete dmesg output (Had to paste in pastebin as it 
made the email bigger than 100 KB):

https://pastebin.com/4iWKvZ8z
