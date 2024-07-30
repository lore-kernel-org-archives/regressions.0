Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8CD18CC02
	for <regressions@lists.linux.dev>; Tue, 30 Jul 2024 19:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722368936; cv=none; b=Ahjv1X5v2QARl8sknSPDi7cHHrRTp3hsx/9Fkvq66YlvaaM4SjRGP7Rh9jQBZ/jMC/lXK9ymxtNn2qZUyqMkpCdVcxu5Xhw8KUwo2+E/MC1H/R1eElXGkC3EA9fPjjfepkTSJUwNw7i6IK0Dx4TUp+vOB7kafEUb8WFP2Qqzmt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722368936; c=relaxed/simple;
	bh=OXu4MibL4JredU/PNwNqIGdiLxd/4iWXMnITBO3/gu4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RJJsmWHrnzxAD/qwF5jB4sazjGEEOPLjtPzLnaI6Ug+IGeXhXqohQ4Angr2T6aqbHIYDFt1UlgUL1eCB29fgEbeAvD39dTCcglKbID/CrRTvE+7Tm963p1u/qGwS9seqavsBQSxGmQBGkxrZAaM1mbIca/fgy0c3wBBNJHY4maI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org; spf=pass smtp.mailfrom=penguintechs.org; dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b=lc6xAgvc; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b="lc6xAgvc"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-6bce380eb96so2908809a12.0
        for <regressions@lists.linux.dev>; Tue, 30 Jul 2024 12:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1722368934; x=1722973734; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c9EkhHDAPH3EY2x4sYEJYBBnr14AvRj62l4IGCGKO5A=;
        b=lc6xAgvcl86TmvJoErJ/Jd/huicy6treQALputbD5vP6sDfb32AywTiH9iiU2eL0g7
         EjUWoXO1zxKiObrKLI1MtR3tfaS2BxKles9eMGg6YXP18KwyFfNcbijH3lQCySLrgZj0
         oThlGbOotqjCY86MlyCkB58ToXUl0mm9tpdAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722368934; x=1722973734;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9EkhHDAPH3EY2x4sYEJYBBnr14AvRj62l4IGCGKO5A=;
        b=Iji9juSpgzFOTilFjmCbs2O89zBPKWO5HWMZdTrSUVheWiJV0JS/e6oIUaJxDxjOpp
         nQF8zM/YEfceIqpwsyPvkNSkUxqiWgGWCZ4c4WLhJuESkaN1P1U7/0fvcsnrobCeiXuP
         VxD1apCzwILHz8xJU/RkYP64JyEv/Y2piZc5mTpoOlWZy3Mevt7MzmPgbkhrzyMovLf4
         UF7uI8seyXvzOI3I2/mw9QJGWda4lWKAE7Uh/bqE8QXYQaqCWnC6tnqSDPE81I4ChmWD
         9C/T8TaCjppAMoOL4lYJZJb5Pj4hrM2MeHUkZxu951L/1v0RELGqCvoonZIOP+C7di6/
         zxrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJzhTgOcd+cPixoqHHHy3Qae8pThHx8uff4bH+tavc3bgH+wRIr+lij2A1VKeH1GiG7ZaNt8d1KvYo+FqlVOhRhXPULNUUTenNaMQ=
X-Gm-Message-State: AOJu0YwwpQhyLKQvfvQ/jtP0fzK44WquFpd3uUt/EBuFtq0vInaOFl41
	GQPnGXW6dCxiDzyNjoAiCScv+TQdyH9xS7hI1R1FEYcyuPAedP8MAMs72ItyzQ==
X-Google-Smtp-Source: AGHT+IESMFG7TMqZ8KvnM0uOd8+NR/Y9WY4gRiEXGGsXw6F29eUbRL8YprJYY7XiR2lm7b4JXyD7cQ==
X-Received: by 2002:a05:6a21:e91:b0:1c4:dfa7:d3ce with SMTP id adf61e73a8af0-1c4dfa7d655mr3491303637.17.1722368933807;
        Tue, 30 Jul 2024 12:48:53 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f884c166sm9310838a12.49.2024.07.30.12.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 12:48:53 -0700 (PDT)
