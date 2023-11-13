Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0C0210FB
	for <regressions@lists.linux.dev>; Mon, 13 Nov 2023 17:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="M0ZFyVxL"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-587af6285c0so574241eaf.1
        for <regressions@lists.linux.dev>; Mon, 13 Nov 2023 09:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699897171; x=1700501971; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=80fJtFOvD6OSGtrt66p42aXxGVJAyPrM0q9Rbr8rzrw=;
        b=M0ZFyVxLeqvJYxVSr3RNREUNGoRwwhdZg3hoHRklqt4vgwFv2PhBgLp3wbRPtvI3IZ
         jbt00/Ag+LcRFu9Xk34g3hDJuLoubRlVFsuEvmpy0NP8km4fgZUVBjVsYiUMiIgj69rm
         xccVG1vR5CkiPrrWy6OK6dIC5I5zwWq4Dc1qktj0HNpmAkDGSiPF88J0dVDgpjP5ziVG
         jguedPIh960VXN4daGPw/5bJJBtdCUNldlQY5/vKk9qwAXZ7X9Wna4sKxWS8wKRouoKr
         jh7QsNU+CqHmxHk/9W0tGauYjWHsqqY9/K7ycIdhPk5cvSsSaFbYhsJ6+uqLu/l31+aA
         YCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699897171; x=1700501971;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=80fJtFOvD6OSGtrt66p42aXxGVJAyPrM0q9Rbr8rzrw=;
        b=hZFG745zJ2dY/eMjUqTR+7bLwN+hcEEKS8W74hGTzJPUmUVTqh2ti4yuBgKhc8cwYj
         Fu5dIRBn/OjxtebsuduVu3GiBL5LEVxVha5rI/nz5meWv8W4xDj9VQAHJQmJsN9HApkB
         XV0KTg9gZ75p0Dic1ximIatT3CB3Z42hIpZ/Tj3vER74j/d/jFSYOkF/Zbk8OBSRlCeU
         VzGeuoR3ofMEg4HxBbYHN3ygU7pRqfeSg2gQLIdiy/hKGh6Zghoh+nrEn80ULVmzYwrE
         VKZb36YLgBC+rgmtTOj01BvYDoIQKd3O1aYlzSRBvYMj0eKNRQwxRrIoyHDAu/ZI5wix
         4RnQ==
X-Gm-Message-State: AOJu0YzmgZfyzWt+UeaoCy5NaJVKEWW+KL2vn0tH2KjRiyLIIo62vGo4
	+D2ETXpgpe3xiNIWc3YX1nZHFQ==
X-Google-Smtp-Source: AGHT+IEmXKRwbe1X4ZgHfmvMYD1iT+gCih15B2j839VHZVy+Ir5J3QY+Ad3PbTqXL251Q/Ml/pEGfg==
X-Received: by 2002:a05:6871:86c5:b0:1f4:d544:2490 with SMTP id tb5-20020a05687186c500b001f4d5442490mr6013633oab.4.1699897171583;
        Mon, 13 Nov 2023 09:39:31 -0800 (PST)
Received: from ?IPV6:2620:10d:c0a8:11c1::125b? ([2620:10d:c091:400::5:d5c7])
        by smtp.gmail.com with ESMTPSA id bl16-20020a05620a1a9000b007757868e75csm2027021qkb.117.2023.11.13.09.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 09:39:30 -0800 (PST)
Message-ID: <74c0d436-cb83-4c55-a4fd-4e0061ac19bb@kernel.dk>
Date: Mon, 13 Nov 2023 10:39:30 -0700
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
 <9867b2be9c0845f9f2e3a16f91f40574.squirrel@vali.starlink.edu>
 <a29fcb47-de03-46a7-b4d1-47a6c9a28879@kernel.dk>
 <1475520442.46161385.1699590908294.JavaMail.zimbra@raptorengineeringinc.com>
 <776997436.46185793.1699598887190.JavaMail.zimbra@raptorengineeringinc.com>
 <eee9b0ff-dae7-4613-8c63-fed1043e047c@kernel.dk>
 <414471427.46558741.1699728159797.JavaMail.zimbra@raptorengineeringinc.com>
 <634718570.46592899.1699739843363.JavaMail.zimbra@raptorengineeringinc.com>
 <172487905.47043248.1699895175662.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <172487905.47043248.1699895175662.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/23 10:06 AM, Timothy Pearson wrote:
> ----- Original Message -----
>> From: "Timothy Pearson" <tpearson@raptorengineering.com>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "Jens Axboe" <axboe@kernel.dk>, "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov"
>> <asml.silence@gmail.com>
>> Sent: Saturday, November 11, 2023 3:57:23 PM
>> Subject: Re: Regression in io_uring, leading to data corruption
>>
>> Unfortunately I got led down a rabbit hole here.  With the tests I was running,
>> MariaDB writes the encrypted data separately from the normal un-encrypted page
>> header and checksums, and the internal encrpyted data on disk was corrupt while
>> the outer page checksum was still valid.
>>
>> I have since switched to the main.xa_prepared_binlog_off test, which shows the
>> corruption more easily in the on-disk format.  We are still apparently dealing
>> with a write path issue, which makes more sense given the nature of the
>> corruption observed on production systems.
> 
> Quick status update -- after considerable effort applied I've managed
> to narrow down what is going wrong, but still need to locate the root
> cause.  The bug is incredibly timing-dependent, therefore it is
> difficult to instrument the code paths I need without causing it to
> disappear.
> 
> What we're dealing with is a wild write to RAM of some sort, provoked
> by the exact timing of some of the encryption tests in mariadb.  I've
> caught the wild write a few times now, it is not in the standard
> io_uring write path but instead appears to be triggered (somehow) by
> the io worker punting process.
> 
> When the bug is hit, and if all other conditions are exactly correct,
> *something* (still to be identified) writes 32 bytes of gibberish into
> one of the mariadb in-RAM database pages at a random offset.  This
> wild write occurs right before the page is encrypted for write to disk
> via io_uring.  I have confirmed that the post-encryption data in RAM
> is written to disk without any additional corruption, and is then read
> back out from disk into the page verification routine also without any
> additional corruption.  The page verification routine decrypts the
> data from disk, thus restoring the decrypted data that contains the
> wild write data stamped somewhere on it, where we then hit the
> corruption warning and halt the test run.
> 
> Irritatingly, if I try to instrument the data flow in the application
> right before the encryption routine, the bug disappears (or, more
> precisely, is masked).  If I had to guess from these symptoms, I'd
> suspect the application io worker thread is waking up, grabbing wrong
> context from somewhere, and scribbling some kind of status data into
> memory, which rarely ends up being on top of one of the in-RAM
> database pages.  This could be an application issue or a kernel issue,
> I'm not sure yet, but given the precise timing requirements I'm less
> and less surprised this is only showing on ppc64 right now.
> 
> As always, investigation continues...

I wonder if this has to do with copy_thread() on powerpc - so not
necessarily ppc memory ordering related, but just something in the arch
specific copy section.

I took a look back, and the initial change actually forgot ppc. Since
then, there's been an attempt to make this generic:

commit 5bd2e97c868a8a44470950ed01846cab6328e540
Author: Eric W. Biederman <ebiederm@xmission.com>
Date:   Tue Apr 12 10:18:48 2022 -0500

    fork: Generalize PF_IO_WORKER handling

and later a powerpc change related to that too:

commit eed7c420aac7fde5e5915d2747c3ebbbda225835
Author: Nicholas Piggin <npiggin@gmail.com>
Date:   Sat Mar 25 22:29:01 2023 +1000

    powerpc: copy_thread differentiate kthreads and user mode threads

Just stabbing in the dark a bit here as I won't pretend to understand
the finer details of powerpc thread creation, but maybe try with this
and see if it makes any difference.

As you note in your reply, we could very well be corrupting some bytes
somewhere every time. We just only notice quickly when it happens to be
in that specific buffer.

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 392404688cec..d4dec2fd091c 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1758,7 +1758,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 
 	klp_init_thread_info(p);
 
-	if (unlikely(p->flags & PF_KTHREAD)) {
+	if (unlikely(p->flags & (PF_KTHREAD | PF_IO_WORKER))) {
 		/* kernel thread */
 
 		/* Create initial minimum stack frame. */

-- 
Jens Axboe

