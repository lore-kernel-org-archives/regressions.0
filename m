Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6A21BDE2
	for <regressions@lists.linux.dev>; Thu,  2 Nov 2023 15:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="kioVNI89"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7a680e6a921so8422639f.1
        for <regressions@lists.linux.dev>; Thu, 02 Nov 2023 08:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1698937533; x=1699542333; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D2a5tTRmonri7Z9XihJIqNdxldq3XxfA80Y9RfLaY0Y=;
        b=kioVNI89me6Lv+hAAdTF3gvN5rkLVPmvI6jAFqxYF8sjpeuBYtKjDsPnqIqBTiXDT7
         bQMQJTA5WOMjktuflmh1OUfJp8r0gdka9u7csd/6tM9FBLu+O9y2qzXNfjhFPvsi6xEd
         KBFuG4O2lMvxap7P/i0tRvfzJK9D+QOD5n9cvg3LCsLfJbGKpXyRplV+ViPbbRlCq9Ze
         eRxXAXeQLNhGi0wFi0fl3C3NU7bDe7rAIETVYHdM5QD7NPnduHF7nh9VWAbghe4NUERZ
         SjNINIzt7OV8BEitTWOACnU5iW76tc6N7Ze7M8blrly2Mqo6HJ00jnHIVax1+esiQn/T
         8zyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698937533; x=1699542333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D2a5tTRmonri7Z9XihJIqNdxldq3XxfA80Y9RfLaY0Y=;
        b=rsW5pqhHMxtCltDwXmAv+zSspkMjIbeWNuiHj2NPXZMs489tGkRFjdeJ39qth0Yyi5
         ce2bapbiUB3Xnixa6j4RGyGe5qp1K0bUngX1nDCSJyKkZ1l7QCl57DUQ63jFcm6FcoQm
         sGUNTWF9ozrVJa2faf0FEQwI1Iz47O1xULt1pNkY4zegbvy0MKsvfYWNYspfV+maxD/t
         jnN3LPFJCG0gaKVmsV/IKqOZAnfakO/S69DemwM/+5nP1ftLxzHry75UtKyiLmF+EWA6
         MW8Ofj9iDyQSJ15/YcQwTeeeCWPmB+/qcgY1A2MTeSBY+teezvW8bV0YNryAA4/XolPv
         RVbA==
X-Gm-Message-State: AOJu0YyBXcjinx8F5l901YFK7opm0WAlfES5WG43tmfumNrclZKHppU+
	lC6+PdhsTo4aiIEJTwnTIXBCiQ==
X-Google-Smtp-Source: AGHT+IFpac6P14IraImrsB4coQTupU8u1r6P3a/TAw+A0We6PTiUJQaemSGMZnM+cleKltMqggKQxA==
X-Received: by 2002:a5d:924a:0:b0:7a9:7aa9:c175 with SMTP id e10-20020a5d924a000000b007a97aa9c175mr20960142iol.1.1698937532884;
        Thu, 02 Nov 2023 08:05:32 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id u1-20020a02aa81000000b0045bb982a3d2sm1615423jai.60.2023.11.02.08.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 08:05:32 -0700 (PDT)
Message-ID: <7cd11ce1-01cc-4e5a-aa6e-b55e1584c221@kernel.dk>
Date: Thu, 2 Nov 2023 09:05:30 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Backport? RIP: 0010:throtl_trim_slice+0xc6/0x320
 caused kernel panic
Content-Language: en-US
To: Christian Theune <ct@flyingcircus.io>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 stable@vger.kernel.org
Cc: linux-block@vger.kernel.org, yukuai3@huawei.com, ming.lei@redhat.com
References: <F5E0BC95-9883-4E8E-83A6-CD9962B7E90C@flyingcircus.io>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <F5E0BC95-9883-4E8E-83A6-CD9962B7E90C@flyingcircus.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/2/23 8:53 AM, Christian Theune wrote:
> Hi,
> 
> I hope i’m not jumping the gun, but I guess I’d be interested in a backport to said issue … ;)
> 
> We’re running on 6.1.55/57 and this has started breaking for us after we updated from 6.1.51.
> 
> The issue seems to be well-described and already fixed in
> https://lkml.kernel.org/linux-block/e1d7c106-ea6f-922f-971f-691e7e0faf9d@huaweicloud.com/T/
> but I can’t post to that thread easily and it seems backporting isn’t on the radar as of now.

The fix is already in 6.1.61:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.1.y&id=6a5b845b57b122534d051129bc4fc85eac7f4a68

-- 
Jens Axboe


