Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD160648
	for <regressions@lists.linux.dev>; Tue,  4 Apr 2023 05:29:50 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id eh3so125772147edb.11
        for <regressions@lists.linux.dev>; Mon, 03 Apr 2023 22:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680586189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+AH8+cRT9BzttlXhbJKMohkajScydtqlMaLV4AFHi40=;
        b=QKWeindqfEx1BF38SzIlBd2rEEYgGUAilkrgqgQ9f0nVVPBK6++GHMDg5Xq4D1FQZl
         8wTjvXWFvQa9J1WJ6lJNtCi4ROndzyAOYNYrIbZCNsJgyxSHKHaXSooT2IBZnmG/SGal
         nu5kN1Gcwhd9iTj08/nZ2zzK9NX8QaW+pWk8gZfiqIYAz/acgo95/pTfkw6txTzIuXZN
         WvZUr0iffL/TRmzP+HLUGfNy1eDR3Ikep49Aa9IF7U6ZQ1mL3Obksw8ySyAsz6ON76Iq
         L4C8Wk3HULwxKm/wzuy33Bsq9MqW8aLHlKHPN43V4C1EWOiO9PUpS2xbgnt5jFUP/UJU
         PsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680586189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+AH8+cRT9BzttlXhbJKMohkajScydtqlMaLV4AFHi40=;
        b=OcW814y650lYuYJ5xwazqvNGnlKzlEaepSSiM25RaCoW7aMpjF1yysyZ/p36po1FM9
         /QmwsjK/TT7s00zlYWf4XGhCaTO5/LFWkB59auTv0RKGNEvD9A71dcTLIQArz6emArlP
         D0Lt6fzxUELl+e7z0ybsLMb8fVjK+wYcnVZBuT4j2VldKjs9D05N0eK/1cA9N3Csh2XU
         hd2aZgQI/Q8GhlKHMrX6fe6z2l0M/9z4CsnSK7n4H4gvhRDWuwmhYGdvqX00svC9AieQ
         rR68y2To4icY5OEZMKS+D1LzvVTDqXAzCkRgfsVgKpxf7IQLIYrtyS+l0UE3QVXaUicr
         ybtQ==
X-Gm-Message-State: AAQBX9d5BwgDw8nRkYkWomGZR207ljnizTDxpit/h8gnPJk77OpA1SSc
	ZPENSLTFo53rn4FlpglkHqrkqg==
X-Google-Smtp-Source: AKy350YRXj8JF5zknuqNdy3NJB91LmgMzOsPkxGo3TnfJkmyu6Z2nM2PaayhN73Eu9alOckxw0GanA==
X-Received: by 2002:a17:906:b044:b0:944:49ee:aea2 with SMTP id bj4-20020a170906b04400b0094449eeaea2mr1157530ejb.71.1680586188869;
        Mon, 03 Apr 2023 22:29:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:233a:5c18:b527:381e? ([2a02:810d:15c0:828:233a:5c18:b527:381e])
        by smtp.gmail.com with ESMTPSA id k26-20020a1709062a5a00b009331450d04esm5514550eje.178.2023.04.03.22.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 22:29:48 -0700 (PDT)
Message-ID: <50fa11f1-35bf-fa93-bc96-d1e0a05abc0f@linaro.org>
Date: Tue, 4 Apr 2023 07:29:47 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Regression: NULL pointer dereference after NFS_V4_2_READ_PLUS
 (commit 7fd461c47)
