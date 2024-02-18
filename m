Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCC71847
	for <regressions@lists.linux.dev>; Sun, 18 Feb 2024 04:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708229077; cv=none; b=MIlpAjNMIItVlxtm7dLGWxaTnsePEGP2i8M4NpUkZW3S4q2HJUsGR64IvjaW4Tjm9cUDuat8ByBoHp4C7DSLEQp1p+ayLf++M06++rFVl6sU/pxC/ZBarAXUdkPVaLl6OdJ8lAUtL4QTZnEcT5FdZ1vl0NTEcUhtjBX3DA5bxmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708229077; c=relaxed/simple;
	bh=yoAnO3AstMmy54HRNKFX1DdpclCy/YuVbjHLlgzhIQk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iIlugvVug3AAvZNoo74fRNg6Y02wkHX2RMYUNz526XeSW5YlxDwfBQcnHTm2J9ooODr4wJS6fTWQRLNIWVALmwEf9QPE21smFTig3Fz/nMVfvTFNqG0V1WJi8jPaWXGca2aLgTJfSHJjTDxYhoQiXKnU9V9ONanSpjph0ONLunk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VQO2evXJ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VQO2evXJ"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d22d0f8ad1so6274711fa.2
        for <regressions@lists.linux.dev>; Sat, 17 Feb 2024 20:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708229073; x=1708833873; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1do4DMw/mN513WZiNnLlku81OJeKDVZzYGJeAsIMYbI=;
        b=VQO2evXJc5uq/iZQR0P4bL9biPDBpqjQKbZ7lLKaRI6ZJFz1CZJL2X/+tlQjqLrVnb
         VbL+ZhvV+7f+i24q8Z4UiQnDmGUhwxVL06KvyJbj3rnMxY0FE2VRTLdB/WICwzAdm53b
         0/ZT6ttpGDMbkUmbCevZzmlCPhEoKadEf5OKBIXcZLjA8xBP/Uhp69ddWLIjfUXuCVkx
         rXxAsyffO+uPgUznwLGiC5cUuWbxWiYssQU6+5hpnjEEj4ZIXVSukvSTuMQ0crp8h38A
         8T9ceFjGURyb6AsluI3A870fko3UiqzQINnkiGzWzbgM3jkxoTkcyS9MNPJkMsbT3zSv
         zrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708229073; x=1708833873;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1do4DMw/mN513WZiNnLlku81OJeKDVZzYGJeAsIMYbI=;
        b=Lm7m41spH0dDk6a8+JyMMkS7CBCgpIiT61o2W0SVkP3EZThgzkWi0OBPNFb5iP3dxO
         Vv1ZStt0IJ4+cN+uYhQLJbHLZxvHKoG0W+CSfeuZ/92ktA0mfGxIWH7B/5XSwMGfTa1Y
         IeP4nCH2+CQT2di2h1In+EBSO1aGndlBTjfxbwihaZ9CIoJCa7AE8ra9RFoXMGKxl3bX
         +ja792T4GsClSk94yiCo7T9Cr+cfGOIF5EEuuG0crkPJc0UT3mj0W8DCQObg7Ex7VuPp
         BI+8iyDIkotvi0wG6HeREkglxHDMjlTfn7JX/tC7avWZGS31nF2I/rnKQEi1vLVtEgyQ
         jfag==
X-Forwarded-Encrypted: i=1; AJvYcCXlhTjjSqaCXW/9DOjFJ60FXmRkrmqLWzTpNFU6f2l9yhXA2I5WRowPbjYjpIV5pGL0lJpflGDPvni3+398Jr64Lo9z1gWZCiDqcpo=
X-Gm-Message-State: AOJu0YxmfdWl1doizofO7KAu5bBOi6QEavPxdSNEzkvGNrNC4MqaWnlX
	3N+j+/DfrGcCOKZAcO/88Oc2oLa9PWHwB+ZPR9NBdar8cchHeMa6yYAXpE7jD/Y=
X-Google-Smtp-Source: AGHT+IHViPNoZZFS9Sfl5oY9dSDsQPlpdmE5pucJhvFd3AOk2Ml2lhRq7WOI9Bsr8e5TNDv9bq8EAg==
X-Received: by 2002:a2e:88d6:0:b0:2d2:3808:e0d8 with SMTP id a22-20020a2e88d6000000b002d23808e0d8mr62156ljk.31.1708229073460;
        Sat, 17 Feb 2024 20:04:33 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y9-20020a2eb009000000b002d08f3640b5sm553905ljk.11.2024.02.17.20.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 20:04:33 -0800 (PST)
Message-ID: <cf95947d-8bec-4f95-9e08-2d942723cafc@linaro.org>
Date: Sun, 18 Feb 2024 06:04:32 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [REGRESSION] sc7180-trogdor-lazor image corruption regression for
 USB-C DP Alt Mode ([PATCH 0/2] Add param for the highest bank bit)
To: Leonard Lausen <leonard@lausen.nl>
Cc: Connor Abbott <cwabbott0@gmail.com>, freedreno@lists.freedesktop.org,
 regressions@lists.linux.dev
References: <20231207213048.1377147-1-cwabbott0@gmail.com>
 <85581fad-da8f-4550-a1c8-8f2996425dcd@lausen.nl>
Content-Language: en-GB
In-Reply-To: <85581fad-da8f-4550-a1c8-8f2996425dcd@lausen.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leonard,

On Sun, 18 Feb 2024 at 03:17, Leonard Lausen <leonard@lausen.nl> wrote:
>
> Hi Connor,
>
> unfortunately, your series https://patchwork.freedesktop.org/series/127529/ has introduced a regression for external displays connected through USB-C DP Alt Mode, at least on sc7180-trogdor-lazor devices. Do you think it's possible to  fix this before the 6.8 release or would it be better to revert the series? I'm happy to help testing any fixes. The issue is also tracked at https://gitlab.freedesktop.org/drm/msm/-/issues/49.

Please check whether this quick fix works for you

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c 
b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c9c55e2ea584..f097577a99ad 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1325,6 +1325,11 @@ static void a6xx_calc_ubwc_config(struct 
adreno_gpu *gpu)
  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
  {
  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+
+	/* a618 is using the hw default values */
+	if (adreno_is_a618(adreno_gpu))
+		return;
+
  	/*
  	 * We subtract 13 from the highest bank bit (13 is the minimum value
  	 * allowed by hw) and write the lowest two bits of the remaining value


-- 
With best wishes
Dmitry
