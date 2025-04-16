Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4110522ACD3
	for <regressions@lists.linux.dev>; Wed, 16 Apr 2025 20:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744835214; cv=none; b=i+y2pxVfHrwPAbsuFWNg67AwTkerehVG0cEm/TY+40Fd6FIBA4tU+tuVNJmLUYUVmnr/Xf2pL6Z5FRAQaNxLEzUQe4xrcjd/twr788sWZOyr/2lJbyCozEE22FWeNhT6apW1Y66wrJ6f1Z1oWu8dfcv+Yn8dPtdrTIOmyAum52Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744835214; c=relaxed/simple;
	bh=+NVEIDajjOa6S0mwO8uDhLAW9+C2KQqJgF0nDKTn3hM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TDQpSzVeipS9pSDSLcap2yVxFPhuKClWlBN81XxK1mgs636c9A0WIddNV4zkQfmY++YQgbOzklGzBlp8kjs5xGl4m5dJ5t6XV+5VgTxjeE6OUk0bMeTKDQp74drZINy6ardAolZEPyIHmXYmLgWVH9/MPWk4nljsqUFN1tftUdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LTuMOFXV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LTuMOFXV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744835212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6AVDplNPTi289CSbOZ9ARQJAN0z0vy8/1A9VIws9D4=;
	b=LTuMOFXVp2y/fyLkhE5C/W7nV3vj0wgfRBr1Q6DnkM/0L6r6Jzu3fTw0ICCfWXB9DziUpY
	dAdbJhmAnqIrL+OqoFHRR92+nBQtwvemwkuE7iNXodZFL+ynZBLj8EELn/C553c0jKl9IO
	UBYLzlDshiTI1xfnf1VeDxNJdeGrSlE=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-9TiIMmE0OquKRQbrIOiP3w-1; Wed, 16 Apr 2025 16:26:50 -0400
X-MC-Unique: 9TiIMmE0OquKRQbrIOiP3w-1
X-Mimecast-MFC-AGG-ID: 9TiIMmE0OquKRQbrIOiP3w_1744835210
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-8614a8474f6so733039f.3
        for <regressions@lists.linux.dev>; Wed, 16 Apr 2025 13:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744835210; x=1745440010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6AVDplNPTi289CSbOZ9ARQJAN0z0vy8/1A9VIws9D4=;
        b=eZb+RwGPyIuzGH0TYIohhtjyD1FGVEEuMder7IHqHGJ2Bu+RXhv74p3gGFA7SCNUM0
         L1RYfXrSAGTLDfJYD1o7lQU9OuuHFUYuNn4U7SI+llHzBij9fV7jKxbvfP/IB8K9pdEr
         ALvJks4nukup4zAhDwWr294X8DUjCS5Io50ehYCto4ltwkfrI9IyZMRy8qMJ4YGfvpYW
         diu5Vqsshv0QJYwGMKFgs9kuZynMR2j5HvU945q/CrRczuhjDv3BNkcr9aInx1L3YJKJ
         fhILjvgY0SmqWrBhJj1P8jHwlEe9a6nYRp/fVMr2h4RjvWgTSgo7Fr77DpSMDnKPPAkh
         6uRg==
X-Forwarded-Encrypted: i=1; AJvYcCUH1KbgTdAfV/zIcg5wd/ofRwGCKSwqgwy1fYc+k2Yw8cvJ1M1f28Sj0UfAAts8VyJh3iE1zIvGuTrNqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcFQqH0R4q7RpdQAAQMME5h3KUbwPBmS+E3jkDRR3roKqrtMqp
	qHjNlRhiB/6DUCImgQuQizulUQqj80sKgOpQBuOO2ZeT2uByUToymS4iC8Lqa86pKcYRfdTsvz4
	7v08QkQid+2O0b9sQrkSAfVDvq+ejWYQn14pqraG+BsfPJFS8FX6cEekCo25g
X-Gm-Gg: ASbGncuf7Y3WLoap/LCLNXhxEcl2d8DTZ+48Qhr8qmlGGPwebGBxE28cpRythlMt52S
	rGEQ5TXul07ednl8IMw3PMwcxMhxzLVYIqXgSghkAemXJryCAj61WJyb3kSAN74oLkKRepDKDA1
	RVz3/P4L+5NBCgyc0ShI94wzwiMH9BdhlIRmpCWtyCUt76L4bZFrPz09HOsi+9/WP4a86yX5/9Y
	6pn3F4UynlTL5xyOs1dun9wXnVmw9MN8CIC1ehNChmtOgex1QsiLl7RCMGBGYsiYpysxCW0xVSg
	EM0fVA3glcOeXVs=
