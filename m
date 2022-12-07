Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4692D2102
	for <regressions@lists.linux.dev>; Wed,  7 Dec 2022 16:22:48 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id z144so7790762iof.3
        for <regressions@lists.linux.dev>; Wed, 07 Dec 2022 08:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bn9I9xV79fJUCgoxsa3ub+uGmmlj3Tv0J26ZcN9So2c=;
        b=oktSzxAShr3BHoD72bP4RFPVPK2PQ9754FcMwUZLSN4JtDJnGYSSmZWOGHv94kk8p2
         hRwss1tlAVG7p8Av2GnMo81SayC6jYcGxuvgfQjOmrGY3anuIuUmHTnrOwK4bjFlrHLH
         8X2zXyi3q6BymHi1hN9CxD5+hoxVUb4cv+kVB+LerzeBetWY4WfSZ5+f327qAreMbIrn
         68t4pMOeqqBpF9HLmnL9+4GnvtxCjB6tGckAQYSJQEdBSt77fS7PfaRqOq6S74eXp1OI
         HyGz4pZzTJh8yNYLubKPUaRkK+fiekioy/q9ElL9E6hHGOMvjaC1n0ZrZ+A9RVFAaNNK
         rmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bn9I9xV79fJUCgoxsa3ub+uGmmlj3Tv0J26ZcN9So2c=;
        b=lSmbNAh7qhwdz7cV2u+TmoFn477mL+hbEe+rduzf9HgNU7MI5bV1CRC1DBdPoXqNLv
         zLeftSlzGOwPfazwzZ4+ttBwjre0wRsezpyIpZdGJnEHHoSoDGNc4UbZF4QdGJUg46XF
         0iQj5K8DHZQo+72IaQulUzMaGFFVkEqdUCsl97UiazMgLT2hlSpnWfNSXD2IC5wBFlPV
         BGr2B/v3csTSMs6exqNVk7qt6DQL9pplXGyzp8zN/6rDu53a8wkOrFG0bMTDdORjta3B
         f6JSmXXk2u5BxB4SpCQ7TZl45oQjwE2GgJRk7uSDiKhHr86nT1abRy2EF0+w6LTBvUWy
         Ka5g==
X-Gm-Message-State: ANoB5pmSKJeLwn8hWnPE6GvSHVUlpXv8/ICc1KQPpC+SpYrGXq8n33uI
	hN5DYf4sJFg2iRo99lNohtKDwA==
X-Google-Smtp-Source: AA0mqf4ybGl8vC1UVIEO3y/JfQbgJP/6fnnH7vd2PgBXxTLGzha4ra0sC3Q2OFIDuj9XNhFK1cMt4Q==
X-Received: by 2002:a02:334d:0:b0:376:22fe:5e7c with SMTP id k13-20020a02334d000000b0037622fe5e7cmr43131407jak.126.1670430167275;
        Wed, 07 Dec 2022 08:22:47 -0800 (PST)
Received: from [192.168.1.94] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id p12-20020a056e0206cc00b00302f958e71dsm7202366ils.49.2022.12.07.08.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 08:22:46 -0800 (PST)
Message-ID: <b7d8193c-7e15-f5cd-08d4-8ef788d9bb36@kernel.dk>
Date: Wed, 7 Dec 2022 09:22:45 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: next: LTP: syscalls: epoll_clt() if fd is an invalid fd expected
 EBADF: EINVAL (22)
Content-Language: en-US
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 LTP List <ltp@lists.linux.it>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 chrubis <chrubis@suse.cz>
References: <CA+G9fYv_UU+oVUbd8Mzt8FkXscenX2kikRSCZ7DPXif9i5erNg@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CA+G9fYv_UU+oVUbd8Mzt8FkXscenX2kikRSCZ7DPXif9i5erNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/7/22 8:58?AM, Naresh Kamboju wrote:
> LTP syscalls epoll_ctl02 is failing on Linux next master.
> The reported problem is always reproducible and starts from next-20221205.
> 
> GOOD tag: next-20221202
> BAD tag: next-20221205
> 
> tst_test.c:1524: TINFO: Timeout per run is 0h 05m 00s
> epoll_ctl02.c:87: TPASS: epoll_clt(...) if epfd is an invalid fd : EBADF (9)
> epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd does not support epoll : EPERM (1)
> epoll_ctl02.c:87: TFAIL: epoll_clt(...) if fd is an invalid fd
> expected EBADF: EINVAL (22)
> epoll_ctl02.c:87: TPASS: epoll_clt(...) if op is not supported : EINVAL (22)
> epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is the same as epfd : EINVAL (22)
> epoll_ctl02.c:87: TPASS: epoll_clt(...) if events is NULL : EFAULT (14)
> epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is not registered with
> EPOLL_CTL_DEL : ENOENT (2)
> epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is not registered with
> EPOLL_CTL_MOD : ENOENT (2)
> epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is already registered
> with EPOLL_CTL_ADD : EEXIST (17)

This should fix it:


diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index ec7ffce8265a..de9c551e1993 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -2195,6 +2195,7 @@ int do_epoll_ctl(int epfd, int op, int fd, struct epoll_event *epds,
 	}
 
 	/* Get the "struct file *" for the target file */
+	error = -EBADF;
 	tf = fdget(fd);
 	if (!tf.file)
 		goto error_fput;

-- 
Jens Axboe
