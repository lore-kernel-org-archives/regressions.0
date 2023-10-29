Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F7F186E
	for <regressions@lists.linux.dev>; Sun, 29 Oct 2023 12:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wa9OoGDe"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6bee11456baso3027793b3a.1
        for <regressions@lists.linux.dev>; Sun, 29 Oct 2023 05:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698582929; x=1699187729; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nyvf2ECex12+I7dvHvT7O/p8GFzQXv0hNbF919EkCCQ=;
        b=Wa9OoGDeAMIEFXlp9GIJpUJOVk/e8XKrqIjIMylfGvAJIhEMmGyHn1bipBnabdm1C7
         0wflBezfYeIhIcuwJliy4CmslSehg1ukx86MW35lyM9ComilM0MYE2KL11OKNXSgjgs6
         ga9m1qoFflVUewXQr81wvraaqjghHWRNT+AEoVfsYPdrtnV/VSGB/5lWfRbz4Pg3RslP
         kGa4+Le6wJqXhWILIpXpnN6eDrN3YXcK0uRFptlPIccLA1XCnH6xjFVqwBFCd6YlfSEz
         7yYRj0ljlGEgXjkKkSIfLaN3NmzpYkdQUDJuWART2gZZMvBbn4EYCemeeUBDVpTodrCH
         UuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698582929; x=1699187729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nyvf2ECex12+I7dvHvT7O/p8GFzQXv0hNbF919EkCCQ=;
        b=ZxF1L7YPINCjHRyS+yFnn5YSI4Oy5y0YFa4ui26Rsy+Mtw0Ri0aSM9vvlVVj5pDExC
         eFMiEV7kLWvuGQh8Tt4WD9NkdmXbQR6wRFt4mNG8Iztj1+QBfr9Pz+NIIIvv/TP0nCOy
         0cM83DfBKqEk/l5xHtjpBrxsGDiOg6Sa9zfjeGIkzUKG24v3epJUJVaEMlK41vmTfTO4
         YfvFlM4n8Jbl0/8gKxydILFRPcyjksKmpdZh8smeM/oh33jZ+Uc55E8pToplSy9aVcN8
         U+kijFK8V1SsN1GlSDoWFG8e+Rb7qA+9HJWYZ7Ye0YAWUbdnvab9pB/V9RfkU/qHaxMU
         aZ1A==
X-Gm-Message-State: AOJu0YyRLyUXGZIhT0bkdqeZZ46FuBygBLfjdV16GzwAalaK+GUmhAIX
	QPla+1UeyGekHaC9R/Ivc6c=
X-Google-Smtp-Source: AGHT+IFx81AUoH5++zXHL2LFJzJTeT7ek4fJNAKuocdR+tXzeeB9rXWvUe9Ai5NyfzkyQgMucVln5Q==
X-Received: by 2002:a05:6a20:3c8a:b0:17f:643f:fc4 with SMTP id b10-20020a056a203c8a00b0017f643f0fc4mr7009699pzj.22.1698582929442;
        Sun, 29 Oct 2023 05:35:29 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id i8-20020a17090adc0800b0028009de5c65sm3900365pjv.39.2023.10.29.05.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Oct 2023 05:35:28 -0700 (PDT)
Message-ID: <69762dcb-1c9d-4f2a-a8a4-8de5de08a800@gmail.com>
Date: Sun, 29 Oct 2023 19:35:19 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Virtio is all not working in linux 6.6 rc-7
To: Anil Choudhary <anil.choudhary@vdx.tv>,
 Linux Regressions <regressions@lists.linux.dev>
References: <5CD3E875-9A33-4AC8-A85E-E933A0C9E02F@vdx.tv>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <5CD3E875-9A33-4AC8-A85E-E933A0C9E02F@vdx.tv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/10/2023 02:22, Anil Choudhary wrote:
> n/a

Hi Anil,

Please describe your regression issue, preferably with appropriate
kernel log pasted to your report. For more information, see
Documentation/admin-guide/reporting-regressions.rst and
Documentation/admin-guide/reporting-issues.rst in the kernel
sources.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