X-Received: by 2002:a05:6602:1583:b0:856:2a52:ea02 with SMTP id ca18e2360f4ac-861cc5cfb48mr34533539f.5.1744835209676;
        Wed, 16 Apr 2025 13:26:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdbc3yXRCu1SxHof01X2wIaipkMkSkrZJncD3XrTLmdj2ulJ1ktFsxzmI+33GyeGFuM7i9VQ==
X-Received: by 2002:a05:6602:1583:b0:856:2a52:ea02 with SMTP id ca18e2360f4ac-861cc5cfb48mr34532239f.5.1744835209342;
        Wed, 16 Apr 2025 13:26:49 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8616522d048sm306863539f.1.2025.04.16.13.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:26:48 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:26:45 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: David Howells <dhowells@redhat.com>, Christoph Hellwig
 <hch@infradead.org>, David Hildenbrand <david@redhat.com>, Lorenzo Stoakes
 <lstoakes@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Jens Axboe
 <axboe@kernel.dk>, Al Viro <viro@zeniv.linux.org.uk>, Matthew Wilcox
 <willy@infradead.org>, Jan Kara <jack@suse.cz>, Jeff Layton
 <jlayton@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, Logan Gunthorpe
 <logang@deltatee.com>, Hillf Danton <hdanton@sina.com>, Christian Brauner
 <brauner@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Sasha
 Levin <sashal@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 regressions@lists.linux.dev, table@vger.kernel.org, Bernd Rinn
 <bb@rinn.ch>, Karri =?UTF-8?B?SMOkbcOkbMOkaW5lbg==?=
 <kh.bugreport@outlook.com>, Milan Broz <gmazyland@gmail.com>, Cameron
 Davidson <bugs@davidsoncj.id.au>, Markus <markus@fritz.box>
Subject: Re: [regression 6.1.y] Regression from 476c1dfefab8 ("mm: Don't pin
 ZERO_PAGE in pin_user_pages()") with pci-passthrough for both KVM VMs and
 booting in xen DomU
Message-ID: <20250416142645.4392a644.alex.williamson@redhat.com>
In-Reply-To: <Z_6sh7Byddqdk1Z-@eldamar.lan>
References: <Z_6sh7Byddqdk1Z-@eldamar.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3etNEBgfVsfvqnGJR_KAXTRTcqr9YjVUiUgcMUOuwAE_1744835210
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Apr 2025 20:59:19 +0200
Salvatore Bonaccorso <carnil@debian.org> wrote:

> Hi
> 
> [Apologies if this has been reported already but I have not found an
> already filled corresponding report]
> 
> After updating from the 6.1.129 based version to 6.1.133, various
> users have reported that their VMs do not boot anymore up (both KVM
> and under Xen) if pci-passthrough is involved. The reports are at:
> 
> https://bugs.debian.org/1102889
> https://bugs.debian.org/1102914
> https://bugs.debian.org/1103153
> 
> Milan Broz bisected the issues and found that the commit introducing
> the problems can be tracked down to backport of c8070b787519 ("mm:
> Don't pin ZERO_PAGE in pin_user_pages()") from 6.5-rc1 which got
> backported as 476c1dfefab8 ("mm: Don't pin ZERO_PAGE in
> pin_user_pages()") in 6.1.130. See https://bugs.debian.org/1102914#60
> 
> #regzbot introduced: 476c1dfefab8b98ae9c3e3ad283c2ac10d30c774
> 
> 476c1dfefab8b98ae9c3e3ad283c2ac10d30c774 is the first bad commit
> commit 476c1dfefab8b98ae9c3e3ad283c2ac10d30c774
> Author: David Howells <dhowells@redhat.com>
> Date:   Fri May 26 22:41:40 2023 +0100
> 
>     mm: Don't pin ZERO_PAGE in pin_user_pages()
> 
>     [ Upstream commit c8070b78751955e59b42457b974bea4a4fe00187 ]

It's a bad backport, I've debugged and posted the fix for stable here:

https://lore.kernel.org/all/20250416202441.3911142-1-alex.williamson@redhat.com/

Thanks,
Alex

