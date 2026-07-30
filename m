Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD52243F8A6
	for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 15:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425575; cv=none; b=Tw4mEe5A2tbj0Ue7W2uBpi8l0EmYiGBNgXK27xqsXhr6mHlZJwgnbH4LQzrE4w4HWTJp+sxz83nKkwd+aBoQ39X7CoTJmiSrFwenCpK6v2uIBlRnXNmosjcMFwJTmNjy8GjUps0ac3OwxmMD80ThzdGA9Gf5Jz5K7wqdZhn+TkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425575; c=relaxed/simple;
	bh=kcxnimzE+NwrpZXTyFkDpktSPBy6/V8uveOxUQRDcak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H96LMgjOs2FbRjEoxK/6PGU4Foir3rs8jBITv3ub8drM07LZIExM9yHx3ub8i1YNL04/gQD8xcLyI379HEm3TjAv6C3e1L71BYeHB4Ax6aTCizAotzDoe06PXA1ezJDOtcn7uzQNGdTXCg15etyHDN29YBWjq5mXJ2/fPJOdA3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/1JRQ5n; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/1JRQ5n"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f7027ca11so1514265f8f.3
        for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 08:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785425572; x=1786030372; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kcxnimzE+NwrpZXTyFkDpktSPBy6/V8uveOxUQRDcak=;
        b=l/1JRQ5nSyQFu/JZquRHauy/oEAvPyPmicJZSBzbGWtaw/ud581EREAu2R66oPQHCA
         q3Ii66YdeTwrml+/ngmpsjLhRUmfmjZdjlpPYiI81qK3oSmLX5b2/N1LalR6/D9nBMla
         ZTGpzsf7G4lgB5obKWccBRFOTX6pP0FcIOU4lIVWwlqxf4bEXwn7REiOFmOpvhnoBy9H
         l5wFt3AVUf6IgteEFme02ylFr2t2xjeF070aCd5rcq7UoJQ4afuKGNNpzyJqgkoia5rg
         BLlY9BFqtzWvt/H8RmpqSzhxE/+m5nN1A2S0gEjm1q6bD9T/uLCxj6OUh+80KB0drnCD
         KLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785425572; x=1786030372;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kcxnimzE+NwrpZXTyFkDpktSPBy6/V8uveOxUQRDcak=;
        b=j6DFuG6gSM3eeAnCu9AW5MnjkUKCaViCXTP2FqgkvfTsbGoYxyheUhtozA69RFuJjX
         0StIidrus00zVW4ORLi/r+UTwQdDlhza7OLvNeelemMqdCkuDD+uvg5nEZf79GBFIAY9
         Nd+FXTO81QLgeiHcbgXaX6aPpkugPx8Vlh2gM1PTcxWfQuWtACcuAZiNQXJr2LSC/fBY
         UaForURbeeOifp7rpUUMSf4jOV7k8ZEflZC+zQ3BN4qp/EPun4NEOQYKc0JTFa6zoNjt
         R9gqzmpn/9bcS7L3EzfJywQEQ1zBTmxz0dPum6hgOghU1hMrtfGz/cdnSj6kQ8RbF5up
         3AVA==
X-Forwarded-Encrypted: i=1; AHgh+RpB9ltpMQOqqKZBflUBsHJP7Cy0uBIeCFTOTXgoU9nhdnO+fdXFvEBmimSyY/8hdCN/6pfWiUceXfUqzw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwX12eLglYPx6l39rp05KaFdpP9NuLuR+dtoxdHczQLBpyds9Fv
	GC2Z1uHKopPZYY0QyTppRbckcXQYNNEvfFNTZaheWCbAhBJweqo5bdrc
X-Gm-Gg: AR+sD127G+0yQnrZFEd56qy6ix5RJlFOWdxE14844LveTnToBjWlscGZLpwuu5axTaA
	tj8QJBzCiKOkojnwnZLomlzYmNmX1NsVZKprRCugwNqssM1cSgd+MVfk27TkWokbvXPc4bnM/d2
	i8vJf5OAyq7TSto87l3XPe2kfNG03XGd5vvmCvbazKexTV+TNgkBpXGAGg0SFd8tB9E9rxiGT28
	tCRaxVuH6Xf2VETV/7pPxwr95HUVna8dJL0X9Gqf+RSm7jmzGlWf+39l/JpyNDFOCwmnJ+Pjx08
	G5SIGuLXQTROnD+ImDzfeshA0Rahekz40plzSKermNY3SgeemC+BH7aFvFuAAYC6e46dh71HmY8
	d6akuxS6iAMnn1hLYonxvIuqP7NmL/K9cvjJsm5rbmw3Bw5AtvVAZ+VfJHIpvMp3LlQC8AeJhma
	2iq8QW9pOk8aVm61qQjfRm3BjwrJ9opuPchGCaQfBCCqVybbemiu2Jl8P9uw==
X-Received: by 2002:a05:6000:4383:b0:47f:8e50:93de with SMTP id ffacd0b85a97d-47fc8558e5fmr5006031f8f.54.1785425571669;
        Thu, 30 Jul 2026 08:32:51 -0700 (PDT)
Received: from [10.10.0.5] ([59.152.127.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88e64d5sm6485544f8f.15.2026.07.30.08.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 08:32:51 -0700 (PDT)
Message-ID: <daf0bb9b-246d-437d-87ca-16706113b201@gmail.com>
Date: Thu, 30 Jul 2026 23:32:44 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb controller fails to initialize on intel s1200btl
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: rafael.j.wysocki@intel.com, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev
References: <3353bdf3-4f33-44b1-809b-b0378bee5816@gmail.com>
 <CAJZ5v0h1kqDEBYk0k05rv6f2SJ7g+TN4FhBDJYZSVUctu-0FdA@mail.gmail.com>
Content-Language: en-US
From: Julian Silver <mendaxca@gmail.com>
In-Reply-To: <CAJZ5v0h1kqDEBYk0k05rv6f2SJ7g+TN4FhBDJYZSVUctu-0FdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-07-30 21:55:14, Rafael J. Wysocki (Intel) wrote:
> Does adding "intel_idle.max_cstate=1" to the kernel command line also
> help, by any chance?

Yes. "intel_idle.max_cstate=1" also helps (on kernel 7.1.5).
