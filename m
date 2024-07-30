Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D645418A6A3
	for <regressions@lists.linux.dev>; Tue, 30 Jul 2024 20:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722370342; cv=none; b=ECoWMtslC43+RW7SdoqPVmz9rjYw6ZTUD/6ZbSEbhlMOJ/y90WDkwFwfEFMiMxGZx2q+yabFHLr5dHz3y94IePLsQ77rOKmzBoDi5OBWGZICUPTgiw5ze/U/k6typTYapljVatr82kPrZXPbhJ+o51uCRMbKQAIW8byjaSb2urE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722370342; c=relaxed/simple;
	bh=oHch0y/liq/Caz2nDw5kDy4+ZU0NklzCUbiD/jkjkyU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kMmpfbVHPViYOq7cK8/WyenvH5X8JTzuCMojzD+sTIpyjpzNXoOe5uMIfypo7umYURzVN71ERdOCGELTad/S3pdE69mJ9rHlODUS9KZzIrDhWMNN+TcNBODLaTiHZfcBFu0nL31m4R4HV1sMqb3K1DenQznhUBqunp8WOlQdNRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org; spf=pass smtp.mailfrom=penguintechs.org; dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b=aXd3Jhlk; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b="aXd3Jhlk"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fd90c2fc68so37154845ad.1
        for <regressions@lists.linux.dev>; Tue, 30 Jul 2024 13:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1722370340; x=1722975140; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V5dnQkBu9QVO+QrJ4DY+jfJtkpb3lw/S4HsL3/yvfpQ=;
        b=aXd3JhlkOQ3+B8x0mYXTD7UlZYRaTHC14sUQvwtjKwfst2s5dAP5G3Jz4fQATlwg2N
         6f+B6gLAsRcqj4Fd6UP9rwrCOohPj1rbpDaKVZ1LJEamYaZvMUspt5c9l1N3J4myVZlV
         n86JxLFn4onUveJH0J7Wmn1og7BVWpYqQWJNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722370340; x=1722975140;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V5dnQkBu9QVO+QrJ4DY+jfJtkpb3lw/S4HsL3/yvfpQ=;
        b=IqzMkTgk1xqMunP6kmv3DXsZtmb8bfSY88F5dQ7bcD/MnLEWu6nZrlWVgft3qr+1SH
         BOHQXO5osgQHIF66vPTbjFjGW8r1APE9YxLS/e+saqEJSlloSMzlj+fWDXKpEZC1LTDZ
         vrnbcmOIuEuTmHEpakd7GvF71BZvM0r8lKKACqZR4xjRNVVtYCj2jDYzg3ABv5nhF14V
         kd2UPfLI5L9mSFGtQeL5ON5de0FYG8sf82uXLmpHWZcb67PROx8V8UBDfIZ1/6Nq4CG8
         28oTSYSxmphkipIaJre2X+0O4wJPGPPfvxC80dYbT3uMbtzcJfpHjzsINjJs4tci7Uea
         Y/9A==
X-Forwarded-Encrypted: i=1; AJvYcCWHawLr/Oi9+9a3WxwL3PaipjYnwHalshJuJa/lkBIXgHfx+pInrVuI3eCf8FLRJ5qclWrRKB5iKdxjWlDnk4tFeXA/EF8lp8PDbUQ=
X-Gm-Message-State: AOJu0Yxr75er9Pwt3OakTzHRWJqU7e6FBQxzHyIa2sX9n0CHFd66ytwv
	0MsWV11O2kLbOb+dgCuuTYw0CK9QiP5d5o5+7rIYvobQJCoaYmSnIL1na0c7bw==
X-Google-Smtp-Source: AGHT+IHYOfAoq/mXpTcbUCI/fd0dOFN8EoCUrJ9OgGJ4yonhtdAS2E632yMQi/HDhX8eSqbYEKgw/w==
X-Received: by 2002:a17:903:27cd:b0:1fd:aac9:a712 with SMTP id d9443c01a7336-1ff0486b617mr90900755ad.37.1722370339965;
        Tue, 30 Jul 2024 13:12:19 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f1aa0dsm105977355ad.187.2024.07.30.13.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 13:12:19 -0700 (PDT)
