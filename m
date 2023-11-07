Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE0B31584
	for <regressions@lists.linux.dev>; Tue,  7 Nov 2023 16:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="zheSXn9o"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ca85ff26afso11372185ad.1
        for <regressions@lists.linux.dev>; Tue, 07 Nov 2023 08:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699375776; x=1699980576; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q2hso7TNl85Xaal4DiZs6VjVpHGfN+xq+yKn/f7nHe8=;
        b=zheSXn9oBPuhZO/tjcc7o677yBfbVjsENnejI/E0dmgmNJ49hx2FcYOlXvn+7VWS0R
         7CDOdH9ZO6cnGwf/9dYhoG0ehLclE20MJoAGvs5L0hUpbJv+npyAOInxJQfuvqhjfYea
         KnwHXz+wf7gEzS+ktqoIgGobbvoUoDNacLdxQGfgZIsIsfL08LwiVwh85J/ps8y5Rxr5
         DwJ7GBDJDCilZbqSM43MVH3/NlQJqBQOmmc9b6yBpM+qMDacRgdPrBuFrWretZyCKnGX
         SbcVowL8Z+cBp0gXPVlUcfgYNutkHGv1Yi+8yFaXYkSELF+hglldE1ez/7idZvKhRs89
         yl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699375776; x=1699980576;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q2hso7TNl85Xaal4DiZs6VjVpHGfN+xq+yKn/f7nHe8=;
        b=URGdRVkH3yP0mtiiCue+FCW++ISDeNE8/Qh4SR845sjKjpJTjNrfdfVbBj88b3GC4T
         ad8IY5TKCho0IVYCQ1q2BKaxgtucyZI8IhWwbfxTq+yZ5VikFmaH/BJGh6a8TmHx7iCB
         rfoN05v+JuuCzKFuogjH7SLtD39YFaMrvP5je4XQN1R8+I//lp6CMQXI21kh7/irR5m9
         uauCgBRLyx6cSWSDoKgAStbqYsOLIgERB/d4yUohfwvlnwzuCbpr96DdFNkWGgX722KD
         ukKeSEabh4wWZ/4ASPS8NNaHVn6KW3t6zSNs85KIsirNig6N2ctlcxyEHgv8ph8YSYf9
         PiTw==
X-Gm-Message-State: AOJu0YwPqcNcVZSAfUVTe99XKb/uKF8/b1QMR1MOtPOtPnGwDUhCF8QZ
	LpHVKVq3d23jxmBzbRxZF9kRNQ==
X-Google-Smtp-Source: AGHT+IHuuqGJVrbGr/mchFVrxX9hiFlN3n8/weLfcRxS2rSKHWrLRfzO6Fla2wuA2arTRzvNXweFXA==
X-Received: by 2002:a17:903:3406:b0:1cc:3b88:78b with SMTP id ke6-20020a170903340600b001cc3b88078bmr26103002plb.6.1699375775684;
        Tue, 07 Nov 2023 08:49:35 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902e74400b001cc4fe8c6adsm46225plf.253.2023.11.07.08.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 08:49:35 -0800 (PST)
Message-ID: <eb4f04b9-1bbf-489d-88ee-7ad7e4fb455b@kernel.dk>
Date: Tue, 7 Nov 2023 09:49:34 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in io_uring, leading to data corruption
Content-Language: en-US
To: Timothy Pearson <tpearson@raptorengineering.com>,
 regressions@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/23 9:34 AM, Timothy Pearson wrote:
> I have spent some considerable effort tracking down a bug that appears
> to be present in the io_uring workqueue.  As I have not yet been able
> to isolate the exact cause, I would like to solicit ideas from the
> developers / maintainers of the io_uring system.  This regression
> persists into the latest kernel GIT head, and is only reliably
> reproduceable under fairly exacting conditions.
> 
> In GIT hash 685fe7fe the workqueue manager thread was removed and
> replaced with code that allows the workqueues to manage their own
> workers.  This has the unfortunate side effect of exposing what I
> believe to be an existing timing-dependent race condition somewhere
> else within the kernel.  On a ppc64el host, I can reliably trigger
> data corruption on what I believe to be writes by running the
> following mysql mtr sequence:
> 
> ./mtr encryption.innodb-discard-import --repeat=100 --force
> 
> This results in corruption of the data being written to disk --
> reverting 685fe7fe resolves the issue by (I believe) masking it
> through changes in workqueue inter-thread timing.
> 
> I can make the corruption disappear by adding a 1ms busy wait delay
> into io_wqe_dec_running().  This appears to alter the timing of
> something in the io_uring system just enough to make the (presumed)
> data race disappear.  KASAN and KCSAN do not show any issues, nor does
> the lock debugger, yet a corruption problem that disappears with a
> delay is indicative of a race somewhere.  The delay primary impacts
> how long the IRQ lock is held, if the delay is moved outside of the
> IRQ locked section the corruption returns.
> 
> I have already tried adding memory barriers etc. to the code paths in
> question, with no effect.  The exact same issue persists on the latest
> kernel versions.
> 
> Thoughts welcome -- this is a serious issue causing data corruption on
> production systems.

I looked into this for quite a while back in March, see my initial
postings on it here:

https://lore.kernel.org/all/2b015a34-220e-674e-7301-2cf17ef45ed9@kernel.dk/

it unfortunately never got anywhere, and as far as I can tell, this is
most likely a page cache or ordering issue on the ppc side. I no longer
have hardware to test with, and not really a huge inclination to dive
into this again as it's hugely time consuming and doesn't seem to be an
io_uring issue to begin with, but I'd be happy to help out with this.

Back then I looked into getting some ppc hardware to test with for
this very reason, and even reached out to various manufacturers to see
if they would be able to lend/give me some. Didn't pan out, and ended
up using a university vm for it.

-- 
Jens Axboe

