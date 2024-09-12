Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9242018E03D
	for <regressions@lists.linux.dev>; Thu, 12 Sep 2024 22:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726180233; cv=none; b=b856CoPEDpX3rNqQA4m8nJROkPDe77fmjaCyX0vlqV9z0dvr4gJGd6Ifb9jWlxcVZW7rtKTTM1yNCjeO8HF9aJPjj04mFoij0xOqgVguFTphkTGNEVlSSt8oM63nVlLfHzHqh2bbIoXHSkHNw4R1EfBG5RSDR73YxQX8uRLAF6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726180233; c=relaxed/simple;
	bh=4tbk8G/VDY81O229gvF6PriMvRVhPd18JVOse4OhW/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LvpGqB5t7bL9mS0azNUk0MXebmc8nuQeW/nYo/aXzbs3fVAmiNmhsEK6dAUqfTmnVORi8eccS4M2ezO6I1ZCc75zqVi3NprSa4M8PukyVmA480KIRWxK7DBtK85z+WRiRxCNNVNDqDsmP3MTSnJeMG3Yqu28Zary26DT8b62rr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=cd73UazB; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="cd73UazB"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7d4f8a1626cso169331a12.3
        for <regressions@lists.linux.dev>; Thu, 12 Sep 2024 15:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1726180231; x=1726785031; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ONdBPIMyzZ6xU3izITaSKx2Q8d20ZvtQqwKOGE5YIUM=;
        b=cd73UazBx4g7RGyAhk3EVcJknPP+uhjkG096jtbUEiox+9PAGqT24bBGUs61PimPKJ
         k/jlJJcBTX1z80zymUVmhHj8eRsikZRkCs0GABY5wzxDJtF4YY352vtAHfSY2eXPL1P3
         +HhL+flwfoiePYyiljd9DKRolej8M46NvtMieAT9W39wtnUUknOjAivPpAw6LL6XcaCF
         KtUGNMwA6JFWO+RobYYkxaAHT1FIe5Sf/BbBcRl43Xood+QXmUOJhLQpkZmWuEScg7gW
         ERTrlu47PoekZDeiTWjd2fprqitKG7ctHmtHrTMNq5QHVF/Y+TVjHUh42Tnw8xFZ+vPb
         oEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726180231; x=1726785031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ONdBPIMyzZ6xU3izITaSKx2Q8d20ZvtQqwKOGE5YIUM=;
        b=DTBvDXYD19BNj2KVD8Yv1Yx7WwCQQ3Em5vACarcMw6dnlYGBMYBnuNiZH6QJI1U3hq
         MdirK/YemfKEdKFTxTe3G4NrrKx6u5iUojv6ulYOpV0vNs9I0jFVtQO0d/k6xVxjoNLf
         /m0Xk562Lt/crGfaxrJujZ+nCaB+ZAlva6ZWtyG1xOUQ2FdXMWMvjdgLibzdMOmYRcF7
         QMjLhr1N1VqfoibJslj1jGGn6yYXkd3XWgAVN9/gNwVhsumCyi63nPCFr3oABjBHsXBk
         /zW7dGnC90gCjnhsPc5d7Wctuq34n1ULTUGhqT9c1jDl6oAPYkXld23Zzg37DypUpdy6
         WbYg==
X-Forwarded-Encrypted: i=1; AJvYcCWGH+ovWXdpOn0pctglFEcJ3B6EugdE2xXR0mk2Y6J+XJsrO6Xmxo39MOpbmH7hwCDWrMPZTpR9iQFAEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoJtD/Hbu7PMMvCOZmVhgje6t4ASMfCfnuGcKK0QfWNG2olbgM
	87rF6BxaSD5FqIy+t3Goxt7SIak0ME9iPSyFCSiFhGFoUiKOUi58paYineKtiZY=
X-Google-Smtp-Source: AGHT+IELxGffTm/vOTCU6GKkLGts7f4oggk+OaSXCHB4wd3tdF/80Vdf6npvarkwyjy+x+jlAgsX7w==
X-Received: by 2002:a05:6a21:398a:b0:1cf:21c7:2aff with SMTP id adf61e73a8af0-1d112cbc058mr1046793637.23.1726180230753;
        Thu, 12 Sep 2024 15:30:30 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719090d5204sm5031966b3a.209.2024.09.12.15.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 15:30:30 -0700 (PDT)
Message-ID: <415b0e1a-c92f-4bf9-bccd-613f903f3c75@kernel.dk>
Date: Thu, 12 Sep 2024 16:30:28 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>,
 Christian Theune <ct@flyingcircus.io>, linux-mm@kvack.org,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Dao <dqminh@cloudflare.com>, Dave Chinner <david@fromorbit.com>,
 clm@meta.com, regressions@lists.linux.dev, regressions@leemhuis.info
References: <A5A976CB-DB57-4513-A700-656580488AB6@flyingcircus.io>
 <ZuNjNNmrDPVsVK03@casper.infradead.org>
 <0fc8c3e7-e5d2-40db-8661-8c7199f84e43@kernel.dk>
 <CAHk-=wh5LRp6Tb2oLKv1LrJWuXKOvxcucMfRMmYcT-npbo0=_A@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAHk-=wh5LRp6Tb2oLKv1LrJWuXKOvxcucMfRMmYcT-npbo0=_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/12/24 4:25 PM, Linus Torvalds wrote:
> On Thu, 12 Sept 2024 at 15:12, Jens Axboe <axboe@kernel.dk> wrote:
>>
>> When I saw Christian's report, I seemed to recall that we ran into this
>> at Meta too. And we did, and hence have been reverting it since our 5.19
>> release (and hence 6.4, 6.9, and 6.11 next). We should not be shipping
>> things that are known broken.
> 
> I do think that if we have big sites just reverting it as known broken
> and can't figure out why, we should do so upstream too.

Agree. I suspect it would've come up internally shortly too, as we're
just now preparing to roll 6.11 as the next kernel. That always starts
with a list of "what commits are in our 6.9 tree that aren't upstream"
and then porting those, and this one is in that (pretty short) list.

> Yes,  it's going to make it even harder to figure out what's wrong.
> Not great. But if this causes filesystem corruption, that sure isn't
> great either. And people end up going "I'll use ext4 which doesn't
> have the problem", that's not exactly helpful either.

Until someone has a good reproducer for it, it is going to remain
elusive. And it's a two-liner to enable it again for testing, hence
should not be a hard thing to do.

> And yeah, the reason ext4 doesn't have the problem is simply because
> ext4 doesn't enable large folios. So that doesn't pin anything down
> either (ie it does *not* say "this is an xfs bug" - it obviously might
> be, but it's probably more likely some large-folio issue).
> 
> Other filesystems do enable large folios (afs, bcachefs, erofs, nfs,
> smb), but maybe just not be used under the kind of load to show it.

It might be an iomap thing... Other file systems do use it, but to
various degrees, and XFS is definitely the primary user.

> Honestly, the fact that it hasn't been reverted after apparently
> people knowing about it for months is a bit shocking to me. Filesystem
> people tend to take unknown corruption issues as a big deal. What
> makes this so special? Is it because the XFS people don't consider it
> an XFS issue, so...

Double agree, I was pretty surprised when I learned of all this today.

-- 
Jens Axboe