Message-ID: <7e447839-4976-4d3b-aee5-c0961637deb5@penguintechs.org>
Date: Tue, 30 Jul 2024 13:12:18 -0700
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
 <1ff58133-7322-47fc-b3db-6fe4a697aefe@penguintechs.org>
Content-Language: en-US
In-Reply-To: <1ff58133-7322-47fc-b3db-6fe4a697aefe@penguintechs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Zijun,

On 7/30/24 12:48 PM, Wren Turkal wrote:
> Zijun,
> 
> On 7/30/24 12:26 PM, Wren Turkal wrote:
>> On 7/29/24 9:25 AM, Zijun Hu wrote:
>>> On 2024/7/27 03:25, Wren Turkal wrote:
>>>> On 7/26/24 11:52 AM, Wren Turkal wrote:
>>>>> On 7/25/24 1:47 PM, Wren Turkal wrote:
>>>>>> On 7/25/24 1:35 PM, Luiz Augusto von Dentz wrote:
>>>>>>> Hi Wren,
>>>>>>>
>>>>>>> On Thu, Jul 25, 2024 at 2:35 PM Wren Turkal <wt@penguintechs.org>
>>>>>>> wrote:
>>>>>>>>
>>>>>>>> Hello BT folks,
>>>>>>>>
>>>>>>>> Just so y'all know, the QCA6390 bluetooth hardware appears to be
>>>>>>>> broken
>>>>>>>> at least since commit 720261cfc732.
>>>>>>>>
>>>>>>>> The KDE and Gnome bluetooth control panels appear to think there 
>>>>>>>> is no
>>>>>>>> bluetooth hardware. Rolling back to 6.10 appear to function.
>>>>>>>>
>>>>>>>> I have a Dell XPS13 9310.
>>>>>>>>
>>>>>>>> I will attempt to capture some kernel logs in a bit.
>>>>>>>
>>>>>>> git show 720261cfc732
>>>>>>> fatal: ambiguous argument '720261cfc732': unknown revision or 
>>>>>>> path not
>>>>>>> in the working tree.
>>>>>>
>>>>>> I gave you the sha for the built fedora rawhide kernel package, not a
>>>>>> mainline sha. Sorry about that. I thought it was a mainline sha. I am
>>>>>> trying to bisect the problem. Hopefully, I can get a mainline git sha
>>>>>> for you soon.
>>>>>>
>>>>>> If it helps, the build date of the kernel is 2024-07-19.
>>>>>>
>>>>>> Sorry about the confusion. Hope this helps track down the problem.
>>>>>
>>>>> I have managed to get the following commit id range for the issue:
>>>>> 80ab5445da6235..e2f710f97f35
>>>>
>>>> Narrowed to 80ab5445da6235..586f14a6a182
>>>>
>>> i feel a little sad that QCA6390 of your machine are broken again.
>>> i find out a doubtful point by checking recent changes.
>>>
>>> you maybe have a attempt for below change if you would like to do that.
>>> https://patchwork.kernel.org/project/bluetooth/patch/20240730- 
>>> qca6390_fix-v1-1-e0340a511756@icloud.com/
>>>
>>> thanks
>>>
>>>
>>
>> Yeah, I am sad that my bluetooth is broken again as well. I am trying 
>> your patch now to see if it gets my hardware working. Will reply back 
>> soon.
>>
>> wt
> 
> This patch does not fix the problem. The first broken commit is 
> 9a15ce685706e73154. This patch effectively reverts only one part of that 
> patch.
> 
> FTR, I applied this patch on top of the parent commit of the first 
> broken commit. I will try it on the tip of mainline as well.

This patch doesn't appear to apply cleanly to the current tip of 
bluetooth-next/master, so I can't really go further in testing it right now.

Also, so you know, Bartosz has said that he is aware of the regression 
and is working on it.

Zijun, you should talk the folks at qualcomm and see if there is any 
appetite for getting closer to the Linaro folks with regard to this 
stuff. You have been very eager to jump in, and I see that Bartosz and 
Luis also seem interested in fixing this. I do wonder if there a way to 
take advantage of that to build a better working relationship in this 
bluetooth space with qualcomm and the linux kernel devs.

If qualcomm would be interested in hiring a tech person to help with 
this stuff. I am definitely interested in helping in this area.

Thanks,
wt
-- 
You're more amazing than you think!

