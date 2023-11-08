Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803BF374DD
	for <regressions@lists.linux.dev>; Wed,  8 Nov 2023 22:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="d2nC8BsA"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1cc703d2633so290285ad.0
        for <regressions@lists.linux.dev>; Wed, 08 Nov 2023 14:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699481902; x=1700086702; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sVhtH4gvy605jzg1De89LDd4N0x6Ew4sz6wOc4lHvmc=;
        b=d2nC8BsAqGXexVCJqQPqrEAOdzSTqQOJVNGHiDhETikllj1V3Juu27wIn3XRVb1A/3
         bl0Gnwk/oMClfozsUKwHFugaUVa+A3sU2vgFgEdz9NEMz3TpqjerW1Q3kl4HCk6jD9Ec
         B2uFYzrcdLlr2+sSL4A+XUcmA4Ql7HrgUPT8vzkCBFsB6RY+uACakpKgyUyuM+cdKQi6
         c1x0+khHVoks8+WPQdp8nfxRO4fEIfRZD63+gUBw5vpIamzRjz917/pEQjVb2YOXDYnK
         w3T0LCyuIUkZ+0YFHFNEwRDPlHMchO7PIQjC+qwoIHiB+Ks+k6+8DCCU05OZeq3er2WT
         /Duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699481902; x=1700086702;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVhtH4gvy605jzg1De89LDd4N0x6Ew4sz6wOc4lHvmc=;
        b=sRhGYqCQn5Mhs1chxYJdZ18GTy+qgLli+bA7Q/OtGJfMgFyBqzsdLILMktTYYaBI2p
         TL7M+s5BMKo2BZINZ2Hdth5419pIrsZIHIf3L6vq2iBNmVhrP/W3ZgfA6z4/vKk35+QV
         6kGBg8A+ZTmIMT8/K4iGYFJbIUk5/v20G3rKcz58S5rBsJwewkFS3paG/xBao0PGvnXZ
         r77/xaXcLpT6FNGEyd4jynFy14tpj3aXdJcTrci9SU6AYiGkt5CzCvNLYwWw4lfE41K0
         n9ixfa+WRV7mhZRZAwqGCTcJouigRuXgfjl0EBr/wtPv43mgKoKc0OgorApvp4fGCk0u
         Twwg==
X-Gm-Message-State: AOJu0YwyKspesNprdRefn1DK+SZH8tZd5OFOlVtw0m1GHV6XtzxmVrJG
	xg1aJif/fdXbypRZlxoMsz6+dw==
X-Google-Smtp-Source: AGHT+IHk85yjv64lll4+A8CEeH/O3Tkc8c7LMZK9j8c1RVKK13vl9WuUzFNJd2bQo5bhKqP397RSRQ==
X-Received: by 2002:a17:903:2349:b0:1cc:3c2c:fa1a with SMTP id c9-20020a170903234900b001cc3c2cfa1amr3582789plh.4.1699481902615;
        Wed, 08 Nov 2023 14:18:22 -0800 (PST)
Received: from ?IPV6:2600:380:4a53:a4d4:ca17:af52:1427:836a? ([2600:380:4a53:a4d4:ca17:af52:1427:836a])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902860400b001b9e86e05b7sm2207672plo.0.2023.11.08.14.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 14:18:22 -0800 (PST)
Message-ID: <b40fd4c2-ea0e-4260-87f6-a3d43dd06c9d@kernel.dk>
Date: Wed, 8 Nov 2023 15:18:20 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in io_uring, leading to data corruption
Content-Language: en-US
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: regressions <regressions@lists.linux.dev>,
 Pavel Begunkov <asml.silence@gmail.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
 <716eb4a2-94c4-4da9-b1ed-b94858e3ee08@kernel.dk>
 <1449911021.45817655.1699465215683.JavaMail.zimbra@raptorengineeringinc.com>
 <74d15590-3af6-40ed-8d3b-5bf8cd3881a5@kernel.dk>
 <217080ad-adb4-4cbd-ae91-1287bb6a5400@kernel.dk>
 <410961969.45826785.1699468561883.JavaMail.zimbra@raptorengineeringinc.com>
 <2225dc79-37ec-4239-b13a-ac444bfa6a6b@kernel.dk>
 <3f2dcaba-d18e-4d1d-9b96-2a168f550881@kernel.dk>
 <262637196.45862863.1699481726721.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <262637196.45862863.1699481726721.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/8/23 3:15 PM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Wednesday, November 8, 2023 4:05:50 PM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/8/23 12:06 PM, Jens Axboe wrote:
>>>> I have been giving some thought to the CPU pinning of the workers, and
>>>> one thing that may have been overlooked is that this could potentially
>>>> force-serialize worker operations.  Did you just have to pin the io
>>>> workers or did the workqueue also need to be pinned for the corruption
>>>> to disappear?
>>>
>>> Not sure I follow, the workers ARE the workqueue. For the pinning, I
>>> just made sure that the workers are on the same CPU. I honestly don't
>>> remember all the details there outside of what I can read back from the
>>> emails I sent, it's been a while. My suspicion back then was that it was
>>> some weird ppc cache aliasing effect with the copy into kernel memory
>>> happening on cpu X, and then we immediately punt it to cpu Y for
>>> processing.
>>
>> You could try something like this, though I still need to verify that we
>> never end up running it on the wrong CPU. But may be worth a shot, for
>> debug purposes.
> 
> Getting a bunch of:
> 
> [   25.268005] work cpu 5, me 23
> [   25.269217] work cpu 5, me 23
> [   25.269804] work cpu 5, me 23

[snip]

> [  153.029120] work cpu 32, me 10
> 
> They happen both for corrupt and non-corrupt runs.

OK, let me actually test this thing and see if I can make it solid
first...

-- 
Jens Axboe

