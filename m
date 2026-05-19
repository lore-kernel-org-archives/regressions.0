Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E201836A01E
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 23:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779235028; cv=none; b=Dkcnvps8xezmRANfZa5KRG9OuRzV/ccsGdOhVRjnPvHJz1PYQZxEyFXH86RlfhRyi2356Le1cQgaDeBgUlOmcFy9x4h5b7Y9bVObAkkUimWtIApoLQ1Hsdvrl3267eP/4OmY3PHbz1yxyKKTGfGP6XjPgqyYwKTYpmDkv64+flA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779235028; c=relaxed/simple;
	bh=s+3OhO8jaiv4gp4W2MmMu1vTmS+Aqx0YsvRWaoIeR9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MziewAmc0v9ccbPCRNweEh2zrPfLZQKzL51dR83G5cQtlmn2n9tp5eEFhYuG00SXoJBBwfRnnNZICB0cEnZp46cxrMQT8nAUVXJBQHknG8nmDGdUw/0uvfQwYX3yksr4/jur6Ox0OewKt8wTVZ4+jbG5xtDMAgzzWEC1afkFa24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arHfcmqa; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arHfcmqa"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ee990e8597so10960207eec.1
        for <regressions@lists.linux.dev>; Tue, 19 May 2026 16:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779235026; x=1779839826; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KwVNzBda9+o6BwkcgCejimTHlfEURUsk3PVURqJTo84=;
        b=arHfcmqauthHZ/yC+txYOsFC0tc21eUjZyKVUBR/JPFCSW1YyPF8mGcGsCCFPx8bDx
         LIQUO3IGRudZBFOsWCCwR7WEvsHOziN4JWFNF5GinYZDflecAfXeOcF5S24Zh+xOM3it
         qQYZ0EZw/K+ckZRGKRfkeRDD5vqdN6qGaQAbALxjQfJo+oCQRJ4yIY3tyUSMDthd4oLD
         czxzETLlR2ljSGrG74Sqki3c45TLdzP97TqEJiyrCA5Hb3/u2guxFZg06e82yUo1lYdC
         M7crctZZMkzxJCLO0FlD/iL7wkE6IWhtwjknn/KH+J6vAuithsfFQ8j+7GnM7HjH6Qrk
         ESgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779235026; x=1779839826;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwVNzBda9+o6BwkcgCejimTHlfEURUsk3PVURqJTo84=;
        b=M0r7R4LttklL+dM4bMmNCh7Wd5Ykz/Pn5fAp4AKpebnGoFrAn2hx17gp4lJ8MNRclU
         inTpkjhzif50h51/jd/SgFatG/P92AmK+ClR/S/FZOi8aYZFaG0UZ1Q0/qXwV35tbpyl
         fxaXEY5/ILL2NsD347GWldZqYtgEUCW9b/EDsQH64Lm++AWLNwnpNri7qHQvQtJWzZ29
         uOTy/5SNj/ycNavtBXyOUhtmlwXp2GtOZxccOlLIZqR3pvOu7ym5pTl8n0HE/2H0nVuk
         kGuyJMx8jArrfuu5zh7UUSy+sezsgq60V/+jaQ86tGWRKbsJ2PiXl6SnsfLtpm1xmQ4d
         UFdQ==
X-Forwarded-Encrypted: i=1; AFNElJ//swZzTgCfQLP0kSWyrbldWZa7CspR1FNZmfAluT8Pp4tLT4U/B6kjug3gHiAb0XL23/dIMuTatV194Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXTkKfYs3E7W+PgAyfNQDtCIYxe5Whr5CoNNhsxcmAh6BG7ryE
	f9mY7k2Vs5A0LSu9W/gK5FE/NK08XP5TfaynBst+oMckJyB3NDB/sC/P
X-Gm-Gg: Acq92OFdmQl+r+hwhVby+znIpI9sQthGVqK+huBsTFJyXfnjJGZ1c9ijZ7lATFdx4KC
	m06hHQHB1qqf/kumsEpplCpLd7pDArtDJXsaUQRlxIngOtaGthiwVgJevus1j7uWhWrv98EejQT
	QvveWubzgZCzAcb6shkKPiUmluzvjnbvMd8+J2FqTp/0dRnFF3kgl9UHYZH1BInOL241OzUx9bX
	stEkgJnfl39W7rJE1Qn0JVjmT1pAqgikBdPSl4xS++GzGuk54eG4+hv1d+NIPX2xVcancyf1avX
	/gKQhWan42Y4pCFpMVQ028kWeopKfNngIKhn/WtRvSJcxuBAg1i9o4mktHJ3pkN6hv01NSgsuuq
	8F+NRny4lkhyxVsJgT/Efhlk6rJY36xANf/oWple1zBs7g7akQMChTsSRDNz2Yq2qYOkyqqC875
	2laONFt+gA57CAg7l4STfbzF0Lj0tCaw==
