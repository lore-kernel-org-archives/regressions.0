Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4133618C90B
	for <regressions@lists.linux.dev>; Tue, 30 Jul 2024 19:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722367585; cv=none; b=LTA0LoRPZA7+IxGnM+jzB38B82NKVe7mFk2aRxd0KAso+HiS1iFgvSIQPdGM2nnn0MTnA6S9BRhu+LLuYXhoNbnucSOxSCWrd5pnt3pEdM6y0LKBZbO5fhR5NXuXIT8jYH8sDpVn2A5sjQW279Hi4NsDi86YsfnZLvmSQ/3bHEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722367585; c=relaxed/simple;
	bh=ztJ5rC9PI/tOscxKy98Vst5pQmsXjaJAGvVDEdMTcMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6fT3FDsMH55eqIDl2xrR0muiENgqk6dJ3IuqMenbA1FHD+kI7kH4t13uLO6JIWAgeCvma4Az2Xr7k0Evb6RZxhJ01D682+aJI/MMTnhlXRvEO4fNCJlKkPbeq3t4Aufy8SBR5Pn9sixieiFZO7qswLaLYTZJwumpdayxGbwSuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org; spf=pass smtp.mailfrom=penguintechs.org; dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b=eI4C4eFv; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b="eI4C4eFv"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fd6ed7688cso36044425ad.3
        for <regressions@lists.linux.dev>; Tue, 30 Jul 2024 12:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1722367583; x=1722972383; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1XcbzX34Ot33jFYRrDcJDvJ/x2goxeZ+go78g1FaQp0=;
        b=eI4C4eFvH9hBHm9MFfEdC6+zjdg/RFTfEhi+PehRBif3voArSiw2kiEtBCemS99azZ
         vxqGnfjfxDeywyI4YI+Hzb3M4Mx+BbvdrgDwP/ByGq3HFoL3IXSOJMwqq25n9T4699ny
         a2K7VmcrAc6VCRqNzLotZCuVZbpPsYg5VYSAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722367583; x=1722972383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1XcbzX34Ot33jFYRrDcJDvJ/x2goxeZ+go78g1FaQp0=;
        b=a+u7ACqfNP+zY38DbGBOq3nOFhXbUzw0i0Z+avxNp+wd1yclP325RIrCPYL1I55GBn
         Aa7xLPR3d9nmqc0IGLl2szNJK4smKrJrBuo5Ep8a0cNSS699DqFOPfwWewiq9/Wr/DKY
         LwHI3Ri8pzyvsns4J5YOSNvXTYHXZYKusRDRMeUuxoHvSQM18BccRsGZoSFIw2W3B/z6
         +1C0Q7h/0zJa02gpZ5OYSSTS0FgaBgjPRSuPyHwqYs5m3DEcTx7mQ8wBMso4FBiKhm+W
         vJtkiI1NWQMvWd/du2EM1VxZ2cp+Kxa03AhRXjOhPDaKMoEy5tFFeRW/TbzDb3vmhiWQ
         kORg==
X-Forwarded-Encrypted: i=1; AJvYcCVaOGdBjRjoqmyFxmDoSbqaZJFGKeMW7x8rdYcQNWtALwacGOIEggNBbzp+hgWwKVfUMOfUg4s/kMpMD8bJgPW/uzefIlEwLIx0E1s=
X-Gm-Message-State: AOJu0YxDy74f+8vUTG6gY5mcnO44oinq8yKNH4TBGXf66S/wdx1pTAaF
	pQn14wy4VHmAWxD9QTJlLLuD7vpGCnvPbMeCg5ONXvsLSqvKdoJ52RcZeRD7PERRZBkSjSQeQE8
	qJw==
