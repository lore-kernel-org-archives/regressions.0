Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F8545C1C
	for <regressions@lists.linux.dev>; Mon,  4 Mar 2024 15:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709564881; cv=none; b=Heee2MDy6fkbDZP8+evo80nViqDwPDStHZm7pVlLvvgoBT+UpO83c/91ocR1UU2+q3XshpRO8UV8g2PkegxY1mX9U0A5QmSNYSvYDtwomqq6sXTRekie8TWbyRdwY908X7ahEWXyDf/CQtrrbQcPNbRbL6RamYnVDVe9tj45KnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709564881; c=relaxed/simple;
	bh=0bsNLdlW5oPD7As+xxqNQnSKvVtobIkGNyzgL3+TtHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OrGv/i7hyQEQuWg1qv94+ZRU9CcSWMS++/JZ0HQnWi+ndaNXmvjl7dAZS6HHhhQrSqd5xfJ6nlh8ze6N88NZb3KuWmQ2PGoncprYwgQSqDbuoiLksAeUcfGlkWicswd6ZlD3d3BrQEipa+g8arK7I8F98qsO/6RtT/TFeJ4RvmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=If/R/8ug; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="If/R/8ug"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33e12916565so2446614f8f.1
        for <regressions@lists.linux.dev>; Mon, 04 Mar 2024 07:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709564878; x=1710169678; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SuLvtTItBdW+KFQjOVDTDYjZp8cHHf6HQzGZuz/XxJ8=;
        b=If/R/8ug/vJjtzQ6zKsh/FmVqiTd9EibIAeQ7IADnFyHsjL/ixZItZn9r5r/SVhx3F
         294/IdodEp/7ScqjDxPgemM/dGE4SSAJMdQbacQGSST9gntEcubbj+QYZGVYHxRy6A6o
         CRzecR8h3Dn6bLDFA1mRK03vuQWFBDGpr1v6PJSyRWZ5Ge+HQrjDcWpCaEbjYv2UbcUH
         KakpjEThQR6bsOEqm+GRfMkMDZLg4KObRrKOONjuBVD3hwVpUqpLO1eyqF2WV4q0jKs4
         AmAi7RolveE4RH7yBQhPDmzI2Vuvt3l3DlEKN/V3XMaewUikgtxL/SL5sMCpYcUXVL6v
         A4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709564878; x=1710169678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SuLvtTItBdW+KFQjOVDTDYjZp8cHHf6HQzGZuz/XxJ8=;
        b=dZryGCEyAgFnCZkjDv1GgSUAoVULve6fo0TD9iJ9aSDn55o+DyD3xPzYnciBzUcufk
         TFF+U19gL6/fhMKVGW+eY9FOTW+c4rMMQ6ew3wjbAbOZdJBIYaP6LciWKW4STp7dlnyv
         S0VsZjnVBeGtt6Hw0vuD4gq5PuUWjorSW+DBGFuQzT1ZJBavQ3hhfW3R63JpgUchesmk
         zQOez7Ke1qj+pivlYtubzICd3Si/pqgnjG5L507hGFz2pYqz8WdwDTvU3hZU2TmJpNqx
         Xr/4sT57OEv8uILLghZZrhiGElgSvWCIdBZdFTcLx6xeaC1fcdOJY3UD+RNZ2wC+5Y1y
         WzHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRuzwgENOs1RJ6Mz0p7Ff/moI372iPNiFPXtFux4Pi0ARTz/AyzoFvK5tOZziI+llrzXh1xW84Pau+XSojz9tyJaWsUf5iFR/CqQo=
X-Gm-Message-State: AOJu0YwKwECq+TQHnRUsl85EqK9R8qx7FgabJOsQjPdWQRQsJmJzSFhF
	CdAEAolwbog/DEHgdprTDbnojvvOq7mgQ2m70z3Cn+k0zv+GEhe8
X-Google-Smtp-Source: AGHT+IFPhdSu9kMy8dW4eWTrqqZe1EwoBbENCord9ThR7ss/TK8W9M7oAvcYADxCRldgPP0462S4XA==
X-Received: by 2002:a5d:574e:0:b0:33e:1d01:152f with SMTP id q14-20020a5d574e000000b0033e1d01152fmr10787770wrw.0.1709564877442;
        Mon, 04 Mar 2024 07:07:57 -0800 (PST)
Received: from ?IPV6:2a01:e34:ec5f:c111:d799:a000:58a7:60? ([2a01:e34:ec5f:c111:d799:a000:58a7:60])
        by smtp.gmail.com with ESMTPSA id i5-20020a05600c354500b00412e668b0dasm1995898wmq.43.2024.03.04.07.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 07:07:57 -0800 (PST)
Message-ID: <b30dc4a1-57aa-4ff5-ae52-7a01203b8be9@gmail.com>
Date: Mon, 4 Mar 2024 16:07:56 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: Regression with Lenovo ThinkPad Compact USB Keyboard
Content-Language: fr-FR, en-US
To: Mikhail Khvoinitsky <mhspacee@gmail.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Jiri Kosina <jikos@jikos.cz>
Cc: Linux Input Mailing List <linux-input@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Linux Stable Mailing List <stable@vger.kernel.org>
References: <a29d56d2-c440-4a26-a9ac-014595d2ae8c@gmail.com>
 <21370dc5-94a3-442c-ae04-76f9f94b1b96@leemhuis.info>
 <c8986411-2bf7-4b7d-8ac1-f702dc7c725a@gmail.com>
 <7a5fc584-1520-4e52-9c77-d67a656524c6@gmail.com>
 <10022b0c-89c3-43e1-89ba-00e458fe1dfd@leemhuis.info>
 <7a8d9d60-a151-4b25-882b-48e6929339a4@gmail.com>
 <9db59ae4-be28-4ab3-a2ae-0b0f661f56be@gmail.com>
 <3bb95fcd-65cf-45dd-8d81-1a41b1ae0288@leemhuis.info>
 <CAMMabwNo_yT4S3LaMV16Rmj6MiWL=TRYtB9wspfs_LWVgM=U8Q@mail.gmail.com>
From: =?UTF-8?Q?Rapha=C3=ABl_Halimi?= <raphael.halimi@gmail.com>
Autocrypt: addr=raphael.halimi@gmail.com; keydata=
 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
 Wxcwwn0N
In-Reply-To: <CAMMabwNo_yT4S3LaMV16Rmj6MiWL=TRYtB9wspfs_LWVgM=U8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/03/2024 à 15:52, Mikhail Khvoinitsky a écrit :
> Hi,
> 
> Sorry for ignoring this thread. I've submitted the fix [1] quite a
> while ago but it is now in hid tree targeting 6.9. Maybe we can
> redirect it into 6.8? Jiri, what do you think?
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-6.9/lenovo&id=2814646f76f8518326964f12ff20aaee70ba154d

I'd be glad to test the module with this patch applied.

What's the default setting ? Should I set any parameter in sysfs to get 
the desired result (apply workaround) ?

Regards,

-- 
Raphaël Halimi