X-Received: by 2002:a05:7300:a286:b0:2f1:6252:f8fe with SMTP id 5a478bee46e88-303981914a5mr9989210eec.3.1779235026049;
        Tue, 19 May 2026 16:57:06 -0700 (PDT)
Received: from [192.168.21.192] ([67.170.89.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304052f79ecsm3305232eec.11.2026.05.19.16.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 16:57:05 -0700 (PDT)
Message-ID: <05e0e7a5-107b-410b-853b-883810b1be3e@gmail.com>
Date: Tue, 19 May 2026 16:57:04 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH 0/1] sparc64: unify thread stack sizing and add explicit
 32KB stack
Content-Language: en-US
To: David Laight <david.laight.linux@gmail.com>
Cc: davem@davemloft.net, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, andreas@gaisler.com, thuth@redhat.com,
 regressions@lists.linux.dev, glaubitz@physik.fu-berlin.de
References: <20260519075809.8993-1-unixpro1970@gmail.com>
 <20260519110223.5aeb88e3@pumpkin>
From: Tony Rodriguez <unixpro1970@gmail.com>
In-Reply-To: <20260519110223.5aeb88e3@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/19/26 3:02 AM, David Laight wrote:
> On Tue, 19 May 2026 00:57:54 -0700
> Tony Rodriguez <unixpro1970@gmail.com> wrote:
>
>> This patch fixes a reproducible stack exhaustion issue on SPARC64
>> that occurs during USB hub enumeration. This regression may have
>> started sometime after kernel v6.12. With the default 16KB kernel
>> stack, the following panic is triggered early in boot:
>>
>>      [   25.528399] Call Trace:
>>      [   25.528403] [<0000000000433cd4>] dump_stack+0x8/0x18
>>      [   25.528419] [<00000000004297ac>] vpanic+0xdc/0x318
>>      [   25.528429] [<0000000000429a0c>] panic+0x24/0x30
>>      [   25.528436] [<0000000000be2280>] __schedule+0xa8/0x7bc
>>      [   25.528445] [<0000000000be2b60>] schedule+0x24/0x4c
>>      [   25.528452] [<0000000000be6970>] schedule_timeout+0xc8/0xe4
>>      [   25.528459] [<0000000000be3318>] __wait_for_common+0x78/0xf0
>>      [   25.528466] [<0000000000be3550>] wait_for_completion_timeout+0x1c/0x2c
>>      [   25.528473] [<000000001005e2f4>] usb_start_wait_urb+0x68/0x128 [usbcore]
>>      [   25.528502] [<000000001005e468>] usb_control_msg+0xb4/0xf8 [usbcore]
>>      [   25.528518] [<0000000010051180>] set_port_feature+0x44/0x54 [usbcore]
>>      [   25.528530] [<00000000100530f0>] hub_power_on+0xc8/0xe8 [usbcore]
>>      [   25.528543] [<0000000010054fd8>] hub_activate+0x12c/0x644 [usbcore]
>>      [   25.528557] [<0000000010059438>] hub_probe+0xdd4/0xeb0 [usbcore]
>>      [   25.528570] [<0000000010062360>] usb_probe_interface+0x234/0x26c [usbcore]
>>      [   25.528585] [<0000000000a10a40>] really_probe+0x1ac/0x3b0
>>
>> This is caused by large SPARC64 trapframes, register-window spills,
>> and deep call paths in usbcore. A 16KB stack is insufficient for
>> this workload.
> Increasing the stack size for all threads seems overkill.
> That stack doesn't even look deep.
> I suspect there are large on-stack buffers in there.
>
> Unfortunately the traceback doesn't print the stack pointers making
> debugging hard.
>
> -- David

Hi David. Any specific grub command line keywords and values, and 
functions you recommend for debugging this?  I would be happy to share 
Trace Calls, etc. so it is easier to reconfirm and zero in on the issue. 
-- Tony

>> The new logic is:
>>
>>      SPARC64:
>>          THREAD_SIZE = 4 * PAGE_SIZE (32KB)
>>          THREAD_SHIFT = PAGE_SHIFT + 2
>>          THREAD_SIZE_ORDER = 2
>>
>>      Non‑SPARC64 with PAGE_SHIFT == 13:
>>          Retains the existing 16KB stack behavior
>>
>>      Fallback:
>>          Retains the existing 8KB stack behavior
>>
>> Signed-off-by: Tony Rodriguez <unixpro1970@gmail.com>
>>
>>
>> Tony Rodriguez (1):
>>    sparc64: unify thread stack sizing and add explicit 32KB stack
>>
>>   arch/sparc/include/asm/thread_info_64.h | 28 ++++++++++++-------------
>>   1 file changed, 14 insertions(+), 14 deletions(-)
>>
>> --
>> 2.53.0
>>
>>
