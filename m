Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32FBC8FC
	for <regressions@lists.linux.dev>; Mon, 15 May 2023 15:52:14 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-76c6e795650so33009039f.1
        for <regressions@lists.linux.dev>; Mon, 15 May 2023 08:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1684165933; x=1686757933;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hm+bqbzJwc1Xl9qj26W/HzaWbXKYcWn1gV7Sqsapjuk=;
        b=dPfzHFraE/umRN0sczlZ+1ZrJIK1F6iOIk0i33ZHUvL6COessIxmfsZ6hm8vbdLaP7
         i6w6AXlHCa4WhTE0jdKRniI/DiaqhUf0iSRhWDqUdqjYkgf7f44V2WUrYWLqfOWESDj7
         ZP48z+vkRfe72GFGeB88iu3dnZU1ptrTAfXnRU6Af6j1bf/vBrlky5ZdrJp1sfwfr84K
         vul0e/ni8s4dGIkNpSpt5aCnyh0Ka1z/q7Nfv6qQlMG46Uv8DyQU4sQTd8v0du8GdJV5
         ud59i6J6rLEl5Pgbv0mL6ZE4f99ZwkVrgKlecGOWklUWQuesDvKds+S4hjdB5aLQ1K2V
         Gpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684165933; x=1686757933;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hm+bqbzJwc1Xl9qj26W/HzaWbXKYcWn1gV7Sqsapjuk=;
        b=bHierXsBk4vDhJodOAoi/Hi6rynGNQUkrKPxWcZ/gfMOZ1D/7IEh4Gi+UUVh4BgoCI
         08OI3EyWBXkNPL/iAn0RgorojN80fy1IxTeU0Py+Syqtvah99t/3m34UNAdwL3/bEdW9
         40w0i/Ozy3dBN/rnxfySph5jjQxyOxdnOSuThmq4dFc+cE6EihhGlxufqH5bW6rXSI9P
         wPoACCyW4AS/+7mfqQ7rITh3YGeW/f/L3Ec2ryEFgXJIgOK2pE6Fot0dCl18ueU4bP3r
         ihmVA5N7nEUOlsQws7EjM+PoJASfl7OwBBNG/E/8QwSmmXK/J8dpIrBduutTJd6TO91W
         K0kg==
X-Gm-Message-State: AC+VfDwZ1xE0SKDzwG+PmI6mzr15pE6jSNhZ2MPNUe0x/IcPT4MFtGVR
	w0fEXGmlP8G1KH7eLqO/5UYp4A==
X-Google-Smtp-Source: ACHHUZ67ppZkczvltB/Ej7MOunMBKq/HKJDp3WTg061+vQEirR5F91+5ZfFi+zLqKRaMSbTbdEj7Sw==
X-Received: by 2002:a92:a010:0:b0:32f:1232:f5d5 with SMTP id e16-20020a92a010000000b0032f1232f5d5mr91880ili.2.1684165933638;
        Mon, 15 May 2023 08:52:13 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id b71-20020a02194a000000b00411bf6b457bsm7365767jab.101.2023.05.15.08.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 08:52:12 -0700 (PDT)
Message-ID: <33b84605-1d0c-1b0e-7927-7ffa96b3c308@kernel.dk>
Date: Mon, 15 May 2023 09:52:11 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 8/8] vhost: use vhost_tasks for worker threads
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christian Brauner <brauner@kernel.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
 Mike Christie <michael.christie@oracle.com>, nicolas.dichtel@6wind.com,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 hch@infradead.org, stefanha@redhat.com, jasowang@redhat.com, mst@redhat.com,
 sgarzare@redhat.com, virtualization@lists.linux-foundation.org,
 ebiederm@xmission.com, konrad.wilk@oracle.com, linux-kernel@vger.kernel.org
References: <20230202232517.8695-1-michael.christie@oracle.com>
 <20230202232517.8695-9-michael.christie@oracle.com>
 <aba6cca4-e66c-768f-375c-b38c8ba5e8a8@6wind.com>
 <CAHk-=wgadfsCnKHLON7op=Qs5t3w3PVz5ZDbvbKsfb=yBg=yjQ@mail.gmail.com>
 <78c5e150-26cf-7724-74ee-4a0b16b944b1@oracle.com>
 <48842e92-835e-bc3f-7118-48b8f415f532@leemhuis.info>
 <CAHk-=wicXCNR1bBioaAiBqEDgv-CoQD9z2RsM2VOTPzkK0xr8g@mail.gmail.com>
 <20230515-vollrausch-liebgeworden-2765f3ca3540@brauner>
 <CAHk-=wgXJ5VS1iBkfsG=HDjsyhn5XYDKt5xhQcNuz-e7VKyg8A@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAHk-=wgXJ5VS1iBkfsG=HDjsyhn5XYDKt5xhQcNuz-e7VKyg8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/15/23 9:44?AM, Linus Torvalds wrote:
> On Mon, May 15, 2023 at 7:23?AM Christian Brauner <brauner@kernel.org> wrote:
>>
>> So I think we will be able to address (1) and (2) by making vhost tasks
>> proper threads and blocking every signal except for SIGKILL and SIGSTOP
>> and then having vhost handle get_signal() - as you mentioned - the same
>> way io uring already does. We should also remove the ingore_signals
>> thing completely imho. I don't think we ever want to do this with user
>> workers.
> 
> Right. That's what IO_URING does:
> 
>         if (args->io_thread) {
>                 /*
>                  * Mark us an IO worker, and block any signal that isn't
>                  * fatal or STOP
>                  */
>                 p->flags |= PF_IO_WORKER;
>                 siginitsetinv(&p->blocked, sigmask(SIGKILL)|sigmask(SIGSTOP));
>         }
> 
> and I really think that vhost should basically do exactly what io_uring does.
> 
> Not because io_uring fundamentally got this right - but simply because
> io_uring had almost all the same bugs (and then some), and what the
> io_uring worker threads ended up doing was to basically zoom in on
> "this works".
> 
> And it zoomed in on it largely by just going for "make it look as much
> as possible as a real user thread", because every time the kernel
> thread did something different, it just caused problems.

This is exactly what I told Christian in a private chat too - we went
through all of that, and this is what works. KISS.

> So I think the patch should just look something like the attached.
> Mike, can you test this on whatever vhost test-suite?

Seems like that didn't get attached...

> I did consider getting rid of ".ignore_signals" entirely, and instead
> just keying the "block signals" behavior off the ".user_worker" flag.
> But this approach doesn't seem wrong either, and I don't think it's
> wrong to make the create_io_thread() function say that
> ".ignore_signals = 1" thing explicitly, rather than key it off the
> ".io_thread" flag.
> 
> Jens/Christian - comments?
> 
> Slightly related to this all: I think vhost should also do
> CLONE_FILES, and get rid of the whole ".no_files" thing. Again, if
> vhost doesn't use any files, it shouldn't matter, and looking
> different just to be different is wrong. But if vhost doesn't use any
> files, the current situation shouldn't be a bug either.

Only potential downside is that it does make file references more
expensive for other syscalls, since you now have a shared file table.
But probably not something to worry about here?

-- 
Jens Axboe

