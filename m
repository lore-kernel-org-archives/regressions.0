Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA0B173
	for <regressions@lists.linux.dev>; Fri, 23 Jul 2021 13:20:48 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id d17so1253751qvn.13
        for <regressions@lists.linux.dev>; Fri, 23 Jul 2021 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JDgRgmChcEJr1PN5eAOZivpQ+36V1qAe0wUaZdSyEFU=;
        b=rNVm+yDO7jkaRA3M4MefpXFvaj1mX9BQRfSUqgnlU0SKUFYk1gaH1DkEFrsSmHg6hX
         lMaptpxR/Gb5FIvnD4pWLdaZ2JeSjRhPWgzu9jRoERLPLPof1x0aEUUxfGXIr5rlbIC/
         shEsWdtCreOgDHRoJXGMLwVKL6DAmwx/W79+5Jy52yf7BDUQcpHnOI6W7vbWOPcSNmnt
         3by1td19iGDW5krv45jhYGszDWs3BdaljIdND7lsICQxrJaOMsQcXNvSPjp1Ssl46jpQ
         SF8DuYrEtjaQfn5jE8JF2k/plew4lcnOieW0N/4uLuHT9260bK/1/N4zr3p0quLfYP1e
         suWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JDgRgmChcEJr1PN5eAOZivpQ+36V1qAe0wUaZdSyEFU=;
        b=h9H7GMkPnn0dVQt60Xt55WaUyXDqdRYev3bY9oWsv5C7VoabiMbfoHCjSogTlwQvoK
         7NCunGHlwbCy6s0HSHYugovTTJfEfgWe3Zeoro5nuEuU1RMuwTYtXl43tjOxx5B0r7Fq
         Brne/K0PwAn/UmtCwfzSnN/dhFwidjiNrSjeTDkGNaBG35uwy+7KLKYKnii9GOrEWZau
         CwwZa4yCACiNJWKSleYzhBzJSs0DzFEL0tmtUIGyGhaF3jVSZN9Wj0AKJDu0XlgRk57p
         504/35WrxHTsjmo6R64L4fZCXLjo9eUs/eP0Ya2pSjqxTwjyOL/OYyKtkLp2174i53Wb
         Uurw==
X-Gm-Message-State: AOAM532u+iU4HCcAlV7BeneOx+mi+UvbuILuNtZt9/gB12xJqFmXq/Ug
	qtFKNHJgDspILyOlz0xDrSeC0QLfyF0=
X-Google-Smtp-Source: ABdhPJzc3CJXy0rkf6427qirbVf3bd++tmUjTh6vsQ+LJoI51/dRlyLJGXqHIkoYOswAAZ4umUWzOQ==
X-Received: by 2002:a0c:8e09:: with SMTP id v9mr4768422qvb.15.1627046447636;
        Fri, 23 Jul 2021 06:20:47 -0700 (PDT)
Received: from mua.localhost ([2600:1700:e380:2c20::47])
        by smtp.gmail.com with ESMTPSA id h66sm7997095qkc.47.2021.07.23.06.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jul 2021 06:20:47 -0700 (PDT)
Subject: Re: boot of J1900 (quad-core Celeron) mobo: kernel <= 5.12.15, OK;
 kernel >= 5.12.17, 5.13.4, slow boot (>> 660 secs) + hang/FAIL
From: PGNet Dev <pgnet.dev@gmail.com>
To: greg@kroah.com
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
References: <5b5d1b7f-7327-52a2-5221-de39206a07a3@gmail.com>
 <YPppToU9X3LZYwoe@kroah.com>
Message-ID: <6a2784d4-c348-1bef-063c-a7db2ffb1248@gmail.com>
Date: Fri, 23 Jul 2021 09:22:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YPppToU9X3LZYwoe@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/23/21 3:01 AM, Greg KH wrote:
> On Thu, Jul 22, 2021 at 05:10:02PM -0400, PGNet Dev wrote:
>> My servers run Fedora 34, with latest kernels.
>>
>> Updating to any of minimally- or un- patched 5.12.17 or 5.13.4 hangs/fails, as follows.
> 
> Can you use 'git bisect' to find the offending change?
> 
> thanks,
> 
> greg k-h

unfortunately, not simply.

These are rpm installs, from unpatched builds,

> updating to any of minimally- or un- patched,


> 
>     Fedora (5.12.17-300.fc34.x86_64) 34 (Thirty Four)

>         https://koji.fedoraproject.org/koji/buildinfo?buildID=1780670


> 
>     Fedora (5.13.4-200.fc34.x86_64) 34 (Thirty Four)

>         https://koji.fedoraproject.org/koji/buildinfo?buildID=1782334

> 

>     Fedora (5.13.4-250.vanilla.1.fc34.x86_64) 34 (Thirty Four)

>         https://fedoraproject.org/wiki/Kernel_Vanilla_Repositories

>         https://repos.fedorapeople.org/repos/thl/kernel-vanilla-stable/fedora-34/x86_64/

>         https://fedorapeople.org/cgit/thl/public_git/kernel.git/tree/?h=kernel-5.13.3-250.vanilla.1.fc34

available at stable release versions, not my own source builds.

and, of course, this issue appears only on this J1900/Celeron hardware *production* server.

Is there a specific set of kernel rd/systemd/etc debug logging flags that would shine more light on the problem?

