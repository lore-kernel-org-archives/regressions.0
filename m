Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E22131E2D
	for <regressions@lists.linux.dev>; Sun, 22 Dec 2024 07:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734852385; cv=none; b=DEV3skjXRrXXODAKyJzgMn8u29j5BtGpw1PjgGHbKae+OQNM3X120h7wWEezdwYCK9mdmZpiV1faquDz7n+Q0thIv/329vQiXGOZLYYfkcw7bnykP86rGB9130pop2CU/5SLBdXRrvYM9Dn6rIssRzmBBlLFrd5W3a2ndqP5tN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734852385; c=relaxed/simple;
	bh=pWy3kdeXldtGu26IRD8vfzEq3yKKT5gvwB+rRFZtji4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TsTTtLss6txnFsQzygs1mei1pSU17VkPRdaSnjhgEYCiMDdM3oAbEHFpcFI4b+oeIUAW7oUxGWp+oTynVB+7ds/V9AnlplW6AvL1SfqJMleHMDLLn8XidM1V8Du9BAAoCoVgs4naZcTmkbmoUnUfWk7SPVPZfhaeGm8i5ZJV27A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UInkVsn4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UInkVsn4"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43622354a3eso21892545e9.1
        for <regressions@lists.linux.dev>; Sat, 21 Dec 2024 23:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734852382; x=1735457182; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Arrz5Exy1wRkGEREWcrB7cZbEldgJTKm7kgF6NXkEjg=;
        b=UInkVsn4OOwj72N+q8Y3MeA+v0sJ34/KjkgmP7cZJDy8mhgxygKRgPZICSuIrKiqwf
         mq2xMiMF5h8Bq3ekmU4P4cBPNMuMD0Ad2HW51mE3A7ea+GD0lsM9+YqCk8eoxYDmZZuW
         ACM9v9LCdR7SVFmsLm+xgA30PrLo6e8aLiPUjoKZa+1sBDRcwQSROEObOaYFfqaSbXh4
         rZg2aWMxGc1qqg/5yF9YJJXY7Z/JTTVyLHpoJxNI4WGbLF5OXLd3HZzRPfstjTlNcKME
         lWiweOcEPR1Jg2FSbPDAv/EraaIHcdAaMqeKA/neZK0wutAhEPmVMN0J0mmiLx71MUXe
         hcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734852382; x=1735457182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Arrz5Exy1wRkGEREWcrB7cZbEldgJTKm7kgF6NXkEjg=;
        b=a8Eo/lIQ3DUDd40rBAdzd+k5h5XzQMDk+sELN/bXeA7i3/01J4yhApB7c4hkSi/4cy
         u8OoVQjXT6ILHRGXPtci9bw0D3YacCdbYw4ElsLSb0NHsjntUs8G5jdeEOxI3Ozps3Xa
         jkaDoYht/5ubLLDRw4xVxg23cNBz8v7FmzVVj0ajt46BUFtIiDLw08PvkpSVKihJT0aJ
         EyBVo84z56ePqB6YyGOKssOt/7WDiPpT47R+6eanU7oo2Xv+SKfAdRv9PMLDbKUkf3oY
         WSjMPCoLy4HiQl6IBoKi67OFvogJBijphySSBZ7vs+iXijKgUNb6XGkbPj15OnXzJAyh
         cZTw==
X-Forwarded-Encrypted: i=1; AJvYcCWq/VT6lqpTR8ft+8PH6W7ENucIMrYkxzyLKZ9Mhq4WmfqtGkSQDtggxdDkT9Ba5732rSFXOUdJKgjHfg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjHl9mi+7P8yN6OqtCgB7rVmAqD/mcNVb41LPL4qeOMkFp8v2j
	lqxRj87NlTY/XeXkf74KPqCtI5xtutpa3X1HBkwjrqEmOdWWKj+x
X-Gm-Gg: ASbGncvOjL7xXZqSd/uUYiL9fzblbnTiws43/lN0oROCw+F2dZ+XLaZa8rWMEys1W2U
	j/sORdFaaaDEvmzy81+kyWNYgDuOiRVC2DwRkDFNn08IJnmgTv/ljOW9/oOMgY56e9vJ0N5HreZ
	cvFvRywTFn0Uiiw+JMhME29OTZwrC3V/T+IC3y5ukAJLusfPub2OaYel96RGLJI48TO/TCNlh0s
	t/Eezj2waIG4c9znlRUjN7ZRsMo1tw3DeStBrgVSY1Ath8BvyOzA14qrnuV34pbAx2HTSqTBtGG
	N7rDARGMXLa7+1JdDzh64A1nvT1iUeirW9V5jg==
X-Google-Smtp-Source: AGHT+IGXRsiI3dpki18d/giNKINZ0eDQrO8MV2boHkATHk8Hsg2zha8flfwfsiyW3NkgTMnCjM/zuw==
X-Received: by 2002:a05:600c:468f:b0:434:f335:855 with SMTP id 5b1f17b1804b1-43668b78324mr57816825e9.28.1734852382178;
        Sat, 21 Dec 2024 23:26:22 -0800 (PST)
Received: from ?IPV6:2a0d:6fc2:56d6:3b00:20f3:5417:1c06:8272? ([2a0d:6fc2:56d6:3b00:20f3:5417:1c06:8272])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828ba0sm8086400f8f.14.2024.12.21.23.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 23:26:21 -0800 (PST)
Message-ID: <a1c2d1e1-4180-48a9-a5c4-7a04feef97c8@gmail.com>
Date: Sun, 22 Dec 2024 09:26:19 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Distorted sound on Acer Aspire A115-31 laptop
To: Kailang <kailang@realtek.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions Mailing List <regressions@lists.linux.dev>,
 Linux Stable Mailing List <stable@vger.kernel.org>
References: <e142749b-7714-4733-9452-918fbe328c8f@gmail.com>
 <b4763f69b4004b19ab5c5e0a8f675282@realtek.com>
 <0625722b-5404-406a-b571-ff79693fe980@gmail.com>
 <ff166dfd38db410d8a82489ff487b437@realtek.com>
Content-Language: en-US
From: Evgeny Kapun <abacabadabacaba@gmail.com>
In-Reply-To: <ff166dfd38db410d8a82489ff487b437@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 > Headphone or Headset. Which did you use?
 > I don't know your platform has headset mic support or not.

I use headphones (no mic). I suppose my laptop should support a mic, 
because there is an icon next to the headset socket which shows a 
headset with a mic.

 > Could you record sound via headphone?
 >
 > I want to know how the voice distortion.

I've run some experiments to determine the nature of the distortions, 
and I found that on affected kernels, what I'm hearing is the difference 
between the left and the right channel of what is playing. So, if I play 
a mono sound, I hear nothing at all (or rather, almost nothing). If I 
manually mute one of the channels, I hear the sound normally (through 
both ears, while on older kernels muting individual channels actually 
works). If I invert one of the channels, I hear the sound normally as 
well. If I play a stereo sound (for example, a music track), I hear 
distortions.