Message-ID: <1ff58133-7322-47fc-b3db-6fe4a697aefe@penguintechs.org>
Date: Tue, 30 Jul 2024 12:48:51 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA6390 broken in current kernel
From: Wren Turkal <wt@penguintechs.org>
To: Zijun Hu <zijun_hu@icloud.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-bluetooth@vger.kernel.org, regressions@lists.linux.dev,
 Paul Menzel <pmenzel@molgen.mpg.de>
References: <27e6a6c5-fb63-4219-be0b-eefa2c116e06@penguintechs.org>
 <CABBYNZ+vVFUm1Tb+BvViYMJd6XQczTYPgyO++GGbCcWrkaC4Kg@mail.gmail.com>
 <30319168-9456-49dd-be27-480b2a068fe3@penguintechs.org>
 <1a519b2f-f5cf-40b3-8223-162dc04f8ca8@penguintechs.org>
 <21645f07-da90-4441-8dbb-d999298165e9@penguintechs.org>
 <09962266-9b55-408b-8b5d-d2387c871eef@icloud.com>
 <0940abda-fe74-4009-9a83-7384bb8cf103@penguintechs.org>
Content-Language: en-US
In-Reply-To: <0940abda-fe74-4009-9a83-7384bb8cf103@penguintechs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Zijun,

On 7/30/24 12:26 PM, Wren Turkal wrote:
> On 7/29/24 9:25 AM, Zijun Hu wrote:
>> On 2024/7/27 03:25, Wren Turkal wrote:
>>> On 7/26/24 11:52 AM, Wren Turkal wrote:
>>>> On 7/25/24 1:47 PM, Wren Turkal wrote:
>>>>> On 7/25/24 1:35 PM, Luiz Augusto von Dentz wrote:
>>>>>> Hi Wren,
>>>>>>
>>>>>> On Thu, Jul 25, 2024 at 2:35 PM Wren Turkal <wt@penguintechs.org>
>>>>>> wrote:
>>>>>>>
>>>>>>> Hello BT folks,
>>>>>>>
>>>>>>> Just so y'all know, the QCA6390 bluetooth hardware appears to be
>>>>>>> broken
>>>>>>> at least since commit 720261cfc732.
>>>>>>>
>>>>>>> The KDE and Gnome bluetooth control panels appear to think there 
>>>>>>> is no
>>>>>>> bluetooth hardware. Rolling back to 6.10 appear to function.
>>>>>>>
>>>>>>> I have a Dell XPS13 9310.
>>>>>>>
>>>>>>> I will attempt to capture some kernel logs in a bit.
>>>>>>
>>>>>> git show 720261cfc732
>>>>>> fatal: ambiguous argument '720261cfc732': unknown revision or path 
>>>>>> not
>>>>>> in the working tree.
>>>>>
>>>>> I gave you the sha for the built fedora rawhide kernel package, not a
>>>>> mainline sha. Sorry about that. I thought it was a mainline sha. I am
>>>>> trying to bisect the problem. Hopefully, I can get a mainline git sha
>>>>> for you soon.
>>>>>
>>>>> If it helps, the build date of the kernel is 2024-07-19.
>>>>>
>>>>> Sorry about the confusion. Hope this helps track down the problem.
>>>>
>>>> I have managed to get the following commit id range for the issue:
>>>> 80ab5445da6235..e2f710f97f35
>>>
>>> Narrowed to 80ab5445da6235..586f14a6a182
>>>
>> i feel a little sad that QCA6390 of your machine are broken again.
>> i find out a doubtful point by checking recent changes.
>>
>> you maybe have a attempt for below change if you would like to do that.
>> https://patchwork.kernel.org/project/bluetooth/patch/20240730- 
>> qca6390_fix-v1-1-e0340a511756@icloud.com/
>>
>> thanks
>>
>>
> 
> Yeah, I am sad that my bluetooth is broken again as well. I am trying 
> your patch now to see if it gets my hardware working. Will reply back soon.
> 
> wt

This patch does not fix the problem. The first broken commit is 
9a15ce685706e73154. This patch effectively reverts only one part of that 
patch.

FTR, I applied this patch on top of the parent commit of the first 
broken commit. I will try it on the tip of mainline as well.

wt

-- 
You're more amazing than you think!

