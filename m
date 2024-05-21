Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224FE6CDD8
	for <regressions@lists.linux.dev>; Tue, 21 May 2024 18:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716315939; cv=none; b=jSeO6B+4Ktc9KK6Af+spZxqK4qfJ9x5HFt5qORVLGzHYhp/CT03rElvidUcxdx+GKVjPubBfu0CQGYZi4wnx7qZMuBYifxbRo9pZvLS1vdhCzOwAS97peBuGhSCWXLtZChj0zpSnPzgg+UL/0CAUM2S3DTw+9YdFBra2+6pmqx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716315939; c=relaxed/simple;
	bh=NhaWXpSBe1wT/Z/z09f/JJVwqA8kjtVKPOHatr3cs1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=St+hIHYTPGp+2GHn/L8ayI33d+Ybrf00dNnQEXbx8Gwl9snSVDlQ7bkWdD/JcTM8e5FH6dk7XWQqYf6Q9ClxUJBJhhbBcsEs93VRqi3Ye13C+U+1HuPLDkZY605ebt+syy/S4Pwu5wzYRDNcRs65AXQ4J33RXWPUW+jXKXgU6Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=xTLD+xgG; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="xTLD+xgG"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7e1b8606bfdso19086239f.3
        for <regressions@lists.linux.dev>; Tue, 21 May 2024 11:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1716315935; x=1716920735; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S2wBSrU4Av1sT0fUiHB+Pz7Z7sfe/pMBb5+lPgVV2vI=;
        b=xTLD+xgG49O4HAOyqRJg3XV0AZJXZbLDeOQel/9618qgh5Yay710DhRLMAqefKzUTA
         8iNvkSYrDClf4WoyyBHkGPxXVRstAh0EtQG0yaNVyB6Y2S5OYq2AmPBFpqyCCn3VRVx8
         Sr40uJVRw46CTmCdTbT73QHWYbGjDmi25GXW6upVaR8Utqbd7LYUlb65v9tDpvwcJNNi
         bsnk8tYKKXRtFDp9YCU3HkmCggZKsrkw8oFK18Ypf0x4NS5vt2HVdp9glikC2NDH4mKg
         /qNfVCHORgmD9heLr2/+9KlScSUZbb/pNLjq0iQzK7MFQqXzSpeYXyF6ZSbwL2yc3imz
         kbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315935; x=1716920735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S2wBSrU4Av1sT0fUiHB+Pz7Z7sfe/pMBb5+lPgVV2vI=;
        b=F3Gc3qBOXA85mVD0VN8qro1BnEJA0sJEDZlD+b1pOT3vmKey79kwgwLQ0XfngUMPb8
         t5SjDXdEw/vtdMjZitmNEQTfYa4XUSdZlsrIGi3QdaGGcWKgWnRx+UQ4JOtWEjCb6VC9
         d2GruLIJlGHDjABroOsVj/x/xjMWOfqT8tsIO2zDVACMPl+u6MykIG8lnWzYTQAFjxCa
         rtEyuq5efoWIIfncL5Q/oXcla4iNQQ4Zt0K+hwUDOk/GFLLcwTb+npkN0Km7GUr5nQYz
         ktNBaevSEUfFfeZ6S4Zx0ZjpWmVw4ZS+Dyx67M1cSyvYXgJ/awggyGJckx/rZIFE31+v
         sfsA==
X-Forwarded-Encrypted: i=1; AJvYcCUrp76m7FLfyVac+EcguDwqGzzDYfe3Hmn5yUkCjQqLQeVz7Z5bydqi8YKWMj+y4n5Wm9YoJ5i4oPldOdtAMl8xLy31Zj0pJAtpJ64=
X-Gm-Message-State: AOJu0YzMk7tbev/lnu1U5Oxi3SM+lLUkTA63gZfUxQ35sBvbOg4QlQhw
	RAjGTS0g9fqaPksqC556uknulDt1dyIXPw2EpqOTUwYx+j8bfapUWo2VYp2nI+M=
X-Google-Smtp-Source: AGHT+IFu19Ey9ORpInGJl6USoH3L909JnIOR/a6yUx0irocjkzqcTQjjhcMD41e/+JjVV36oQK/Ttg==
X-Received: by 2002:a05:6602:256e:b0:7e1:8829:51f6 with SMTP id ca18e2360f4ac-7e1b51fc52fmr3129914139f.1.1716315935183;
        Tue, 21 May 2024 11:25:35 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-7e1f42c22eesm444720339f.0.2024.05.21.11.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 11:25:33 -0700 (PDT)
Message-ID: <b8018270-6e9a-4888-87fd-69620d62c4e5@kernel.dk>
Date: Tue, 21 May 2024 12:25:32 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ETXTBSY when running Yarn (Node) since af5d68f
To: Christian Heusel <christian@heusel.eu>
Cc: Andrew Udvare <audvare@gmail.com>, regressions@lists.linux.dev,
 io-uring <io-uring@vger.kernel.org>
References: <313824bc-799d-414f-96b7-e6de57c7e21d@gmail.com>
 <8979ae0b-c443-4b45-8210-6394471dddd1@kernel.dk>
 <8de221f7-fe5a-4da9-899e-de2a856a4ddc@kernel.dk>
 <yywbp7fjnwgqxvc66zimea4hgdc2eysjx5nezky3vndr7xw25l@jv76rdseqm3e>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <yywbp7fjnwgqxvc66zimea4hgdc2eysjx5nezky3vndr7xw25l@jv76rdseqm3e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/21/24 12:17 PM, Christian Heusel wrote:
> On 24/05/21 10:22AM, Jens Axboe wrote:
>>> On 5/21/24 10:02 AM, Andrew Udvare wrote:
>>>> #regzbot introduced: v6.8..v6.9-rc1
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=af5d68f8892f8ee8f137648b79ceb2abc153a19b
>>>>
>>>> Since the above commit present in 6.9+, Node running a Yarn installation that executes a subprocess always shows the following:
>>>>
>>>> This also appears to affect node-gyp: https://github.com/nodejs/node/issues/53051
>>>>
>>>> See also: https://bugs.gentoo.org/931942
>>>
>>> This looks like a timing alteration due to task_work being done
>>> differently, from a quick look and guess. For some reason SQPOLL is
>>> being used. I tried running it here, but it doesn't reproduce for me.
>>> Tried both current -git and 6.9 as released. I'll try on x86 as well to
>>> see if I can hit it.
>>
> 
> It seems like this also was a problem for libuv previously as somone
> noted in a comment on the Arch Linux Bugtracker[0]:
> 
> - https://github.com/libuv/libuv/commit/1752791c9ea89dbf54e2a20a9d9f899119a2d179
> - https://github.com/libuv/libuv/blob/v1.48.0/src/unix/linux.c#L834

Just got that far in my local poking, it is indeed execve() getting
ETXTBUSY. I'll see if I can make a test case for this. Presumably the
application side is fine, eg it waits on the close completion before
doing the execve, not just having it be issued. Outside of that, only
other thing I can think of is that the final close would be punted to
task_work by fput(), which means there's also a dependency on the task
having run its kernel task_work before it's fully closed.

I'll be back with more info...

-- 
Jens Axboe

