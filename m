Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9E41DDDA
	for <regressions@lists.linux.dev>; Thu,  9 Nov 2023 17:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="QiHNWDz4"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7aff68e5caeso7007939f.1
        for <regressions@lists.linux.dev>; Thu, 09 Nov 2023 09:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699551032; x=1700155832; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ye1wZy9JSeXeomnn02J2/HVlePYoNuLq7wsAcXljUU=;
        b=QiHNWDz4rkzgc0kodXLoEO3BDLNjCD7DoDG72pqaFlRjQZnKd93Fz2Q6Vrn6OpcPAR
         SZ3BVnRbUBYoCd2OIaoRJ1YJugxUGaONn+Q1eeBUnhItFfhukOh/kYLAr+xi0dK+Kr6e
         W1ifSZfMQSSKd5aUB8fx/WzlO0JYwtFvapqM1J16FWNnA3Axlop9j3qfzcqeXXQe8Iwg
         iLbVOFqI/tYBKYYc+zJPcrQzCXwVsZwWFVd2/VUSy3+3w/H1ud9wXFtKwr1+GV6n5RHR
         r1RK5RK8pu6l1oO8qWMWh7f/PdSFpheeUG/9atbZBBEkGWSKHCJRYLvNHy2hwWOS28cG
         B7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699551032; x=1700155832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ye1wZy9JSeXeomnn02J2/HVlePYoNuLq7wsAcXljUU=;
        b=ZDIolfzHCwYtfA0r4VC27s1VDo//eZUQctpCDeNkTnZa/wzpIDYHi0OUdaXI2i7Hnn
         ZI2cUGCROk3/VIn5/8zhaD4Nh5TgrugileSKTgbXT0Chp33eAvMUiTxA/pAvXpP3KOjr
         jtx5gIKCg3lP6EDPBjrgoJZ2EFW153ToxLe8cxdOZN0KO0f+14FD5Mt+nXGgDiDK84Im
         VTyRJcUrefXkE2zZhqYYs5Mr8cN3+ws41tUpWvdMhfb6eD8WSQ1ec1lJedNPH+zolRsp
         xC4vafBzUtKvunqPAS/H6zsimnEe1551crsenA63MIhDf0kjrRKxXdLPHJyTz5ThEJWp
         B/sA==
X-Gm-Message-State: AOJu0Yy0CDK9Kv/DI/6OAV2jRrNpLcZ6CXRWky7smn/7fNyJMhtOwbGR
	ivmZKfZR+lPtfywfzlG3HtkVLePtHFFk6dwVut8k+A==
X-Google-Smtp-Source: AGHT+IG/WjYzagaYfFZ55JDkWGmSFdy2ihmwMG6oiWittrzof7gFVITFOwRfU4mPyDKKjFH8tla7YQ==
X-Received: by 2002:a5d:9306:0:b0:7ad:5c6f:18db with SMTP id l6-20020a5d9306000000b007ad5c6f18dbmr5759363ion.0.1699551032693;
        Thu, 09 Nov 2023 09:30:32 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id p26-20020a02b89a000000b0045bb982a3d2sm4049819jam.60.2023.11.09.09.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 09:30:31 -0800 (PST)
Message-ID: <e3e1b31f-a9a0-4387-982e-aba6d9763c6b@kernel.dk>
Date: Thu, 9 Nov 2023 10:30:31 -0700
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
 <3f2dcaba-d18e-4d1d-9b96-2a168f550881@kernel.dk>
 <262637196.45862863.1699481726721.JavaMail.zimbra@raptorengineeringinc.com>
 <b40fd4c2-ea0e-4260-87f6-a3d43dd06c9d@kernel.dk>
 <0672220d-1b3a-46b3-811d-0a691e380097@kernel.dk>
 <9860f9b2-1d98-497c-9480-56852fda781b@kernel.dk>
 <1557819821.46044536.1699549241816.JavaMail.zimbra@raptorengineeringinc.com>
 <f4fffe29-7c95-4d22-918b-f2835fb76366@kernel.dk>
 <597693097.46047776.1699550641104.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <597693097.46047776.1699550641104.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/23 10:24 AM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Thursday, November 9, 2023 11:17:03 AM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/9/23 10:00 AM, Timothy Pearson wrote:
>>>
>>>
>>> ----- Original Message -----
>>>> From: "Jens Axboe" <axboe@kernel.dk>
>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>>>> <asml.silence@gmail.com>
>>>> Sent: Thursday, November 9, 2023 9:12:07 AM
>>>> Subject: Re: Regression in io_uring, leading to data corruption
>>>
>>>> On 11/8/23 4:58 PM, Jens Axboe wrote:
>>>>> On 11/8/23 3:18 PM, Jens Axboe wrote:
>>>>>> OK, let me actually test this thing and see if I can make it solid
>>>>>> first...
>>>>>
>>>>> Here's a suitable hack - it just creates a new io worker for each item,
>>>>> ensuring that that worker is run on the same CPU.
>>>>
>>>> Turns out I didn't send you the current one, this one was older and
>>>> untested. Please try this one instead.
>>>
>>> I'm still seeing an oops with this newer patchset applied:
>>> [   76.419788] Kernel attempted to read user page (9c) - exploit attempt? (uid:
>>> 0)
>>> [   76.419853] BUG: Kernel NULL pointer dereference on read at 0x0000009c
>>> [   76.419887] Faulting instruction address: 0xc0000000008374d4
>>> [   76.419919] Oops: Kernel access of bad area, sig: 11 [#1]
>>> <snip>
>>> [   76.429125] Call Trace:
>>> [   76.429142] [c000000009a8f800] [c000000000ea4e7c] schedule+0xfc/0x150
>>> (unreliable)
>>> [   76.429190] [c000000009a8f870] [c000000000ead8f0]
>>> schedule_timeout+0x170/0x1e0
>>> [   76.429238] [c000000009a8f940] [c000000000ea3fc8]
>>> io_schedule_timeout+0x68/0xa0
>>> [   76.429285] [c000000009a8f970] [c0000000007adcbc] blk_io_schedule+0x3c/0x70
>>> [   76.429326] [c000000009a8f990] [c00000000065da84] __iomap_dio_rw+0x8d4/0x9f0
>>> [   76.429374] [c000000009a8fb70] [c00000000065dea0] iomap_dio_rw+0x20/0x80
>>> [   76.429415] [c000000009a8fb90] [c008000000514eac]
>>> ext4_file_write_iter+0x814/0xdb8 [ext4]
>>> [   76.429475] [c000000009a8fc60] [c000000000833aa0] io_write+0x280/0x540
>>> [   76.429514] [c000000009a8fd80] [c0000000008183bc] io_issue_sqe+0xdc/0x390
>>> [   76.429554] [c000000009a8fdd0] [c000000000818ab4]
>>> io_wq_submit_work+0x1c4/0x2c0
>>> [   76.429601] [c000000009a8fe20] [c000000000835578]
>>> io_wq_single_worker+0x88/0xb0
>>> [   76.429652] [c000000009a8fe50] [c00000000000df3c]
>>> ret_from_kernel_user_thread+0x14/0x1c
>>>
>>> If you're not seeing an oops, that's an interesting difference that I
>>> can investigate further.
>>
>> Are you sure that's with the latest patch? Because that looks like
>> something that'd happen with the buggy one I sent out, as the sleep/wake
>> handling doesn't properly handle the specialized workers.
>>
>> --
>> Jens Axboe
> 
> You're right, the new patch wasn't applied, somehow it didn't copy
> over from my clipboard.  Apologies for the noise.
> 
> That said, the new patch is still showing the data corruption.  Maybe
> the pinning was just introducing the same timing alterations that my
> udelay() does on specific kernel builds?

Hmm ok, that is odd. How quickly does it trigger for you?

-- 
Jens Axboe

