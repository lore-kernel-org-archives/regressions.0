Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E9A26AED
	for <regressions@lists.linux.dev>; Tue,  1 Oct 2024 02:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727749385; cv=none; b=ekhYKXkgfHCXvmfy6/onH0TinZygrRTCHA9GlC6rkRelKQknQr2sKAudCOAVo9p/weZQpAPeayZORi+FuNp0SNMw4yvlBIq1jctOTpIaOSJJyMWp3jibh5vYTxH+lTDe98U1YOT355PHzljfxrvNXNjlidYZH7MO6ze58mk64yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727749385; c=relaxed/simple;
	bh=QZmAJyZ9UDzU+NVCWKwlqRikM8II/qcww+fKZE/rahE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TO+iPWL1wiGjwpC6MqW1mJi2yK48u1sOyNyE5HNk0o1wxjaR0oBUB6ihB99c34EeLwVp2Em6hf2WPaEZFD2TCZQ+fS3NYvq0NE/CghTrN9rR3DMlNWv+leg0sw4VdWsiDVFLErrVciO3Y3+k9xxEnln7sFC1FoYm/7MvnGzOFgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=023A5SXz; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="023A5SXz"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20b1335e4e4so45731495ad.0
        for <regressions@lists.linux.dev>; Mon, 30 Sep 2024 19:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1727749382; x=1728354182; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fphHfnJEcRT+CCCigEf6BbGzPILMR7P2aFDlWYLdau0=;
        b=023A5SXz6rzNDHpprw+wTfM783vWxqXS368SHwU4ELdlxW7/hpshGrX6ZwVynkCi/H
         uVYEkDSm7GYDqtEJRvYg7vqXfR4u7QDS48TKc3b5xzv7N3ZgsNRU1oIaOaz6ia49AH8l
         XEL8uIQpvZgthDk95h6RJ/2UQTjpPl11YxAEaoo8PxQQmR4wHpllZUQYUTHNdhdS+947
         phiUUTxiV3yXbEe3+bZLIzVSLp/TttxbHqBoW8vVHuw8ZDYyhztCCSOCVo667Ll6JQY3
         iBI4yPqAguK9KXBg7awgkaFm2wcIUmKkETkfs7QAokxUjWxJ0yBU5Mv4H4t02kk4u+Mz
         wTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727749382; x=1728354182;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fphHfnJEcRT+CCCigEf6BbGzPILMR7P2aFDlWYLdau0=;
        b=c2hBmtZ/Gug3w1tH/JxLErH/CeBKh1pyM9FmfjKRgl7VP/HttsqgcXamRqPasTRrs3
         V0XoqA7RMV4LX/X7Lo6C3Wce5blHlvPkuvhN9/QrTand1G0vZ7Kh8TAym3S9uH1D7ZTU
         vLZb0AnhlGIn6a2xxsqJ8bYYNL4XdkxyWwo+IkkQJoLMdE5LC9co8Z87e4y8/Spszeli
         eKUiIadFgOgLXNUl89l0UkvBM/DAAWoN+iUj5DpcAdSp93kvWzy7KBdqj6fvGjTk5Yuy
         lVFGAjVDQS0bDcSmUkN3THCGFmk34MXWcYSw6HThzmG1wE5jKs60tiP6kKF7sMdpD3Og
         JBlA==
X-Forwarded-Encrypted: i=1; AJvYcCUi3LaleQNsrTqxvGwE4I8kga3KNVwKgoR6epPqUXfhrbfiODMymhGheqmXaNaOMG0KNHQuDwOUG9tqGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6GrWMC0S3D+NxjA029D3cO/7AEiOWQvDowHjuScZe+DDmiZT6
	TK+kL9U1EKzHyXn94HsE92MNxfRdIXG9v7NGibvcKDw3iihlmYGVlfSqUrSv/zw=
X-Google-Smtp-Source: AGHT+IEIi8UX+/6HPP0XEhI/lnEGGmhElhXWLrtHf1wP23Nef5qBLLRm8LL8M7x5tzM1YwV1gXAbcA==
X-Received: by 2002:a17:903:41c3:b0:205:5582:d650 with SMTP id d9443c01a7336-20b37bfaae6mr212256425ad.52.1727749382508;
        Mon, 30 Sep 2024 19:23:02 -0700 (PDT)