To: Olga Kornievskaia <aglo@umich.edu>
Cc: Trond Myklebust <trondmy@hammerspace.com>,
 Anna Schumaker <Anna.Schumaker@netapp.com>,
 linux-nfs <linux-nfs@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <f591b13c-4600-e2a4-8efa-aac6ad828dd1@linaro.org>
 <82526863-d07a-0a5d-2990-1555b1387f26@linaro.org>
 <2C5E9725-F152-4D2E-882E-CF92A35481BF@hammerspace.com>
 <7ba38377-7992-7f0f-d905-cceb42510f39@linaro.org>
 <51430925-8046-7066-84ed-2ff0db835347@linaro.org>
 <CAFX2Jf=5X3zyZEWQmD6Rg9jQAD7ccDbae5LQCwrAyPCVVoFumg@mail.gmail.com>
 <2add1769-1458-b185-bc78-6d573f61b6fc@linaro.org>
 <CAFX2JfnKy7juGQaDTzqosN9SF-zd+XrhSL9uh_Xg0GpJGDux-A@mail.gmail.com>
 <32530c36-91d0-d351-0689-aed6a0975a4b@linaro.org>
 <2f285607-cbf9-6abc-f436-edb6e9a3938b@linaro.org>
 <CAFX2Jfmz7QqZBEdzbPUhPs0yctnXVaVF68tX1c57YX=6ki=0TA@mail.gmail.com>
 <4fe39d77-eb7c-a578-aefa-45b76e2247c2@linaro.org>
 <CAFX2JfmdRMsHPTySiw4vm7BwJfRZj3s0V3_v7NJ+XwMxBBSo9A@mail.gmail.com>
 <a3683dd3-3f30-bb4c-539d-d1519de6e5bf@linaro.org>
 <CAFX2JfnS9GVc4NaxKhr9E4y10NNv6SPgcv1yoeHTfEw5NvZgMg@mail.gmail.com>
 <CAN-5tyGUBB0zoPbdJ=3yCE+eJJyP2qH3uobFP+XEMsFNex_LEA@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAN-5tyGUBB0zoPbdJ=3yCE+eJJyP2qH3uobFP+XEMsFNex_LEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/04/2023 03:01, Olga Kornievskaia wrote:
> On Mon, Mar 6, 2023 at 12:12 PM Anna Schumaker <schumaker.anna@gmail.com> wrote:
>>
>> Hi Krzysztof,
>>
>> On Tue, Feb 14, 2023 at 6:02 AM Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> wrote:
>>>
>>> On 12/02/2023 15:05, Anna Schumaker wrote:
>>>>>> From ac2d6c501dbcdb306480edaee625b5496f1fb4f5 Mon Sep 17 00:00:00 2001
>>>>>> From: Anna Schumaker <Anna.Schumaker@Netapp.com>
>>>>>> Date: Fri, 10 Feb 2023 15:50:22 -0500
>>>>>> Subject: [PATCH] NFSv4.2: Rework scratch handling for READ_PLUS
>>>>>>
>>>>>
>>>>> Patch is corrupted - maybe mail program reformatted it when sending:
>>>>>
>>>>> Applying: NFSv4.2: Rework scratch handling for READ_PLUS
>>>>> error: corrupt patch at line 12
>>>>> Patch failed at 0001 NFSv4.2: Rework scratch handling for READ_PLUS
>>>>
>>>> That's weird. I wasn't expecting gmail to reformat the patch but I
>>>> guess it did. I've added it as an attachment so that shouldn't happen
>>>> again.
>>>
>>> Still null ptr (built on 420b2d4 with your patch):
>>
>> We're through the merge window and at rc1 now, so I can spend more
>> time scratching my head over your bug again. We've come up with a
>> patch (attached) that adds a bunch of printks to show us what the
>> kernel thinks is going on. Do you mind trying it out and letting us
>> know what gets printed out? You'll need to make sure
>> CONFIG_NFS_V4_2_READ_PLUS is enabled when compiling the kernel.
> 
> Hi Krzystof,
> 
> Since you are the only one hitting the problem, could you be so kind
> as to help with getting this resolved.
> 

My setup is not special. It is regular ARMv7 board using a regular ARMv8
NFS server. Anyway my farm is since some time offline due to relocation
and will be online in June, so I cannot test anything.

Best regards,
Krzysztof