X-Google-Smtp-Source: AGHT+IH7tNcgJ5QP4cVhlh6mowZeJv6uaq1z15ufa+6GH4tBSpwLS3/bXJxqfGz/O2jLnrXFrmPyoQ==
X-Received: by 2002:a17:903:18b:b0:1fd:7e56:e108 with SMTP id d9443c01a7336-1ff04840dd8mr109606145ad.25.1722367583382;
        Tue, 30 Jul 2024 12:26:23 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fd6113sm105277285ad.283.2024.07.30.12.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 12:26:22 -0700 (PDT)
Message-ID: <0940abda-fe74-4009-9a83-7384bb8cf103@penguintechs.org>
Date: Tue, 30 Jul 2024 12:26:21 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA6390 broken in current kernel
To: Zijun Hu <zijun_hu@icloud.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, regressions@lists.linux.dev,
 Paul Menzel <pmenzel@molgen.mpg.de>
References: <27e6a6c5-fb63-4219-be0b-eefa2c116e06@penguintechs.org>
 <CABBYNZ+vVFUm1Tb+BvViYMJd6XQczTYPgyO++GGbCcWrkaC4Kg@mail.gmail.com>
 <30319168-9456-49dd-be27-480b2a068fe3@penguintechs.org>
 <1a519b2f-f5cf-40b3-8223-162dc04f8ca8@penguintechs.org>
 <21645f07-da90-4441-8dbb-d999298165e9@penguintechs.org>
 <09962266-9b55-408b-8b5d-d2387c871eef@icloud.com>
Content-Language: en-US
From: Wren Turkal <wt@penguintechs.org>
In-Reply-To: <09962266-9b55-408b-8b5d-d2387c871eef@icloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/29/24 9:25 AM, Zijun Hu wrote:
> On 2024/7/27 03:25, Wren Turkal wrote:
>> On 7/26/24 11:52 AM, Wren Turkal wrote:
>>> On 7/25/24 1:47 PM, Wren Turkal wrote:
>>>> On 7/25/24 1:35 PM, Luiz Augusto von Dentz wrote:
>>>>> Hi Wren,
>>>>>
>>>>> On Thu, Jul 25, 2024 at 2:35 PM Wren Turkal <wt@penguintechs.org>
>>>>> wrote:
>>>>>>
>>>>>> Hello BT folks,
>>>>>>
>>>>>> Just so y'all know, the QCA6390 bluetooth hardware appears to be
>>>>>> broken
>>>>>> at least since commit 720261cfc732.
>>>>>>
>>>>>> The KDE and Gnome bluetooth control panels appear to think there is no
>>>>>> bluetooth hardware. Rolling back to 6.10 appear to function.
>>>>>>
>>>>>> I have a Dell XPS13 9310.
>>>>>>
>>>>>> I will attempt to capture some kernel logs in a bit.
>>>>>
>>>>> git show 720261cfc732
>>>>> fatal: ambiguous argument '720261cfc732': unknown revision or path not
>>>>> in the working tree.
>>>>
>>>> I gave you the sha for the built fedora rawhide kernel package, not a
>>>> mainline sha. Sorry about that. I thought it was a mainline sha. I am
>>>> trying to bisect the problem. Hopefully, I can get a mainline git sha
>>>> for you soon.
>>>>
>>>> If it helps, the build date of the kernel is 2024-07-19.
>>>>
>>>> Sorry about the confusion. Hope this helps track down the problem.
>>>
>>> I have managed to get the following commit id range for the issue:
>>> 80ab5445da6235..e2f710f97f35
>>
>> Narrowed to 80ab5445da6235..586f14a6a182
>>
> i feel a little sad that QCA6390 of your machine are broken again.
> i find out a doubtful point by checking recent changes.
> 
> you maybe have a attempt for below change if you would like to do that.
> https://patchwork.kernel.org/project/bluetooth/patch/20240730-qca6390_fix-v1-1-e0340a511756@icloud.com/
> 
> thanks
> 
> 

Yeah, I am sad that my bluetooth is broken again as well. I am trying 
your patch now to see if it gets my hardware working. Will reply back soon.

wt
-- 
You're more amazing than you think!

