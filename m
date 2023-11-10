Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025431BDCA
	for <regressions@lists.linux.dev>; Fri, 10 Nov 2023 14:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="D7iVUq8d"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3593f3ef420so760365ab.1
        for <regressions@lists.linux.dev>; Fri, 10 Nov 2023 06:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699627709; x=1700232509; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F3kxH2ylyWhBh/NrVZ7VHRWeYD+t0TB6mpnJuLEU2/s=;
        b=D7iVUq8db4SB4zVtUmPULd0e+hlp/O/z2H2GuZD/cu7wxLjU5gQ7J0kzLr120gZdoZ
         BgoHQjl2isuAxJcrF+AwL0GPewvu6UBHK2wuyhCz1k0CXMkRlN+M0OcmHE/IWyFb8lZw
         8sEDkGU1Kn3dvzlazr1mi/mTkWMrOdPhtCXc1E7F21S66tzmNzz8G79HbY4OaIbCqP/v
         oyy03A0mbhDpzlsqELkUiFAgnxaVgaAJGtXRgWQANsee4tQwOBSOxZo2A8crcaVaLrxd
         sinmJMSqyNxApZTW7JCF+fX7rTCI0ZhWSGYYIhW//GfVwW4WyGgcSOUvcw9REVFtQH4x
         soNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699627709; x=1700232509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F3kxH2ylyWhBh/NrVZ7VHRWeYD+t0TB6mpnJuLEU2/s=;
        b=eyFeRXdVRKBW5clZmvMKkd1DGnWw4HiYZDP9+UcqxuGnucNriyIGHHrvAsNCA60CRv
         /beefOc9Re6Cp0DgC4qoef93kQofcijk9omWl6vkBF/hgZo1vnEyrP4+2ISgf6ZxOJ9U
         kzFNzjCf1osXIUqO12Lcb3nxqzLczSA8Th0GN/5/rvIhD3or0iZdHVVWFU6Cqw2XG7JA
         jKCv+UvidYnqRhy+FkHYzupGp+JGXgSYuxPJv/BK5A2p4N4P9W4SMJgS1QEo7QhTrLXj
         gs3pR0sAtNKeG+DLgTrE7jjLSNVZps8i2qPuxSQuRlQOjNxeEo+PR5aBvzlvfO1dvARb
         0/zw==
X-Gm-Message-State: AOJu0YyByAnX5HuX3lOELkNX8UL20csF/sW51Lhi2VdVbDtKpZPQanJ8
	c4wphA89IJcO3qJTbUN98GWCqQ==
X-Google-Smtp-Source: AGHT+IG/XNA3ASVuL9GKYGxHIDK12/Rr8kyhjfM6oul4hzG3nH/13dZXfscrgrf8HHXQfxNlY5/zNg==
X-Received: by 2002:a92:1911:0:b0:359:a92f:6d4 with SMTP id 17-20020a921911000000b00359a92f06d4mr8623398ilz.3.1699627709700;
        Fri, 10 Nov 2023 06:48:29 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id c8-20020a92c8c8000000b003506f457d70sm5175656ilq.63.2023.11.10.06.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 06:48:29 -0800 (PST)
Message-ID: <ca3ef393-6c2d-4be9-9ee8-e4416e416e5e@kernel.dk>
Date: Fri, 10 Nov 2023 07:48:28 -0700
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
 <e3e1b31f-a9a0-4387-982e-aba6d9763c6b@kernel.dk>
 <1926532589.46050149.1699551411577.JavaMail.zimbra@raptorengineeringinc.com>
 <a262a91e-f2ec-402f-ba40-adacb76c72b9@kernel.dk>
 <871420600.46050861.1699551732591.JavaMail.zimbra@raptorengineeringinc.com>
 <99f43fc0-a500-41b5-9575-33a57d0795de@kernel.dk>
 <9867b2be9c0845f9f2e3a16f91f40574.squirrel@vali.starlink.edu>
 <a29fcb47-de03-46a7-b4d1-47a6c9a28879@kernel.dk>
 <1475520442.46161385.1699590908294.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <1475520442.46161385.1699590908294.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/23 9:35 PM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Thursday, November 9, 2023 9:51:09 PM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> Just to go back to basics, can you try this one? It'll do the exact same
>> retry that io-wq is doing, just from the same task itself. If this
>> fails, then something core is wrong. I don't think it will, or we'd see
>> this on other platforms too of course. If this works, then it validates
>> that it's some oddity on ppc with punting this operation to a thread off
>> this main task.
>>
>> diff --git a/io_uring/rw.c b/io_uring/rw.c
>> index 64390d4e20c1..1d760570df04 100644
>> --- a/io_uring/rw.c
>> +++ b/io_uring/rw.c
>> @@ -968,7 +968,7 @@ int io_read_mshot(struct io_kiocb *req, unsigned int
>> issue_flags)
>> 	return IOU_OK;
>> }
>>
>> -int io_write(struct io_kiocb *req, unsigned int issue_flags)
>> +static int __io_write(struct io_kiocb *req, unsigned int issue_flags)
>> {
>> 	struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
>> 	struct io_rw_state __s, *s = &__s;
>> @@ -1092,6 +1092,19 @@ int io_write(struct io_kiocb *req, unsigned int
>> issue_flags)
>> 	return ret;
>> }
>>
>> +int io_write(struct io_kiocb *req, unsigned int issue_flags)
>> +{
>> +	int ret;
>> +
>> +	ret = __io_write(req, issue_flags);
>> +	if (ret != -EAGAIN)
>> +		return ret;
>> +
>> +	ret = __io_write(req, issue_flags & ~IO_URING_F_NONBLOCK);
>> +	WARN_ON_ONCE(ret == -EAGAIN);
>> +	return ret;
>> +}
>> +
>> void io_rw_fail(struct io_kiocb *req)
>> {
>> 	int res;
>>
> 
> That does indeed "fix" the corruption issue.
> 
> Where is the punting actually taking place?  I can see at least one
> location but if it's a general issue with the punting process I should
> probably apply any test mitigations to all locations, and I'm not
> familiar enough with the codebase to be sure I've got them all...

Usually io_write() would return -EAGAIN if it cannot perform the
operation nonblocking, in which case we'd ultimately end up in
io_req_task_submit() -> io_queue_iowq() -> io_wq_enqueue() and the
latter would insert it into the pending list for io-wq to process. I
don't think it's a general issue with punting, this happens for reads
too for example, and it seems things work fine if we just don't punt
writes. The wrong data is being written, which is why I keep suspecting
some page cache or cache aliasing issues here.

-- 
Jens Axboe

