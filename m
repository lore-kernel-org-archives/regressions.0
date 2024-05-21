Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2176E148FF9
	for <regressions@lists.linux.dev>; Tue, 21 May 2024 19:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716319968; cv=none; b=b6WP6sZody4wk7AhUhOBDetQigKjBp69sdx73p/r4wmh5BlWy1Y97spBIScUGxdN9WIesULbYeAoMfmuOZzmu/ucuFCiPqysqeBoRjjvB8iwef+ODk1VDNOlSNpz7dBDPL7I/FpLXag5b5oeVLR8oWLowhLsOYQXJIg2OuG3Axg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716319968; c=relaxed/simple;
	bh=D/VHu7kx71sDpMTRhMP9yDWsN/tWB8PlzoH6I+ET40A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MXx8ywHAAxpsy8HEeqxVjfduknB0iUSWUikp3duUoAv/Hsr16jiVOKwIikM8Ub6wNyOQ/pxU6W8w8MFnDWscu1c1EGv1rfb6DmHOaYG13j4+uBhGW5ryE+w+WtPTvMjXErGuvkMnqsJKXA81TMhQaZVgzp8Q0F6PmEBli15mFk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=wIUCu4Le; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="wIUCu4Le"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-36dd6cbad62so2600335ab.3
        for <regressions@lists.linux.dev>; Tue, 21 May 2024 12:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1716319964; x=1716924764; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=evgLX76dSsYFNFDmlUKN2rF7iLSPrgjgS6ECYRNIJr4=;
        b=wIUCu4Le/FZu490XF8GYlZrCEo3aSyoGsEnyAA2w70U9Jlsw9RyjX7du7wi6dd03xP
         5R1aRAwZ2Y2QaS9/t4+mrzSJJ3mM493fZbDp7a9Co7N7cQ+hRUBvHuLpDowC9SpkqOLL
         vWichmwCurNAONKFOEHqyZuzrG8dnDq60owO0ZcEbBWIEEaySpby5oqr4wOz+GLO4XzI
         H+4MPe19u8oDQknFE58qmz7Nk6Brpjf2PKs5OB2oeNxcqcqL9nyOZzIOvQuvwEOrpMAs
         cXa2hoeCAINfp4vKUsxVmza8FSeq2Ms16HWgtkODpQyRABqn48wHmf0X4+x2oBFVGBoQ
         9/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716319964; x=1716924764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=evgLX76dSsYFNFDmlUKN2rF7iLSPrgjgS6ECYRNIJr4=;
        b=IOmx7fDgubTXwRICv/0veJNRIJvZvBq1ZfVGFvAjRv4ITyQltwkJ44IpIHVMebcP4U
         9oykdESYT5IbItgGeJuskPJwVzQVTt0gtQZedhjIflD4j2cloARTffd0O2Df7llvL/dD
         Xk9KYw9pmOZ9qSrH8KWtX1WkU6t86vA3Uz2t0EDQhP29XvIyqqapjBAyg2GUzlXg1N+/
         by2s+evXFdW4b9T8M7do+PiBC+x6z1/HTEY7Qk5UpkCPP0Ip4TkEI3NObTZVqz8V8fax
         RBN+bmsGeYM19CowHZvi/ETnYf/fDdewfwyCfKW0wLXRUS3k+sUqZqD7f1DqCAkTKR+K
         qIHw==
X-Gm-Message-State: AOJu0YwIlh9Zc1xyOr5GBKzDMupCBiFqyXf1XaJYCDC+K+GJZTmZrNhD
	d2h78JhS58agXjjSHCfdZaV846BRzYVDIBpASUptIXr6WetO38cGJMPSeQUV2fw=
X-Google-Smtp-Source: AGHT+IHuArI40gSH5aKyn8S6mXad9veMsLHXc/jnFYqt01HuYx4sfgEeeo3XLnBT5qXlouZYT3OZYA==
X-Received: by 2002:a5d:84ca:0:b0:7de:f48e:36c3 with SMTP id ca18e2360f4ac-7e360c17344mr248039f.0.1716319964176;
        Tue, 21 May 2024 12:32:44 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-7e1e412dcd1sm494088039f.18.2024.05.21.12.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 12:32:43 -0700 (PDT)
Message-ID: <2b810757-4aeb-43c6-b92c-d8ffb7c34c64@kernel.dk>
Date: Tue, 21 May 2024 13:32:41 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ETXTBSY when running Yarn (Node) since af5d68f
To: Andrew Udvare <audvare@gmail.com>, Christian Heusel <christian@heusel.eu>
Cc: regressions@lists.linux.dev, io-uring <io-uring@vger.kernel.org>
References: <313824bc-799d-414f-96b7-e6de57c7e21d@gmail.com>
 <8979ae0b-c443-4b45-8210-6394471dddd1@kernel.dk>
 <8de221f7-fe5a-4da9-899e-de2a856a4ddc@kernel.dk>
 <yywbp7fjnwgqxvc66zimea4hgdc2eysjx5nezky3vndr7xw25l@jv76rdseqm3e>
 <b8018270-6e9a-4888-87fd-69620d62c4e5@kernel.dk>
 <0ec1d936-ee3f-4df2-84df-51c15830091b@kernel.dk>
 <5a1649cb-2711-4767-8313-0f6bfe0e4cd7@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <5a1649cb-2711-4767-8313-0f6bfe0e4cd7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/21/24 1:30 PM, Andrew Udvare wrote:
> On 21/05/2024 14:29, Jens Axboe wrote:
>> On 5/21/24 12:25 PM, Jens Axboe wrote:
>>> Outside of that, only other thing I can think of is that the final
>>> close would be punted to task_work by fput(), which means there's also
>>> a dependency on the task having run its kernel task_work before it's
>>> fully closed.
>>
>> Yep I think that's it, the below should fix it.
>>
>>
>> diff --git a/io_uring/sqpoll.c b/io_uring/sqpoll.c
>> index 554c7212aa46..68a3e3290411 100644
>> --- a/io_uring/sqpoll.c
>> +++ b/io_uring/sqpoll.c
>> @@ -241,6 +241,8 @@ static unsigned int io_sq_tw(struct llist_node **retry_list, int max_entries)
>>               return count;
>>           max_entries -= count;
>>       }
>> +    if (task_work_pending(current))
>> +        task_work_run();
>>         *retry_list = tctx_task_work_run(tctx, max_entries, &count);
>>       return count;
>>
> 
> This patch works for me on 6.9.1.
> 
>  $ yarn
> yarn install v1.22.22
> warning package.json: "test" is also the name of a node core module
> info No lockfile found.
> warning test@1.0.0: "test" is also the name of a node core module
> [1/4] Resolving packages...
> [2/4] Fetching packages...
> [3/4] Linking dependencies...
> [4/4] Building fresh packages...
> success Saved lockfile.
> Done in 3.32s.
> 
>  $ uname -a
> Linux limelight 6.9.1-gentoo-limelight #2 SMP PREEMPT_DYNAMIC TKG Tue May 21 15:21:33 EDT 2024

Great, thank you for testing!

-- 
Jens Axboe