Received: from dread.disaster.area (pa49-179-78-197.pa.nsw.optusnet.com.au. [49.179.78.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37d5edbbsm60978415ad.13.2024.09.30.19.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 19:23:01 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1svSXT-00CJIe-0I;
	Tue, 01 Oct 2024 12:22:59 +1000
Date: Tue, 1 Oct 2024 12:22:59 +1000
From: Dave Chinner <david@fromorbit.com>
To: Christian Theune <ct@flyingcircus.io>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@meta.com>,
	Jens Axboe <axboe@kernel.dk>, linux-mm@kvack.org,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Dao <dqminh@cloudflare.com>, regressions@lists.linux.dev,
	regressions@leemhuis.info
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
Message-ID: <ZvtdA2A8Ub9v5v3a@dread.disaster.area>
References: <5bee194c-9cd3-47e7-919b-9f352441f855@kernel.dk>
 <459beb1c-defd-4836-952c-589203b7005c@meta.com>
 <ZurXAco1BKqf8I2E@casper.infradead.org>
 <ZuuBs762OrOk58zQ@dread.disaster.area>
 <CAHk-=wjsrwuU9uALfif4WhSg=kpwXqP2h1ZB+zmH_ORDsrLCnQ@mail.gmail.com>
 <CAHk-=wgQ_OeAaNMA7A=icuf66r7Atz1-NNs9Qk8O=2gEjd=qTw@mail.gmail.com>
 <E6728F3E-374A-4A86-A5F2-C67CCECD6F7D@flyingcircus.io>
 <CAHk-=wgtHDOxi+1uXo8gJcDKO7yjswQr5eMs0cgAB6=mp+yWxw@mail.gmail.com>
 <D49C9D27-7523-41C9-8B8D-82B2A7CBE97B@flyingcircus.io>
 <02121707-E630-4E7E-837B-8F53B4C28721@flyingcircus.io>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02121707-E630-4E7E-837B-8F53B4C28721@flyingcircus.io>

On Mon, Sep 30, 2024 at 07:34:39PM +0200, Christian Theune wrote:
> Hi,
> 
> we’ve been running a number of VMs since last week on 6.11. We’ve
> encountered one hung task situation multiple times now that seems
> to be resolving itself after a bit of time, though. I do not see
> spinning CPU during this time.
> 
> The situation seems to be related to cgroups-based IO throttling /
> weighting so far:

.....

> Sep 28 03:39:19 <redactedhostname>10 kernel: INFO: task nix-build:94696 blocked for more than 122 seconds.
> Sep 28 03:39:19 <redactedhostname>10 kernel:       Not tainted 6.11.0 #1-NixOS
> Sep 28 03:39:19 <redactedhostname>10 kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> Sep 28 03:39:19 <redactedhostname>10 kernel: task:nix-build       state:D stack:0     pid:94696 tgid:94696 ppid:94695  flags:0x00000002
> Sep 28 03:39:19 <redactedhostname>10 kernel: Call Trace:
> Sep 28 03:39:19 <redactedhostname>10 kernel:  <TASK>
> Sep 28 03:39:19 <redactedhostname>10 kernel:  __schedule+0x3a3/0x1300
> Sep 28 03:39:19 <redactedhostname>10 kernel:  schedule+0x27/0xf0
> Sep 28 03:39:19 <redactedhostname>10 kernel:  io_schedule+0x46/0x70
> Sep 28 03:39:19 <redactedhostname>10 kernel:  folio_wait_bit_common+0x13f/0x340
> Sep 28 03:39:19 <redactedhostname>10 kernel:  folio_wait_writeback+0x2b/0x80
> Sep 28 03:39:19 <redactedhostname>10 kernel:  truncate_inode_partial_folio+0x5e/0x1b0
> Sep 28 03:39:19 <redactedhostname>10 kernel:  truncate_inode_pages_range+0x1de/0x400
> Sep 28 03:39:19 <redactedhostname>10 kernel:  evict+0x29f/0x2c0
> Sep 28 03:39:19 <redactedhostname>10 kernel:  do_unlinkat+0x2de/0x330

That's not what I'd call expected behaviour.

By the time we are that far through eviction of a newly unlinked
inode, we've already removed the inode from the writeback lists and
we've supposedly waited for all writeback to complete.

IOWs, there shouldn't be a cached folio in writeback state at this
point in time - we're supposed to have guaranteed all writeback has
already compelted before we call truncate_inode_pages_final()....

So how are we getting a partial folio that is still under writeback
at this point in time?

-Dave.
-- 
Dave Chinner
david@fromorbit.com
