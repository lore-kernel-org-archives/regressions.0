Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D461329D06
	for <regressions@lists.linux.dev>; Sun, 25 Aug 2024 06:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724568703; cv=none; b=iA2UyBsh5a0alGBgiyEQgMzs/5sJSbjsp/XxKOqGlO4WEvjQr7Qav45HyivRBQKKj/3O+Gkd2rwNDyGQx1eW8geeSj6nqd4JpW+ZPCiSiJRSZqulkYLi/kQJ7h+XTxUUDFGJKaJtOzmV2KQEc5b8eOFaX+rP4uzcNM7a8vvB9Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724568703; c=relaxed/simple;
	bh=76IiGlrdR7+alw6d/fG63eW5fE1gTgfxIrHK5c2mJhw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=kfpqXYGDfqHcMTfVFsd9pqlmhTSx9vIr05kgUI9bVZWO4VKBOB86VNhi1X7g2jweDxcOa3MhSkCeZWio0oopJrkqj3734G0QjPHyjniJ0RKbAJFtanPwf0+v/SF/lZKfEH6lZacK2N5PwrB+lmBs+JhnSgX+EcFj8CDGtzvT8Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bM2dbTr2; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bM2dbTr2"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70cec4aa1e4so2419215b3a.1
        for <regressions@lists.linux.dev>; Sat, 24 Aug 2024 23:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724568701; x=1725173501; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsAWZ8ohbVezF1hXTkNDEHJtwCRn+3NNEFxo7nThb+g=;
        b=bM2dbTr2CDzYLch95wWulk4ks8CuaU2MnIe+rWeSZ3UrKO34ao0WCZlkGYONuZ9DTq
         XD7avL76Jyx86Cc29t+dMu2jFHoPMa/3z4DTQ105TEWyeyZzgzj1RGf0pJCp5ZwlE9XK
         JWvgghyjpRNkOCK6P/6ZbvFBDXckGJ9R6kkonWnAd3dbyIjWcVYCdyoU8vcqEfYf2Eeq
         z3gzREA9wTpurNruY/0gQnhNNEnCTjzFSY89w5UJPR9Gjdifg24b23zqs0BmuRDw+qGq
         qiDHNSupuPPcmHxJjLvKfO9Wkerte5TZLReCWJqV/bM+WZMYYeyuHeCGHv1hE5SQQb+q
         65xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724568701; x=1725173501;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DsAWZ8ohbVezF1hXTkNDEHJtwCRn+3NNEFxo7nThb+g=;
        b=FwSGvfJcPC8haOY6WFEiCnQfP0T91rIiNQRevEwU+p8ZeXYiufx/zUB9v3EObu07Df
         nApuTFjEFVYuhqxxBWpAK/RBhXNsQUz6gJTt/f0Sc7qTwKP2sNfNn0r1nXSy3zcwQMkw
         zDRX/cjwG9uY9fs6MzoL12IW6z28m31IJ9Q6eKo+Lk6PKpk+FZUqv46+IbDtvc/gItpM
         K2Kjd6aNjscTCl8BEyYGrVOLxXsSbPMY5TOj2yktZpqpLtiEMUqzK08wB0A6iZz5mnNF
         rPA4fQ9gHuoaKNQExek9EmUUBsplwfD9ln3/8Uw6dqaHaT+xZ066FTO78pKJ1F5yFbYv
         3bzg==
X-Gm-Message-State: AOJu0YxU5otAhztIKZPya7N6qeX82JZ9CK3YMf90IFbQrTNOxeN0ccp6
	4Fsb5BbKyegmdftb5YXPZ5PVG6YLtfREDSY1KlEl+xFjIeHgUHL/i4UGtdf/j+jZHw==
X-Google-Smtp-Source: AGHT+IFDhQ8clx67UthEox0fdtuJRVKZOQKZOoSpw8jMLDReoB9yFRh3mKSyO2s183CZavpoEW55mQ==
X-Received: by 2002:a05:6a21:9211:b0:1c3:a411:dc45 with SMTP id adf61e73a8af0-1cc89ee5899mr8302200637.39.1724568700464;
        Sat, 24 Aug 2024 23:51:40 -0700 (PDT)
Received: from ?IPV6:2601:644:8501:8a10:864b:f5ff:fe5c:59a5? ([2601:644:8501:8a10:864b:f5ff:fe5c:59a5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038556653csm50447095ad.16.2024.08.24.23.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 23:51:40 -0700 (PDT)
Message-ID: <692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com>
Date: Sat, 24 Aug 2024 23:51:37 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
Subject: [REGRESSION] firmware: qcom: scm: smc: switch to using the SCM
 allocator
To: regressions@lists.linux.dev
Cc: brgl@bgdev.pl, andersson@kernel.org, konrad.dybcio@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robimarko@gmail.com, quic_gurus@quicinc.com, bartosz.golaszewski@linaro.org,
 luzmaximilian@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 srinivas.kandagatla@linaro.org, arnd@arndb.de, quic_eberman@quicinc.com,
 elder@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@quicinc.com, ahalaney@redhat.com, quic_djaggi@quicinc.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,


Found a regression with a platform that has the msm8960 SoC. Was hoping 
to code up a fix myself, but I'm not adept in ARM architecture or the 
Linux kernel, so I'm just reporting it here. Reverting this commit seems 
to fix it as well. Please let me know if there is anything else I should 
provide for this regression report.

#regzbot introduced 449d0d84bcd8246b508d07995326d13c54488b8c

Error: https://pastebin.com/SDRENUGk

Defconfig: https://pastebin.com/CRDjC39a

Platform: 
https://wiki.postmarketos.org/wiki/Samsung_Galaxy_Express_SGH-I437_(samsung-expressatt)


Thanks,
Rudraksha

